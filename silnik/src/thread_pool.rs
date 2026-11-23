//! Stała pula wątków z wynikami zadań i opróżnianiem kolejki przy zamykaniu.

use std::fmt;
use std::panic::{catch_unwind, AssertUnwindSafe};
use std::sync::{mpsc, Arc, Mutex};
use std::thread::{self, JoinHandle};

type Job = Box<dyn FnOnce() + Send + 'static>;

#[derive(Clone, Debug, Eq, PartialEq)]
pub enum TaskError {
    Panicked(String),
    Disconnected,
    PoolStopped,
}
impl fmt::Display for TaskError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Panicked(message) => write!(f, "Zadanie zakończyło się paniką: {message}"),
            Self::Disconnected => write!(f, "Kanał wyniku zadania został zamknięty"),
            Self::PoolStopped => write!(f, "Pula wątków została zatrzymana"),
        }
    }
}
impl std::error::Error for TaskError {}

pub struct TaskHandle<R> {
    receiver: mpsc::Receiver<Result<R, TaskError>>,
}
impl<R> TaskHandle<R> {
    pub fn join(self) -> Result<R, TaskError> {
        self.receiver.recv().unwrap_or(Err(TaskError::Disconnected))
    }
}

pub struct ThreadPool {
    sender: Option<mpsc::Sender<Job>>,
    workers: Vec<JoinHandle<()>>,
    worker_count: usize,
}
impl ThreadPool {
    /// Rozmiar puli musi być dodatni.
    pub fn new(worker_count: usize) -> Self {
        assert!(worker_count > 0, "Pula wymaga co najmniej jednego wątku");
        let (sender, receiver) = mpsc::channel::<Job>();
        let receiver = Arc::new(Mutex::new(receiver));
        let workers = (0..worker_count)
            .map(|index| {
                let receiver = Arc::clone(&receiver);
                thread::Builder::new()
                    .name(format!("ecs-worker-{index}"))
                    .spawn(move || loop {
                        // Blokada chroni wyłącznie pobranie zadania, nigdy jego wykonanie.
                        let next = receiver.lock().expect("Zatruta kolejka zadań").recv();
                        match next {
                            Ok(job) => job(),
                            Err(_) => break,
                        }
                    })
                    .expect("Nie udało się utworzyć wątku roboczego")
            })
            .collect();
        Self {
            sender: Some(sender),
            workers,
            worker_count,
        }
    }
    pub fn worker_count(&self) -> usize {
        self.worker_count
    }
    pub fn execute<R, F>(&self, task: F) -> TaskHandle<R>
    where
        R: Send + 'static,
        F: FnOnce() -> R + Send + 'static,
    {
        let (result_sender, receiver) = mpsc::channel();
        let Some(sender) = &self.sender else {
            let _ = result_sender.send(Err(TaskError::PoolStopped));
            return TaskHandle { receiver };
        };
        let job = Box::new(move || {
            let result = catch_unwind(AssertUnwindSafe(task)).map_err(|payload| {
                let message = if let Some(text) = payload.downcast_ref::<&str>() {
                    (*text).to_owned()
                } else if let Some(text) = payload.downcast_ref::<String>() {
                    text.clone()
                } else {
                    "Panikę zgłoszono bez komunikatu tekstowego".to_owned()
                };
                TaskError::Panicked(message)
            });
            // Porzucenie uchwytu przez odbiorcę nie przerywa pracy wątku.
            let _ = result_sender.send(result);
        });
        let _ = sender.send(job);
        TaskHandle { receiver }
    }
    /// Zwraca wyniki w kolejności wejścia, niezależnie od kolejności zakończenia zadań.
    pub fn map_owned<T, R, F>(&self, values: Vec<T>, f: F) -> Result<Vec<R>, TaskError>
    where
        T: Send + 'static,
        R: Send + 'static,
        F: Fn(T) -> R + Send + Sync + 'static,
    {
        let f = Arc::new(f);
        let handles: Vec<_> = values
            .into_iter()
            .map(|value| {
                let f = Arc::clone(&f);
                self.execute(move || f(value))
            })
            .collect();
        handles.into_iter().map(TaskHandle::join).collect()
    }
    /// Zamyka wejście kolejki i czeka na wszystkie przyjęte zadania.
    pub fn shutdown(&mut self) {
        self.sender.take();
        let current = thread::current().id();
        for worker in self.workers.drain(..) {
            if worker.thread().id() != current {
                let _ = worker.join();
            }
        }
    }
}
impl Drop for ThreadPool {
    fn drop(&mut self) {
        self.shutdown();
    }
}

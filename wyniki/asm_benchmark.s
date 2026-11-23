	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 0
	.file	"benchmark.5aa4c9b99defd8e9-cgu.0"
	.def	_RNvXsW_NtNtCs9N2lWLRSIT9_4core3fmt3nummNtB7_5Debug3fmt;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_RNvXsW_NtNtCs9N2lWLRSIT9_4core3fmt3nummNtB7_5Debug3fmt,unique,0
	.p2align	4
_RNvXsW_NtNtCs9N2lWLRSIT9_4core3fmt3nummNtB7_5Debug3fmt:
.Lfunc_begin0:
.seh_proc _RNvXsW_NtNtCs9N2lWLRSIT9_4core3fmt3nummNtB7_5Debug3fmt
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$64, %rsp
	.seh_stackalloc 64
	.seh_endprologue
	movl	16(%rdx), %eax
	testl	$33554432, %eax
	jne	.LBB0_11
	testl	$67108864, %eax
	jne	.LBB0_13
	movl	(%rcx), %ecx
	movl	$10, %r8d
	leaq	anon.354825e82484bf8db084d6d8db460509.146.llvm.10808108167014004223(%rip), %rax
	movl	%ecx, %r9d
	cmpl	$1000, %ecx
	jb	.LBB0_5
	movl	$3518437209, %r10d
	movl	%ecx, %r11d
	.p2align	4
.LBB0_4:
	movl	%r11d, %r9d
	imulq	%r10, %r9
	shrq	$45, %r9
	imull	$10000, %r9d, %esi
	movl	%r11d, %edi
	subl	%esi, %edi
	imull	$5243, %edi, %esi
	shrl	$19, %esi
	imull	$100, %esi, %ebx
	subl	%ebx, %edi
	movzwl	%di, %edi
	movzwl	(%rax,%rsi,2), %esi
	movd	%esi, %xmm0
	pinsrw	$1, (%rax,%rdi,2), %xmm0
	movd	%xmm0, 50(%rsp,%r8)
	addq	$-4, %r8
	cmpl	$9999999, %r11d
	movl	%r9d, %r11d
	ja	.LBB0_4
.LBB0_5:
	cmpl	$9, %r9d
	jbe	.LBB0_7
	movzwl	%r9w, %r10d
	shrl	$2, %r10d
	imull	$5243, %r10d, %r10d
	shrl	$17, %r10d
	imull	$100, %r10d, %r11d
	subl	%r11d, %r9d
	movzwl	%r9w, %r9d
	movzwl	(%rax,%r9,2), %r9d
	movw	%r9w, 52(%rsp,%r8)
	addq	$-2, %r8
	movl	%r10d, %r9d
.LBB0_7:
	testl	%ecx, %ecx
	je	.LBB0_9
	testl	%r9d, %r9d
	je	.LBB0_10
.LBB0_9:
	andl	$15, %r9d
	movzbl	1(%rax,%r9,2), %eax
	movb	%al, 53(%rsp,%r8)
	decq	%r8
.LBB0_10:
	movl	$10, %eax
	subq	%r8, %rax
	leaq	(%rsp,%r8), %rcx
	addq	$54, %rcx
	movq	%rax, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movl	$1, %r8d
	movq	%rdx, %rcx
	movb	$1, %dl
	xorl	%r9d, %r9d
	jmp	.LBB0_16
.LBB0_11:
	movl	(%rcx), %r9d
	xorl	%eax, %eax
	leaq	anon.354825e82484bf8db084d6d8db460509.1.llvm.10808108167014004223(%rip), %rcx
	movl	%r9d, %r8d
	.p2align	4
.LBB0_12:
	shrl	$4, %r8d
	andl	$15, %r9d
	movzbl	(%r9,%rcx), %r9d
	movb	%r9b, 61(%rsp,%rax)
	decq	%rax
	movl	%r8d, %r9d
	testl	%r8d, %r8d
	jne	.LBB0_12
	jmp	.LBB0_15
.LBB0_13:
	movl	(%rcx), %r9d
	xorl	%eax, %eax
	leaq	anon.354825e82484bf8db084d6d8db460509.354.llvm.10808108167014004223(%rip), %rcx
	movl	%r9d, %r8d
	.p2align	4
.LBB0_14:
	shrl	$4, %r8d
	andl	$15, %r9d
	movzbl	(%r9,%rcx), %r9d
	movb	%r9b, 61(%rsp,%rax)
	decq	%rax
	movl	%r8d, %r9d
	testl	%r8d, %r8d
	jne	.LBB0_14
.LBB0_15:
	leaq	(%rsp,%rax), %rcx
	addq	$62, %rcx
	negq	%rax
	movq	%rax, 40(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	anon.354825e82484bf8db084d6d8db460509.342.llvm.10808108167014004223(%rip), %r8
	movl	$2, %r9d
	movq	%rdx, %rcx
	movb	$1, %dl
.LBB0_16:
	callq	_RNvMsa_NtCs9N2lWLRSIT9_4core3fmtNtB5_9Formatter12pad_integral
	nop
	.seh_startepilogue
	addq	$64, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	.seh_endepilogue
	retq
.Lfunc_end0:
	.seh_endproc

	.def	_ZN11rust_ecs_3d3ecs11make_column17h3aeea9adf661ae55E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN11rust_ecs_3d3ecs11make_column17h3aeea9adf661ae55E,unique,1
	.p2align	4
_ZN11rust_ecs_3d3ecs11make_column17h3aeea9adf661ae55E:
.Lfunc_begin1:
.seh_proc _ZN11rust_ecs_3d3ecs11make_column17h3aeea9adf661ae55E
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movl	$24, %r8d
	xorl	%edx, %edx
	callq	_RNvNtNtNtCslk5dvTldH8g_3std3sys5alloc7windows18process_heap_alloc
	testq	%rax, %rax
	je	.LBB1_1
	movq	$0, (%rax)
	movq	$4, 8(%rax)
	movq	$0, 16(%rax)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.0(%rip), %rdx
	.seh_startepilogue
	addq	$40, %rsp
	.seh_endepilogue
	retq
.LBB1_1:
	movl	$8, %ecx
	movl	$24, %edx
	callq	_RNvNtCsgRIRWNK8DTq_5alloc5alloc18handle_alloc_error
	ud2
.Lfunc_end1:
	.seh_endproc

	.def	_ZN11rust_ecs_3d3ecs11make_column17hdf5c8365f5687efaE;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN11rust_ecs_3d3ecs11make_column17hdf5c8365f5687efaE,unique,2
	.p2align	4
_ZN11rust_ecs_3d3ecs11make_column17hdf5c8365f5687efaE:
.Lfunc_begin2:
.seh_proc _ZN11rust_ecs_3d3ecs11make_column17hdf5c8365f5687efaE
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movl	$24, %r8d
	xorl	%edx, %edx
	callq	_RNvNtNtNtCslk5dvTldH8g_3std3sys5alloc7windows18process_heap_alloc
	testq	%rax, %rax
	je	.LBB2_1
	movq	$0, (%rax)
	movq	$4, 8(%rax)
	movq	$0, 16(%rax)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.1(%rip), %rdx
	.seh_startepilogue
	addq	$40, %rsp
	.seh_endepilogue
	retq
.LBB2_1:
	movl	$8, %ecx
	movl	$24, %edx
	callq	_RNvNtCsgRIRWNK8DTq_5alloc5alloc18handle_alloc_error
	ud2
.Lfunc_end2:
	.seh_endproc

	.def	_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h1f2fa274c83a6852E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h1f2fa274c83a6852E,unique,3
	.p2align	4
_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h1f2fa274c83a6852E:
.Lfunc_begin3:
	movq	%rcx, %rax
	movups	anon.b508fe7ec78c99d5e791de770789df49.13(%rip), %xmm0
	movups	%xmm0, (%rcx)
	retq
.Lfunc_end3:

	.def	_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h6367d78081015d06E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h6367d78081015d06E,unique,4
	.p2align	4
_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h6367d78081015d06E:
.Lfunc_begin4:
	movq	%rcx, %rax
	movups	anon.b508fe7ec78c99d5e791de770789df49.10(%rip), %xmm0
	movups	%xmm0, (%rcx)
	retq
.Lfunc_end4:

	.def	_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h966f94812fa9fbf9E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h966f94812fa9fbf9E,unique,5
	.p2align	4
_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h966f94812fa9fbf9E:
.Lfunc_begin5:
	movq	%rcx, %rax
	movups	anon.b508fe7ec78c99d5e791de770789df49.3(%rip), %xmm0
	movups	%xmm0, (%rcx)
	retq
.Lfunc_end5:

	.def	_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h9c72df069e4641e2E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h9c72df069e4641e2E,unique,6
	.p2align	4
_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h9c72df069e4641e2E:
.Lfunc_begin6:
	movq	%rcx, %rax
	movups	anon.b508fe7ec78c99d5e791de770789df49.2(%rip), %xmm0
	movups	%xmm0, (%rcx)
	retq
.Lfunc_end6:

	.def	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h221471c0058ed7f6E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h221471c0058ed7f6E,unique,7
	.p2align	4
_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h221471c0058ed7f6E:
.Lfunc_begin7:
.seh_proc _ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h221471c0058ed7f6E
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movq	(%rcx), %rcx
	callq	_ZN3std3sys9backtrace28__rust_begin_short_backtrace17h646bce86d8078fa5E
	xorl	%eax, %eax
	.seh_startepilogue
	addq	$40, %rsp
	.seh_endepilogue
	retq
.Lfunc_end7:
	.seh_endproc

	.def	_ZN3std3sys9backtrace28__rust_begin_short_backtrace17h646bce86d8078fa5E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN3std3sys9backtrace28__rust_begin_short_backtrace17h646bce86d8078fa5E,unique,8
	.p2align	4
_ZN3std3sys9backtrace28__rust_begin_short_backtrace17h646bce86d8078fa5E:
.Lfunc_begin8:
.seh_proc _ZN3std3sys9backtrace28__rust_begin_short_backtrace17h646bce86d8078fa5E
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	callq	*%rcx
	nop
	#APP
	#NO_APP
	.seh_startepilogue
	addq	$40, %rsp
	.seh_endepilogue
	retq
.Lfunc_end8:
	.seh_endproc

	.def	_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h06188036efc5adb1E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h06188036efc5adb1E,unique,9
	.p2align	4
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h06188036efc5adb1E:
.Lfunc_begin9:
.seh_proc _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h06188036efc5adb1E
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$64, %rsp
	.seh_stackalloc 64
	.seh_endprologue
	movq	(%rcx), %rax
	movl	16(%rdx), %ecx
	testl	$33554432, %ecx
	jne	.LBB9_11
	testl	$67108864, %ecx
	jne	.LBB9_13
	movl	(%rax), %ecx
	movl	$10, %r8d
	leaq	anon.354825e82484bf8db084d6d8db460509.146.llvm.10808108167014004223(%rip), %rax
	movl	%ecx, %r9d
	cmpl	$1000, %ecx
	jb	.LBB9_5
	movl	$3518437209, %r10d
	movl	%ecx, %r11d
	.p2align	4
.LBB9_4:
	movl	%r11d, %r9d
	imulq	%r10, %r9
	shrq	$45, %r9
	imull	$10000, %r9d, %esi
	movl	%r11d, %edi
	subl	%esi, %edi
	imull	$5243, %edi, %esi
	shrl	$19, %esi
	imull	$100, %esi, %ebx
	subl	%ebx, %edi
	movzwl	%di, %edi
	movzwl	(%rax,%rsi,2), %esi
	movd	%esi, %xmm0
	pinsrw	$1, (%rax,%rdi,2), %xmm0
	movd	%xmm0, 50(%rsp,%r8)
	addq	$-4, %r8
	cmpl	$9999999, %r11d
	movl	%r9d, %r11d
	ja	.LBB9_4
.LBB9_5:
	cmpl	$9, %r9d
	jbe	.LBB9_7
	movzwl	%r9w, %r10d
	shrl	$2, %r10d
	imull	$5243, %r10d, %r10d
	shrl	$17, %r10d
	imull	$100, %r10d, %r11d
	subl	%r11d, %r9d
	movzwl	%r9w, %r9d
	movzwl	(%rax,%r9,2), %r9d
	movw	%r9w, 52(%rsp,%r8)
	addq	$-2, %r8
	movl	%r10d, %r9d
.LBB9_7:
	testl	%ecx, %ecx
	je	.LBB9_9
	testl	%r9d, %r9d
	je	.LBB9_10
.LBB9_9:
	andl	$15, %r9d
	movzbl	1(%rax,%r9,2), %eax
	movb	%al, 53(%rsp,%r8)
	decq	%r8
.LBB9_10:
	movl	$10, %eax
	subq	%r8, %rax
	leaq	(%rsp,%r8), %rcx
	addq	$54, %rcx
	movq	%rax, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movl	$1, %r8d
	movq	%rdx, %rcx
	movb	$1, %dl
	xorl	%r9d, %r9d
	jmp	.LBB9_16
.LBB9_11:
	movl	(%rax), %r9d
	xorl	%eax, %eax
	leaq	anon.354825e82484bf8db084d6d8db460509.1.llvm.10808108167014004223(%rip), %rcx
	movl	%r9d, %r8d
	.p2align	4
.LBB9_12:
	shrl	$4, %r8d
	andl	$15, %r9d
	movzbl	(%r9,%rcx), %r9d
	movb	%r9b, 61(%rsp,%rax)
	decq	%rax
	movl	%r8d, %r9d
	testl	%r8d, %r8d
	jne	.LBB9_12
	jmp	.LBB9_15
.LBB9_13:
	movl	(%rax), %r9d
	xorl	%eax, %eax
	leaq	anon.354825e82484bf8db084d6d8db460509.354.llvm.10808108167014004223(%rip), %rcx
	movl	%r9d, %r8d
	.p2align	4
.LBB9_14:
	shrl	$4, %r8d
	andl	$15, %r9d
	movzbl	(%r9,%rcx), %r9d
	movb	%r9b, 61(%rsp,%rax)
	decq	%rax
	movl	%r8d, %r9d
	testl	%r8d, %r8d
	jne	.LBB9_14
.LBB9_15:
	leaq	(%rsp,%rax), %rcx
	addq	$62, %rcx
	negq	%rax
	movq	%rax, 40(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	anon.354825e82484bf8db084d6d8db460509.342.llvm.10808108167014004223(%rip), %r8
	movl	$2, %r9d
	movq	%rdx, %rcx
	movb	$1, %dl
.LBB9_16:
	callq	_RNvMsa_NtCs9N2lWLRSIT9_4core3fmtNtB5_9Formatter12pad_integral
	nop
	.seh_startepilogue
	addq	$64, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	.seh_endepilogue
	retq
.Lfunc_end9:
	.seh_endproc

	.def	_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f30ee514247603aE;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f30ee514247603aE,unique,10
	.p2align	4
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f30ee514247603aE:
.Lfunc_begin10:
.seh_proc _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f30ee514247603aE
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movq	%rdx, %rsi
	movq	(%rcx), %rdi
	leaq	4(%rdi), %rax
	movq	%rax, 64(%rsp)
	movq	(%rdx), %rcx
	movq	8(%rdx), %rax
	leaq	anon.b508fe7ec78c99d5e791de770789df49.31(%rip), %rdx
	movl	$6, %r8d
	callq	*24(%rax)
	movq	%rsi, 48(%rsp)
	movb	%al, 56(%rsp)
	movb	$0, 57(%rsp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.29(%rip), %rax
	movq	%rax, 32(%rsp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.32(%rip), %rdx
	leaq	48(%rsp), %rsi
	movl	$5, %r8d
	movq	%rsi, %rcx
	movq	%rdi, %r9
	callq	_RNvMs1_NtNtCs9N2lWLRSIT9_4core3fmt8buildersNtB5_11DebugStruct5field
	leaq	anon.b508fe7ec78c99d5e791de770789df49.30(%rip), %rax
	movq	%rax, 32(%rsp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.33(%rip), %rdx
	leaq	64(%rsp), %r9
	movl	$10, %r8d
	movq	%rsi, %rcx
	callq	_RNvMs1_NtNtCs9N2lWLRSIT9_4core3fmt8buildersNtB5_11DebugStruct5field
	movzbl	56(%rsp), %ecx
	movzbl	57(%rsp), %eax
	movl	%eax, %edx
	notb	%dl
	orb	%cl, %dl
	testb	$1, %dl
	je	.LBB10_2
	orb	%cl, %al
	jmp	.LBB10_6
.LBB10_2:
	movq	48(%rsp), %rax
	testb	$-128, 18(%rax)
	jne	.LBB10_4
	movq	(%rax), %rcx
	movq	8(%rax), %rax
	leaq	anon.354825e82484bf8db084d6d8db460509.95.llvm.10808108167014004223(%rip), %rdx
	movl	$2, %r8d
	jmp	.LBB10_5
.LBB10_4:
	movq	(%rax), %rcx
	movq	8(%rax), %rax
	leaq	anon.354825e82484bf8db084d6d8db460509.54.llvm.10808108167014004223(%rip), %rdx
	movl	$1, %r8d
.LBB10_5:
	callq	*24(%rax)
.LBB10_6:
	andb	$1, %al
	.seh_startepilogue
	addq	$72, %rsp
	popq	%rdi
	popq	%rsi
	.seh_endepilogue
	retq
.Lfunc_end10:
	.seh_endproc

	.def	_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h42ee529b1b945a22E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h42ee529b1b945a22E,unique,11
	.p2align	4
_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h42ee529b1b945a22E:
.Lfunc_begin11:
	movq	%rdx, %rax
	movq	(%rcx), %rdx
	movq	8(%rcx), %r8
	movq	%rax, %rcx
	jmp	_RNvMsa_NtCs9N2lWLRSIT9_4core3fmtNtB5_9Formatter3pad
.Lfunc_end11:

	.def	_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17ha654f34c7b287520E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17ha654f34c7b287520E,unique,12
	.p2align	4
_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17ha654f34c7b287520E:
.Lfunc_begin12:
.seh_proc _ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17ha654f34c7b287520E
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movq	(%rcx), %rcx
	callq	_ZN3std3sys9backtrace28__rust_begin_short_backtrace17h646bce86d8078fa5E
	xorl	%eax, %eax
	.seh_startepilogue
	addq	$40, %rsp
	.seh_endepilogue
	retq
.Lfunc_end12:
	.seh_endproc

	.def	_ZN4core3ptr113drop_in_place$LT$std..collections..hash..map..HashMap$LT$alloc..vec..Vec$LT$core..any..TypeId$GT$$C$usize$GT$$GT$17h9c478fcaeaf4d670E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN4core3ptr113drop_in_place$LT$std..collections..hash..map..HashMap$LT$alloc..vec..Vec$LT$core..any..TypeId$GT$$C$usize$GT$$GT$17h9c478fcaeaf4d670E,unique,13
	.p2align	4
_ZN4core3ptr113drop_in_place$LT$std..collections..hash..map..HashMap$LT$alloc..vec..Vec$LT$core..any..TypeId$GT$$C$usize$GT$$GT$17h9c478fcaeaf4d670E:
.Lfunc_begin13:
.seh_proc _ZN4core3ptr113drop_in_place$LT$std..collections..hash..map..HashMap$LT$alloc..vec..Vec$LT$core..any..TypeId$GT$$C$usize$GT$$GT$17h9c478fcaeaf4d670E
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movq	8(%rcx), %rbx
	testq	%rbx, %rbx
	je	.LBB13_9
	movq	%rcx, 32(%rsp)
	movq	24(%rcx), %r14
	testq	%r14, %r14
	je	.LBB13_8
	movq	32(%rsp), %rax
	movq	(%rax), %r15
	movdqa	(%r15), %xmm0
	leaq	16(%r15), %r12
	pmovmskb	%xmm0, %esi
	notl	%esi
	movq	__imp_GetProcessHeap(%rip), %r13
	movq	__imp_HeapFree(%rip), %rbp
	jmp	.LBB13_3
	.p2align	4
.LBB13_7:
	leal	-1(%rsi), %eax
	andl	%esi, %eax
	movl	%eax, %esi
	decq	%r14
	je	.LBB13_8
.LBB13_3:
	testw	%si, %si
	jne	.LBB13_5
	.p2align	4
.LBB13_4:
	movdqa	(%r12), %xmm0
	addq	$-512, %r15
	addq	$16, %r12
	pmovmskb	%xmm0, %esi
	xorl	$65535, %esi
	je	.LBB13_4
.LBB13_5:
	rep		bsfl	%esi, %ecx
	shll	$5, %ecx
	movq	%r15, %rax
	subq	%rcx, %rax
	cmpq	$0, -32(%rax)
	je	.LBB13_7
	movq	-24(%rax), %rdi
	callq	*%r13
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rdi, %r8
	callq	*%rbp
	jmp	.LBB13_7
.LBB13_8:
	movq	%rbx, %rax
	shlq	$5, %rax
	addq	%rax, %rbx
	cmpq	$-49, %rbx
	movq	32(%rsp), %rcx
	je	.LBB13_9
	movq	(%rcx), %rsi
	subq	%rax, %rsi
	addq	$-32, %rsi
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	.seh_endepilogue
	rex64 jmpq	*__imp_HeapFree(%rip)
.LBB13_9:
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	.seh_endepilogue
	retq
.Lfunc_end13:
	.seh_endproc

	.def	_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E,unique,14
	.p2align	4
_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E:
.Lfunc_begin14:
.seh_proc _ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E
	.seh_handler __CxxFrameHandler3, @unwind, @except
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, %rsi
	movq	8(%rcx), %rax
	movq	%rax, -8(%rbp)
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.LBB14_2
	movq	(%rsi), %rcx
.Ltmp0:
	movq	%rcx, -16(%rbp)
	callq	*%rax
	nop
.Ltmp1:
.LBB14_2:
	movq	-8(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	.LBB14_6
	movq	(%rsi), %rsi
	cmpl	$17, 16(%rax)
	jb	.LBB14_5
	movq	-8(%rsi), %rsi
.LBB14_5:
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	.seh_startepilogue
	addq	$56, %rsp
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	rex64 jmpq	*__imp_HeapFree(%rip)
.LBB14_6:
	.seh_startepilogue
	addq	$56, %rsp
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.long	$cppxdata$_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E@IMGREL
	.section	.text,"xr",one_only,_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E,unique,14
	.seh_endproc
	.def	"?dtor$7@?0?_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$7@?0?_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E@4HA":
.seh_proc "?dtor$7@?0?_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E@4HA"
.LBB14_7:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	48(%rdx), %rbp
	.seh_endprologue
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.LBB14_9
	movq	-8(%rbp), %rax
	movq	16(%rax), %r8
	callq	_RNvCsGIExRX8pES_7___rustc14___rust_dealloc
	nop
.LBB14_9:
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	retq
.Lfunc_end14:
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E,unique,14
	.seh_endproc
	.section	.xdata,"dr",associative,_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E,unique,0
	.p2align	2, 0x0
$cppxdata$_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E:
	.long	429065506
	.long	1
	.long	$stateUnwindMap$_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E@IMGREL
	.long	0
	.long	0
	.long	3
	.long	$ip2state$_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E@IMGREL
	.long	48
	.long	0
	.long	1
$stateUnwindMap$_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E:
	.long	-1
	.long	"?dtor$7@?0?_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E@4HA"@IMGREL
$ip2state$_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E:
	.long	.Lfunc_begin14@IMGREL
	.long	-1
	.long	.Ltmp0@IMGREL
	.long	0
	.long	.Ltmp1@IMGREL
	.long	-1
	.section	.text,"xr",one_only,_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E,unique,14

	.def	_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E,unique,15
	.p2align	4
_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E:
.Lfunc_begin15:
.seh_proc _ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E
	.seh_handler __CxxFrameHandler3, @unwind, @except
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$56, %rsp
	.seh_stackalloc 56
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%rcx, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movq	(%rdx), %rax
	testq	%rax, %rax
	je	.LBB15_2
.Ltmp2:
	movq	-16(%rbp), %rcx
	callq	*%rax
	nop
.Ltmp3:
.LBB15_2:
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	.LBB15_9
	cmpl	$17, 16(%rax)
	jb	.LBB15_5
	movq	-8(%rsi), %rsi
.LBB15_5:
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	.seh_startepilogue
	addq	$56, %rsp
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	rex64 jmpq	*__imp_HeapFree(%rip)
.LBB15_9:
	.seh_startepilogue
	addq	$56, %rsp
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.long	$cppxdata$_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E@IMGREL
	.section	.text,"xr",one_only,_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E,unique,15
	.seh_endproc
	.def	"?dtor$6@?0?_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$6@?0?_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E@4HA":
.seh_proc "?dtor$6@?0?_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E@4HA"
.LBB15_6:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	48(%rdx), %rbp
	.seh_endprologue
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.LBB15_8
	movq	-8(%rbp), %rax
	movq	16(%rax), %r8
	callq	_RNvCsGIExRX8pES_7___rustc14___rust_dealloc
	nop
.LBB15_8:
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	retq
.Lfunc_end15:
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E,unique,15
	.seh_endproc
	.section	.xdata,"dr",associative,_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E,unique,1
	.p2align	2, 0x0
$cppxdata$_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E:
	.long	429065506
	.long	1
	.long	$stateUnwindMap$_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E@IMGREL
	.long	0
	.long	0
	.long	3
	.long	$ip2state$_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E@IMGREL
	.long	48
	.long	0
	.long	1
$stateUnwindMap$_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E:
	.long	-1
	.long	"?dtor$6@?0?_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E@4HA"@IMGREL
$ip2state$_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E:
	.long	.Lfunc_begin15@IMGREL
	.long	-1
	.long	.Ltmp2@IMGREL
	.long	0
	.long	.Ltmp3@IMGREL
	.long	-1
	.section	.text,"xr",one_only,_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E,unique,15

	.def	_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE,unique,16
	.p2align	4
_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE:
.Lfunc_begin16:
.seh_proc _ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE
	.seh_handler __CxxFrameHandler3, @unwind, @except
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$72, %rsp
	.seh_stackalloc 72
	leaq	64(%rsp), %rbp
	.seh_setframe %rbp, 64
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	8(%rcx), %rax
	movq	%rcx, -8(%rbp)
	movq	16(%rcx), %rcx
	movq	%rcx, -32(%rbp)
	movq	$0, -16(%rbp)
	movq	%rax, -24(%rbp)
	movq	%rax, %rcx
	.p2align	4
.LBB16_1:
	movq	-16(%rbp), %rax
	cmpq	%rax, -32(%rbp)
	je	.LBB16_13
	incq	%rax
	movq	%rax, -16(%rbp)
	leaq	48(%rcx), %rsi
.Ltmp4:
	callq	_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E
	nop
.Ltmp5:
	movq	%rsi, %rcx
	jmp	.LBB16_1
.LBB16_13:
	movq	-8(%rbp), %rdi
	cmpq	$0, (%rdi)
	je	.LBB16_15
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	-24(%rbp), %r8
	callq	*__imp_HeapFree(%rip)
.LBB16_15:
	movq	80(%rdi), %rax
	testq	%rax, %rax
	je	.LBB16_25
	movq	%rax, -16(%rbp)
	movq	96(%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB16_23
	movq	-8(%rbp), %rax
	movq	72(%rax), %r14
	movdqa	(%r14), %xmm0
	leaq	16(%r14), %r15
	pmovmskb	%xmm0, %edi
	notl	%edi
	movq	__imp_GetProcessHeap(%rip), %r12
	movq	__imp_HeapFree(%rip), %r13
	jmp	.LBB16_18
	.p2align	4
.LBB16_22:
	leal	-1(%rdi), %eax
	andl	%edi, %eax
	movl	%eax, %edi
	decq	%rbx
	je	.LBB16_23
.LBB16_18:
	testw	%di, %di
	jne	.LBB16_20
	.p2align	4
.LBB16_19:
	movdqa	(%r15), %xmm0
	addq	$-512, %r14
	addq	$16, %r15
	pmovmskb	%xmm0, %edi
	xorl	$65535, %edi
	je	.LBB16_19
.LBB16_20:
	rep		bsfl	%edi, %ecx
	shll	$5, %ecx
	movq	%r14, %rax
	subq	%rcx, %rax
	cmpq	$0, -32(%rax)
	je	.LBB16_22
	movq	-24(%rax), %rsi
	callq	*%r12
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	callq	*%r13
	jmp	.LBB16_22
.LBB16_23:
	movq	-16(%rbp), %rcx
	movq	%rcx, %rax
	shlq	$5, %rax
	addq	%rax, %rcx
	cmpq	$-49, %rcx
	movq	-8(%rbp), %rdi
	je	.LBB16_25
	movq	72(%rdi), %rsi
	subq	%rax, %rsi
	addq	$-32, %rsi
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	callq	*__imp_HeapFree(%rip)
.LBB16_25:
	cmpq	$0, 24(%rdi)
	je	.LBB16_27
	movq	32(%rdi), %rsi
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	callq	*__imp_HeapFree(%rip)
.LBB16_27:
	cmpq	$0, 48(%rdi)
	je	.LBB16_28
	movq	56(%rdi), %rsi
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	.seh_startepilogue
	addq	$72, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	rex64 jmpq	*__imp_HeapFree(%rip)
.LBB16_28:
	.seh_startepilogue
	addq	$72, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.long	$cppxdata$_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE@IMGREL
	.section	.text,"xr",one_only,_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE,unique,16
	.seh_endproc
	.def	"?dtor$3@?0?_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$3@?0?_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE@4HA":
.seh_proc "?dtor$3@?0?_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE@4HA"
.LBB16_3:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	64(%rdx), %rbp
	.seh_endprologue
	movq	-32(%rbp), %rdi
	movq	-16(%rbp), %rbx
	cmpq	%rbx, %rdi
	movq	-24(%rbp), %rsi
	je	.LBB16_5
	.p2align	4
.LBB16_4:
	leaq	(%rbx,%rbx,2), %rcx
	shlq	$4, %rcx
	addq	%rsi, %rcx
	callq	_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E
	incq	%rbx
	cmpq	%rdi, %rbx
	jne	.LBB16_4
.LBB16_5:
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE,unique,16
	.seh_endproc
	.def	"?dtor$6@?0?_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$6@?0?_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE@4HA":
.seh_proc "?dtor$6@?0?_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE@4HA"
.LBB16_6:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	64(%rdx), %rbp
	.seh_endprologue
	movq	-8(%rbp), %rax
	cmpq	$0, (%rax)
	je	.LBB16_8
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	-24(%rbp), %r8
	callq	*__imp_HeapFree(%rip)
.LBB16_8:
	movq	-8(%rbp), %rsi
	leaq	72(%rsi), %rcx
	callq	_ZN4core3ptr113drop_in_place$LT$std..collections..hash..map..HashMap$LT$alloc..vec..Vec$LT$core..any..TypeId$GT$$C$usize$GT$$GT$17h9c478fcaeaf4d670E
	cmpq	$0, 24(%rsi)
	je	.LBB16_10
	movq	-8(%rbp), %rax
	movq	32(%rax), %rsi
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	callq	*__imp_HeapFree(%rip)
.LBB16_10:
	movq	-8(%rbp), %rax
	cmpq	$0, 48(%rax)
	je	.LBB16_12
	movq	-8(%rbp), %rax
	movq	56(%rax), %rsi
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	callq	*__imp_HeapFree(%rip)
	nop
.LBB16_12:
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
.Lfunc_end16:
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE,unique,16
	.seh_endproc
	.section	.xdata,"dr",associative,_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE,unique,2
	.p2align	2, 0x0
$cppxdata$_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE:
	.long	429065506
	.long	2
	.long	$stateUnwindMap$_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE@IMGREL
	.long	0
	.long	0
	.long	3
	.long	$ip2state$_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE@IMGREL
	.long	64
	.long	0
	.long	1
$stateUnwindMap$_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE:
	.long	-1
	.long	"?dtor$6@?0?_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE@4HA"@IMGREL
	.long	0
	.long	"?dtor$3@?0?_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE@4HA"@IMGREL
$ip2state$_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE:
	.long	.Lfunc_begin16@IMGREL
	.long	-1
	.long	.Ltmp4@IMGREL
	.long	1
	.long	.Ltmp5@IMGREL
	.long	-1
	.section	.text,"xr",one_only,_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE,unique,16

	.def	_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE,unique,17
	.p2align	4
_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE:
.Lfunc_begin17:
.seh_proc _ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE
	.seh_handler __CxxFrameHandler3, @unwind, @except
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$96, %rsp
	.seh_stackalloc 96
	leaq	96(%rsp), %rbp
	.seh_setframe %rbp, 96
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movq	8(%rcx), %rax
	movq	%rax, -16(%rbp)
	movq	%rcx, -40(%rbp)
	movq	16(%rcx), %rax
	testq	%rax, %rax
	je	.LBB17_9
	movq	-16(%rbp), %rcx
	leaq	104(%rcx), %rsi
	movl	$1, %edi
	subq	%rax, %rdi
	jmp	.LBB17_2
	.p2align	4
.LBB17_7:
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rbx, %r8
	callq	*__imp_HeapFree(%rip)
.LBB17_8:
	addq	$56, %rsi
	incq	%rdi
	cmpq	$1, %rdi
	je	.LBB17_9
.LBB17_2:
	movq	%rdi, -48(%rbp)
	movq	-64(%rsi), %rax
	movq	%rax, -32(%rbp)
	movq	%rsi, -56(%rbp)
	movq	-56(%rsi), %rax
	movq	%rax, -24(%rbp)
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.LBB17_4
.Ltmp6:
	movq	-32(%rbp), %rcx
	callq	*%rax
	nop
.Ltmp7:
.LBB17_4:
	movq	-32(%rbp), %rbx
	movq	-24(%rbp), %rax
	cmpq	$0, 8(%rax)
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rdi
	je	.LBB17_8
	cmpl	$17, 16(%rax)
	jb	.LBB17_7
	movq	-8(%rbx), %rbx
	jmp	.LBB17_7
.LBB17_9:
	movq	-40(%rbp), %rax
	cmpq	$0, (%rax)
	je	.LBB17_26
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	-16(%rbp), %r8
	.seh_startepilogue
	addq	$96, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	.seh_endepilogue
	rex64 jmpq	*__imp_HeapFree(%rip)
.LBB17_26:
	.seh_startepilogue
	addq	$96, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.long	$cppxdata$_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE@IMGREL
	.section	.text,"xr",one_only,_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE,unique,17
	.seh_endproc
	.def	"?dtor$11@?0?_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$11@?0?_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE@4HA":
.seh_proc "?dtor$11@?0?_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE@4HA"
.LBB17_11:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	96(%rdx), %rbp
	.seh_endprologue
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.LBB17_13
	movq	-24(%rbp), %rax
	movq	16(%rax), %r8
	callq	_RNvCsGIExRX8pES_7___rustc14___rust_dealloc
.LBB17_13:
	movq	-48(%rbp), %r14
	testq	%r14, %r14
	movq	-56(%rbp), %rbx
	jne	.LBB17_14
.LBB17_22:
	.seh_startepilogue
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	.seh_endepilogue
	retq
.LBB17_14:
	negq	%r14
	jmp	.LBB17_15
	.p2align	4
.LBB17_20:
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	callq	*__imp_HeapFree(%rip)
.LBB17_21:
	addq	$56, %rbx
	decq	%r14
	je	.LBB17_22
.LBB17_15:
	movq	-8(%rbx), %rsi
	movq	(%rbx), %rdi
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.LBB17_17
	movq	%rsi, %rcx
	callq	*%rax
.LBB17_17:
	cmpq	$0, 8(%rdi)
	je	.LBB17_21
	cmpl	$17, 16(%rdi)
	jb	.LBB17_20
	movq	-8(%rsi), %rsi
	jmp	.LBB17_20
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE,unique,17
	.seh_endproc
	.def	"?dtor$23@?0?_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$23@?0?_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE@4HA":
.seh_proc "?dtor$23@?0?_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE@4HA"
.LBB17_23:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	96(%rdx), %rbp
	.seh_endprologue
	movq	-40(%rbp), %rax
	cmpq	$0, (%rax)
	je	.LBB17_25
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	-16(%rbp), %r8
	callq	*__imp_HeapFree(%rip)
	nop
.LBB17_25:
	.seh_startepilogue
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	.seh_endepilogue
	retq
.Lfunc_end17:
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE,unique,17
	.seh_endproc
	.section	.xdata,"dr",associative,_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE,unique,3
	.p2align	2, 0x0
$cppxdata$_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE:
	.long	429065506
	.long	2
	.long	$stateUnwindMap$_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE@IMGREL
	.long	0
	.long	0
	.long	3
	.long	$ip2state$_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE@IMGREL
	.long	88
	.long	0
	.long	1
$stateUnwindMap$_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE:
	.long	-1
	.long	"?dtor$23@?0?_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE@4HA"@IMGREL
	.long	0
	.long	"?dtor$11@?0?_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE@4HA"@IMGREL
$ip2state$_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE:
	.long	.Lfunc_begin17@IMGREL
	.long	-1
	.long	.Ltmp6@IMGREL
	.long	1
	.long	.Ltmp7@IMGREL
	.long	-1
	.section	.text,"xr",one_only,_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE,unique,17

	.def	_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E,unique,18
	.p2align	4
_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E:
.Lfunc_begin18:
.seh_proc _ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E
	.seh_handler __CxxFrameHandler3, @unwind, @except
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$96, %rsp
	.seh_stackalloc 96
	leaq	96(%rsp), %rbp
	.seh_setframe %rbp, 96
	.seh_endprologue
	movq	$-2, -8(%rbp)
	movq	8(%rcx), %rax
	movq	%rax, -24(%rbp)
	movq	%rcx, -16(%rbp)
	movq	16(%rcx), %rax
	testq	%rax, %rax
	je	.LBB18_9
	movq	-24(%rbp), %rcx
	leaq	104(%rcx), %rsi
	movl	$1, %edi
	subq	%rax, %rdi
	jmp	.LBB18_2
	.p2align	4
.LBB18_7:
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rbx, %r8
	callq	*__imp_HeapFree(%rip)
.LBB18_8:
	addq	$56, %rsi
	incq	%rdi
	cmpq	$1, %rdi
	je	.LBB18_9
.LBB18_2:
	movq	%rdi, -48(%rbp)
	movq	-64(%rsi), %rax
	movq	%rax, -40(%rbp)
	movq	%rsi, -56(%rbp)
	movq	-56(%rsi), %rax
	movq	%rax, -32(%rbp)
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.LBB18_4
.Ltmp8:
	movq	-40(%rbp), %rcx
	callq	*%rax
	nop
.Ltmp9:
.LBB18_4:
	movq	-40(%rbp), %rbx
	movq	-32(%rbp), %rax
	cmpq	$0, 8(%rax)
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rdi
	je	.LBB18_8
	cmpl	$17, 16(%rax)
	jb	.LBB18_7
	movq	-8(%rbx), %rbx
	jmp	.LBB18_7
.LBB18_9:
	movq	-16(%rbp), %rax
	cmpq	$0, (%rax)
	je	.LBB18_11
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	-24(%rbp), %r8
	callq	*__imp_HeapFree(%rip)
	movq	-16(%rbp), %rax
.LBB18_11:
	cmpq	$0, 24(%rax)
	je	.LBB18_30
	movq	32(%rax), %rsi
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	.seh_startepilogue
	addq	$96, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	.seh_endepilogue
	rex64 jmpq	*__imp_HeapFree(%rip)
.LBB18_30:
	.seh_startepilogue
	addq	$96, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.long	$cppxdata$_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E@IMGREL
	.section	.text,"xr",one_only,_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E,unique,18
	.seh_endproc
	.def	"?dtor$13@?0?_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$13@?0?_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E@4HA":
.seh_proc "?dtor$13@?0?_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E@4HA"
.LBB18_13:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	96(%rdx), %rbp
	.seh_endprologue
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.LBB18_15
	movq	-32(%rbp), %rax
	movq	16(%rax), %r8
	callq	_RNvCsGIExRX8pES_7___rustc14___rust_dealloc
.LBB18_15:
	movq	-48(%rbp), %r14
	testq	%r14, %r14
	movq	-56(%rbp), %rbx
	jne	.LBB18_16
.LBB18_24:
	.seh_startepilogue
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	.seh_endepilogue
	retq
.LBB18_16:
	negq	%r14
	jmp	.LBB18_17
	.p2align	4
.LBB18_22:
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	callq	*__imp_HeapFree(%rip)
.LBB18_23:
	addq	$56, %rbx
	decq	%r14
	je	.LBB18_24
.LBB18_17:
	movq	-8(%rbx), %rsi
	movq	(%rbx), %rdi
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.LBB18_19
	movq	%rsi, %rcx
	callq	*%rax
.LBB18_19:
	cmpq	$0, 8(%rdi)
	je	.LBB18_23
	cmpl	$17, 16(%rdi)
	jb	.LBB18_22
	movq	-8(%rsi), %rsi
	jmp	.LBB18_22
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E,unique,18
	.seh_endproc
	.def	"?dtor$25@?0?_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$25@?0?_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E@4HA":
.seh_proc "?dtor$25@?0?_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E@4HA"
.LBB18_25:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$32, %rsp
	.seh_stackalloc 32
	leaq	96(%rdx), %rbp
	.seh_endprologue
	movq	-16(%rbp), %rax
	cmpq	$0, (%rax)
	je	.LBB18_27
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	-24(%rbp), %r8
	callq	*__imp_HeapFree(%rip)
.LBB18_27:
	movq	-16(%rbp), %rax
	cmpq	$0, 24(%rax)
	je	.LBB18_29
	movq	-16(%rbp), %rax
	movq	32(%rax), %rsi
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	callq	*__imp_HeapFree(%rip)
	nop
.LBB18_29:
	.seh_startepilogue
	addq	$32, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%rbp
	.seh_endepilogue
	retq
.Lfunc_end18:
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E,unique,18
	.seh_endproc
	.section	.xdata,"dr",associative,_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E,unique,4
	.p2align	2, 0x0
$cppxdata$_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E:
	.long	429065506
	.long	2
	.long	$stateUnwindMap$_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E@IMGREL
	.long	0
	.long	0
	.long	3
	.long	$ip2state$_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E@IMGREL
	.long	88
	.long	0
	.long	1
$stateUnwindMap$_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E:
	.long	-1
	.long	"?dtor$25@?0?_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E@4HA"@IMGREL
	.long	0
	.long	"?dtor$13@?0?_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E@4HA"@IMGREL
$ip2state$_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E:
	.long	.Lfunc_begin18@IMGREL
	.long	-1
	.long	.Ltmp8@IMGREL
	.long	1
	.long	.Ltmp9@IMGREL
	.long	-1
	.section	.text,"xr",one_only,_ZN4core3ptr48drop_in_place$LT$rust_ecs_3d..ecs..Archetype$GT$17h7966aead73a484d3E,unique,18

	.def	_ZN4core3ptr63drop_in_place$LT$alloc..vec..Vec$LT$benchmark..Position$GT$$GT$17h4e3cf871d0206ec9E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN4core3ptr63drop_in_place$LT$alloc..vec..Vec$LT$benchmark..Position$GT$$GT$17h4e3cf871d0206ec9E,unique,19
	.p2align	4
_ZN4core3ptr63drop_in_place$LT$alloc..vec..Vec$LT$benchmark..Position$GT$$GT$17h4e3cf871d0206ec9E:
.Lfunc_begin19:
.seh_proc _ZN4core3ptr63drop_in_place$LT$alloc..vec..Vec$LT$benchmark..Position$GT$$GT$17h4e3cf871d0206ec9E
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	cmpq	$0, (%rcx)
	je	.LBB19_1
	movq	8(%rcx), %rsi
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	.seh_startepilogue
	addq	$32, %rsp
	popq	%rsi
	.seh_endepilogue
	rex64 jmpq	*__imp_HeapFree(%rip)
.LBB19_1:
	.seh_startepilogue
	addq	$32, %rsp
	popq	%rsi
	.seh_endepilogue
	retq
.Lfunc_end19:
	.seh_endproc

	.def	_ZN4core3ptr77drop_in_place$LT$rust_ecs_3d..ecs..TypedColumn$LT$benchmark..Position$GT$$GT$17h12ad3ae020af1b1dE;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN4core3ptr77drop_in_place$LT$rust_ecs_3d..ecs..TypedColumn$LT$benchmark..Position$GT$$GT$17h12ad3ae020af1b1dE,unique,20
	.p2align	4
_ZN4core3ptr77drop_in_place$LT$rust_ecs_3d..ecs..TypedColumn$LT$benchmark..Position$GT$$GT$17h12ad3ae020af1b1dE:
.Lfunc_begin20:
.seh_proc _ZN4core3ptr77drop_in_place$LT$rust_ecs_3d..ecs..TypedColumn$LT$benchmark..Position$GT$$GT$17h12ad3ae020af1b1dE
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$32, %rsp
	.seh_stackalloc 32
	.seh_endprologue
	cmpq	$0, (%rcx)
	je	.LBB20_1
	movq	8(%rcx), %rsi
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	.seh_startepilogue
	addq	$32, %rsp
	popq	%rsi
	.seh_endepilogue
	rex64 jmpq	*__imp_HeapFree(%rip)
.LBB20_1:
	.seh_startepilogue
	addq	$32, %rsp
	popq	%rsi
	.seh_endepilogue
	retq
.Lfunc_end20:
	.seh_endproc

	.def	_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h2dce19cdc32559a3E;
	.scl	3;
	.type	32;
	.endef
	.section	.text$unlikely,"xr",one_only,_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h2dce19cdc32559a3E,unique,21
	.p2align	4
_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h2dce19cdc32559a3E:
.Lfunc_begin21:
.seh_proc _ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h2dce19cdc32559a3E
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movq	(%rcx), %rdx
	movl	$12, %r8d
	callq	_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14grow_amortized17hee3b7f2f42d3b686E
	movabsq	$-9223372036854775807, %rcx
	cmpq	%rcx, %rax
	jne	.LBB21_1
	.seh_startepilogue
	addq	$40, %rsp
	.seh_endepilogue
	retq
.LBB21_1:
	movq	%rax, %rcx
	callq	_RNvNtCsgRIRWNK8DTq_5alloc7raw_vec12handle_error
	ud2
.Lfunc_end21:
	.seh_endproc

	.def	_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h5b4fe8b83cd06994E;
	.scl	3;
	.type	32;
	.endef
	.section	.text$unlikely,"xr",one_only,_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h5b4fe8b83cd06994E,unique,22
	.p2align	4
_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h5b4fe8b83cd06994E:
.Lfunc_begin22:
.seh_proc _ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h5b4fe8b83cd06994E
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movq	(%rcx), %rdx
	movl	$24, %r8d
	callq	_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14grow_amortized17hee3b7f2f42d3b686E
	movabsq	$-9223372036854775807, %rcx
	cmpq	%rcx, %rax
	jne	.LBB22_1
	.seh_startepilogue
	addq	$40, %rsp
	.seh_endepilogue
	retq
.LBB22_1:
	movq	%rax, %rcx
	callq	_RNvNtCsgRIRWNK8DTq_5alloc7raw_vec12handle_error
	ud2
.Lfunc_end22:
	.seh_endproc

	.def	_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h557aaa66e9b7ae56E;
	.scl	3;
	.type	32;
	.endef
	.section	.text$unlikely,"xr",one_only,_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h557aaa66e9b7ae56E,unique,23
	.p2align	4
_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h557aaa66e9b7ae56E:
.Lfunc_begin23:
.seh_proc _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h557aaa66e9b7ae56E
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movq	%r9, %rax
	movq	%rdx, %r9
	movq	%rcx, %rsi
	mulq	112(%rsp)
	movq	%rax, %rdi
	seto	%al
	movabsq	$9223372036854775804, %rcx
	cmpq	%rcx, %rdi
	seta	%cl
	orb	%al, %cl
	movl	$1, %r14d
	je	.LBB23_2
	movl	$8, %eax
	xorl	%edi, %edi
	jmp	.LBB23_10
.LBB23_2:
	testq	%r9, %r9
	je	.LBB23_4
	movq	%r8, %rbx
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rbx, %r8
	movq	%rdi, %r9
	callq	*__imp_HeapReAlloc(%rip)
	testq	%rax, %rax
	jne	.LBB23_6
	jmp	.LBB23_9
.LBB23_4:
	testq	%rdi, %rdi
	je	.LBB23_5
	xorl	%edx, %edx
	movq	%rdi, %r8
	callq	_RNvNtNtNtCslk5dvTldH8g_3std3sys5alloc7windows18process_heap_alloc
	testq	%rax, %rax
	jne	.LBB23_6
.LBB23_9:
	movq	$4, 8(%rsi)
	movl	$16, %eax
	jmp	.LBB23_10
.LBB23_5:
	movl	$4, %eax
.LBB23_6:
	movq	%rax, 8(%rsi)
	movl	$16, %eax
	xorl	%r14d, %r14d
.LBB23_10:
	movq	%rdi, (%rsi,%rax)
	movq	%r14, (%rsi)
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	.seh_endepilogue
	retq
.Lfunc_end23:
	.seh_endproc

	.def	_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14grow_amortized17hee3b7f2f42d3b686E;
	.scl	3;
	.type	32;
	.endef
	.section	.text$unlikely,"xr",one_only,_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14grow_amortized17hee3b7f2f42d3b686E,unique,24
	.p2align	4
_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14grow_amortized17hee3b7f2f42d3b686E:
.Lfunc_begin24:
.seh_proc _ZN5alloc7raw_vec20RawVecInner$LT$A$GT$14grow_amortized17hee3b7f2f42d3b686E
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$72, %rsp
	.seh_stackalloc 72
	.seh_endprologue
	movq	%rcx, %rsi
	incq	%rdx
	movq	(%rcx), %rax
	leaq	(%rax,%rax), %rcx
	cmpq	%rcx, %rdx
	cmovbeq	%rcx, %rdx
	cmpq	$5, %rdx
	movl	$4, %edi
	cmovaeq	%rdx, %rdi
	movq	8(%rsi), %r9
	movq	%r8, 32(%rsp)
	leaq	48(%rsp), %rcx
	movq	%rax, %rdx
	movq	%r9, %r8
	movq	%rdi, %r9
	callq	_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$11finish_grow17h557aaa66e9b7ae56E
	cmpb	$0, 48(%rsp)
	je	.LBB24_2
	movq	56(%rsp), %rax
	movq	64(%rsp), %rdx
	.seh_startepilogue
	addq	$72, %rsp
	popq	%rdi
	popq	%rsi
	.seh_endepilogue
	retq
.LBB24_2:
	movq	56(%rsp), %rax
	movq	%rax, 8(%rsi)
	movq	%rdi, (%rsi)
	movabsq	$-9223372036854775807, %rax
	.seh_startepilogue
	addq	$72, %rsp
	popq	%rdi
	popq	%rsi
	.seh_endepilogue
	retq
.Lfunc_end24:
	.seh_endproc

	.def	_ZN63_$LT$rust_ecs_3d..ecs..EcsError$u20$as$u20$core..fmt..Debug$GT$3fmt17h264be93e7cdaefe1E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN63_$LT$rust_ecs_3d..ecs..EcsError$u20$as$u20$core..fmt..Debug$GT$3fmt17h264be93e7cdaefe1E,unique,25
	.p2align	4
_ZN63_$LT$rust_ecs_3d..ecs..EcsError$u20$as$u20$core..fmt..Debug$GT$3fmt17h264be93e7cdaefe1E:
.Lfunc_begin25:
.seh_proc _ZN63_$LT$rust_ecs_3d..ecs..EcsError$u20$as$u20$core..fmt..Debug$GT$3fmt17h264be93e7cdaefe1E
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$104, %rsp
	.seh_stackalloc 104
	.seh_endprologue
	movq	%rdx, %rsi
	movl	(%rcx), %eax
	leaq	.LJTI25_0(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmpq	*%rax
.LBB25_1:
	addq	$4, %rcx
	movq	%rcx, 48(%rsp)
	movq	(%rsi), %rdi
	movq	8(%rsi), %r14
	movq	24(%r14), %r15
	leaq	anon.b508fe7ec78c99d5e791de770789df49.35(%rip), %rdx
	movl	$11, %r8d
	movq	%rdi, %rcx
	callq	*%r15
	movb	$1, %bl
	testb	%al, %al
	jne	.LBB25_11
	testb	$-128, 18(%rsi)
	jne	.LBB25_5
	leaq	anon.354825e82484bf8db084d6d8db460509.39.llvm.10808108167014004223(%rip), %rdx
	movl	$1, %r8d
	movq	%rdi, %rcx
	callq	*%r15
	testb	%al, %al
	jne	.LBB25_11
	leaq	48(%rsp), %rcx
	movq	%rsi, %rdx
	callq	_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f30ee514247603aE
	testb	%al, %al
	jne	.LBB25_11
	jmp	.LBB25_10
.LBB25_22:
	movq	(%rsi), %rcx
	movq	8(%rsi), %rax
	movq	24(%rax), %rax
	leaq	anon.b508fe7ec78c99d5e791de770789df49.40(%rip), %rdx
	movl	$16, %r8d
	.seh_startepilogue
	addq	$104, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r14
	popq	%r15
	.seh_endepilogue
	rex64 jmpq	*%rax
.LBB25_20:
	movq	%rcx, %r14
	movq	(%rsi), %rdi
	movq	8(%rsi), %r15
	movq	24(%r15), %r12
	leaq	anon.b508fe7ec78c99d5e791de770789df49.38(%rip), %rdx
	movl	$16, %r8d
	jmp	.LBB25_14
.LBB25_21:
	movq	%rcx, %r14
	movq	(%rsi), %rdi
	movq	8(%rsi), %r15
	movq	24(%r15), %r12
	leaq	anon.b508fe7ec78c99d5e791de770789df49.39(%rip), %rdx
	jmp	.LBB25_13
.LBB25_12:
	movq	%rcx, %r14
	movq	(%rsi), %rdi
	movq	8(%rsi), %r15
	movq	24(%r15), %r12
	leaq	anon.b508fe7ec78c99d5e791de770789df49.37(%rip), %rdx
.LBB25_13:
	movl	$18, %r8d
.LBB25_14:
	movq	%rdi, %rcx
	callq	*%r12
	movb	$1, %bl
	testb	%al, %al
	je	.LBB25_15
.LBB25_11:
	movl	%ebx, %eax
	.seh_startepilogue
	addq	$104, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r14
	popq	%r15
	.seh_endepilogue
	retq
.LBB25_15:
	testb	$-128, 18(%rsi)
	jne	.LBB25_18
	leaq	anon.354825e82484bf8db084d6d8db460509.39.llvm.10808108167014004223(%rip), %rdx
	movl	$1, %r8d
	movq	%rdi, %rcx
	callq	*%r12
	testb	%al, %al
	jne	.LBB25_11
	movq	8(%r14), %rcx
	movq	16(%r14), %rdx
	movq	%rsi, %r8
	callq	_RNvXsh_NtCs9N2lWLRSIT9_4core3fmteNtB5_5Debug3fmt
	testb	%al, %al
	jne	.LBB25_11
	jmp	.LBB25_10
.LBB25_18:
	leaq	anon.354825e82484bf8db084d6d8db460509.40.llvm.10808108167014004223(%rip), %rdx
	movl	$2, %r8d
	movq	%rdi, %rcx
	callq	*%r12
	testb	%al, %al
	jne	.LBB25_11
	movb	$1, 48(%rsp)
	movq	%rdi, 80(%rsp)
	movq	%r15, 88(%rsp)
	leaq	48(%rsp), %rax
	movq	%rax, 96(%rsp)
	movq	16(%rsi), %rax
	movq	%rax, 72(%rsp)
	leaq	80(%rsp), %rax
	movq	%rax, 56(%rsp)
	leaq	anon.354825e82484bf8db084d6d8db460509.100.llvm.10808108167014004223(%rip), %rax
	movq	%rax, 64(%rsp)
	movq	8(%r14), %rcx
	movq	16(%r14), %rdx
	leaq	56(%rsp), %r8
	callq	_RNvXsh_NtCs9N2lWLRSIT9_4core3fmteNtB5_5Debug3fmt
	testb	%al, %al
	jne	.LBB25_11
	jmp	.LBB25_8
.LBB25_5:
	leaq	anon.354825e82484bf8db084d6d8db460509.40.llvm.10808108167014004223(%rip), %rdx
	movl	$2, %r8d
	movq	%rdi, %rcx
	callq	*%r15
	testb	%al, %al
	jne	.LBB25_11
	movb	$1, 47(%rsp)
	movq	%rdi, 80(%rsp)
	movq	%r14, 88(%rsp)
	leaq	47(%rsp), %rax
	movq	%rax, 96(%rsp)
	movq	16(%rsi), %rax
	movq	%rax, 72(%rsp)
	leaq	80(%rsp), %rax
	movq	%rax, 56(%rsp)
	leaq	anon.354825e82484bf8db084d6d8db460509.100.llvm.10808108167014004223(%rip), %rax
	movq	%rax, 64(%rsp)
	leaq	48(%rsp), %rcx
	leaq	56(%rsp), %rdx
	callq	_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f30ee514247603aE
	testb	%al, %al
	jne	.LBB25_11
.LBB25_8:
	movq	56(%rsp), %rcx
	movq	64(%rsp), %rax
	leaq	anon.354825e82484bf8db084d6d8db460509.38.llvm.10808108167014004223(%rip), %rdx
	movl	$2, %r8d
	callq	*24(%rax)
	testb	%al, %al
	jne	.LBB25_11
.LBB25_10:
	movq	(%rsi), %rcx
	movq	8(%rsi), %rax
	leaq	anon.354825e82484bf8db084d6d8db460509.57.llvm.10808108167014004223(%rip), %rdx
	movl	$1, %r8d
	callq	*24(%rax)
	movl	%eax, %ebx
	jmp	.LBB25_11
.Lfunc_end25:
	.section	.rdata,"dr",associative,_ZN63_$LT$rust_ecs_3d..ecs..EcsError$u20$as$u20$core..fmt..Debug$GT$3fmt17h264be93e7cdaefe1E,unique,26
	.p2align	2, 0x0
.LJTI25_0:
	.long	.LBB25_1-.LJTI25_0
	.long	.LBB25_12-.LJTI25_0
	.long	.LBB25_20-.LJTI25_0
	.long	.LBB25_21-.LJTI25_0
	.long	.LBB25_22-.LJTI25_0
	.section	.text,"xr",one_only,_ZN63_$LT$rust_ecs_3d..ecs..EcsError$u20$as$u20$core..fmt..Debug$GT$3fmt17h264be93e7cdaefe1E,unique,25
	.seh_endproc

	.def	_ZN67_$LT$alloc..boxed..Box$LT$T$C$A$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hb693ce5af18efb60E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN67_$LT$alloc..boxed..Box$LT$T$C$A$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hb693ce5af18efb60E,unique,27
	.p2align	4
_ZN67_$LT$alloc..boxed..Box$LT$T$C$A$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hb693ce5af18efb60E:
.Lfunc_begin26:
.seh_proc _ZN67_$LT$alloc..boxed..Box$LT$T$C$A$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hb693ce5af18efb60E
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movq	(%rdx), %rsi
	movq	8(%rdx), %rax
	movq	24(%rax), %rax
	leaq	anon.354825e82484bf8db084d6d8db460509.291.llvm.10808108167014004223(%rip), %rdx
	movl	$3, %r8d
	movq	%rsi, %rcx
	movq	%rax, %rdi
	callq	*%rax
	testb	%al, %al
	je	.LBB26_2
	movb	$1, %al
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rdi
	popq	%rsi
	.seh_endepilogue
	retq
.LBB26_2:
	leaq	anon.354825e82484bf8db084d6d8db460509.51.llvm.10808108167014004223(%rip), %rdx
	movl	$7, %r8d
	movq	%rsi, %rcx
	movq	%rdi, %rax
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rdi
	popq	%rsi
	.seh_endepilogue
	rex64 jmpq	*%rax
.Lfunc_end26:
	.seh_endproc

	.def	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$10as_any_mut17h22176cbf6cdeba80E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$10as_any_mut17h22176cbf6cdeba80E,unique,28
	.p2align	4
_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$10as_any_mut17h22176cbf6cdeba80E:
.Lfunc_begin27:
	movq	%rcx, %rax
	leaq	anon.b508fe7ec78c99d5e791de770789df49.41(%rip), %rdx
	retq
.Lfunc_end27:

	.def	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$10as_any_mut17h2a3d69d82943a8fcE;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$10as_any_mut17h2a3d69d82943a8fcE,unique,29
	.p2align	4
_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$10as_any_mut17h2a3d69d82943a8fcE:
.Lfunc_begin28:
	movq	%rcx, %rax
	leaq	anon.b508fe7ec78c99d5e791de770789df49.42(%rip), %rdx
	retq
.Lfunc_end28:

	.def	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$11swap_remove17h8396e09de5cae836E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$11swap_remove17h8396e09de5cae836E,unique,30
	.p2align	4
_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$11swap_remove17h8396e09de5cae836E:
.Lfunc_begin29:
.seh_proc _ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$11swap_remove17h8396e09de5cae836E
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%rdx, %rax
	movq	16(%rcx), %rdx
	cmpq	%rdx, %rax
	jae	.LBB29_3
	movq	8(%rcx), %r8
	leaq	(%rax,%rax,2), %rax
	movl	8(%r8,%rax,4), %r9d
	movl	%r9d, 48(%rsp)
	movq	(%r8,%rax,4), %r9
	movq	%r9, 40(%rsp)
	decq	%rdx
	leaq	(%rdx,%rdx,2), %r9
	movl	8(%r8,%r9,4), %r10d
	movq	(%r8,%r9,4), %r9
	movq	%r9, (%r8,%rax,4)
	movl	%r10d, 8(%r8,%rax,4)
	movq	%rdx, 16(%rcx)
	movl	$12, %r8d
	xorl	%edx, %edx
	callq	_RNvNtNtNtCslk5dvTldH8g_3std3sys5alloc7windows18process_heap_alloc
	testq	%rax, %rax
	je	.LBB29_4
	movl	48(%rsp), %ecx
	movl	%ecx, 8(%rax)
	movq	40(%rsp), %rcx
	movq	%rcx, (%rax)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.22(%rip), %rdx
	.seh_startepilogue
	addq	$56, %rsp
	.seh_endepilogue
	retq
.LBB29_3:
	movq	%rax, %rcx
	callq	_RNvNvMs_NtCsgRIRWNK8DTq_5alloc3vecINtB6_3VecppE11swap_remove13assert_failed
	ud2
.LBB29_4:
	movl	$4, %ecx
	movl	$12, %edx
	callq	_RNvNtCsgRIRWNK8DTq_5alloc5alloc18handle_alloc_error
	ud2
.Lfunc_end29:
	.seh_endproc

	.def	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$11swap_remove17hae943442ace9669aE;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$11swap_remove17hae943442ace9669aE,unique,31
	.p2align	4
_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$11swap_remove17hae943442ace9669aE:
.Lfunc_begin30:
.seh_proc _ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$11swap_remove17hae943442ace9669aE
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%rdx, %rax
	movq	16(%rcx), %rdx
	cmpq	%rdx, %rax
	jae	.LBB30_3
	movq	8(%rcx), %r8
	leaq	(%rax,%rax,2), %rax
	movl	8(%r8,%rax,4), %r9d
	movl	%r9d, 48(%rsp)
	movq	(%r8,%rax,4), %r9
	movq	%r9, 40(%rsp)
	decq	%rdx
	leaq	(%rdx,%rdx,2), %r9
	movl	8(%r8,%r9,4), %r10d
	movq	(%r8,%r9,4), %r9
	movq	%r9, (%r8,%rax,4)
	movl	%r10d, 8(%r8,%rax,4)
	movq	%rdx, 16(%rcx)
	movl	$12, %r8d
	xorl	%edx, %edx
	callq	_RNvNtNtNtCslk5dvTldH8g_3std3sys5alloc7windows18process_heap_alloc
	testq	%rax, %rax
	je	.LBB30_4
	movl	48(%rsp), %ecx
	movl	%ecx, 8(%rax)
	movq	40(%rsp), %rcx
	movq	%rcx, (%rax)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.23(%rip), %rdx
	.seh_startepilogue
	addq	$56, %rsp
	.seh_endepilogue
	retq
.LBB30_3:
	movq	%rax, %rcx
	callq	_RNvNvMs_NtCsgRIRWNK8DTq_5alloc3vecINtB6_3VecppE11swap_remove13assert_failed
	ud2
.LBB30_4:
	movl	$4, %ecx
	movl	$12, %edx
	callq	_RNvNtCsgRIRWNK8DTq_5alloc5alloc18handle_alloc_error
	ud2
.Lfunc_end30:
	.seh_endproc

	.def	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$16swap_remove_drop17h510933a940fc1b46E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$16swap_remove_drop17h510933a940fc1b46E,unique,32
	.p2align	4
_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$16swap_remove_drop17h510933a940fc1b46E:
.Lfunc_begin31:
.seh_proc _ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$16swap_remove_drop17h510933a940fc1b46E
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movq	%rdx, %rax
	movq	16(%rcx), %rdx
	cmpq	%rdx, %rax
	jae	.LBB31_1
	movq	8(%rcx), %r8
	leaq	(%rax,%rax,2), %rax
	decq	%rdx
	leaq	(%rdx,%rdx,2), %r9
	movq	(%r8,%r9,4), %r10
	movl	8(%r8,%r9,4), %r9d
	movl	%r9d, 8(%r8,%rax,4)
	movq	%r10, (%r8,%rax,4)
	movq	%rdx, 16(%rcx)
	.seh_startepilogue
	addq	$40, %rsp
	.seh_endepilogue
	retq
.LBB31_1:
	movq	%rax, %rcx
	callq	_RNvNvMs_NtCsgRIRWNK8DTq_5alloc3vecINtB6_3VecppE11swap_remove13assert_failed
	ud2
.Lfunc_end31:
	.seh_endproc

	.def	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E;
	.scl	3;
	.type	32;
	.endef
	.globl	__xmm@137fa26520a05c63d9acc5143587f72e
	.section	.rdata,"dr",discard,__xmm@137fa26520a05c63d9acc5143587f72e
	.p2align	4, 0x0
__xmm@137fa26520a05c63d9acc5143587f72e:
	.byte	46
	.byte	247
	.byte	135
	.byte	53
	.byte	20
	.byte	197
	.byte	172
	.byte	217
	.byte	99
	.byte	92
	.byte	160
	.byte	32
	.byte	101
	.byte	162
	.byte	127
	.byte	19
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E,unique,33
	.p2align	4
_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E:
.Lfunc_begin32:
.seh_proc _ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E
	.seh_handler __CxxFrameHandler3, @unwind, @except
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$88, %rsp
	.seh_stackalloc 88
	leaq	80(%rsp), %rbp
	.seh_setframe %rbp, 80
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%r8, %rdi
	movq	%rdx, %rbx
	movq	%rcx, %rsi
	movq	%rdx, -40(%rbp)
	movq	%r8, -32(%rbp)
.Ltmp10:
	leaq	-16(%rbp), %rcx
	callq	*24(%r8)
	nop
.Ltmp11:
	movdqa	-16(%rbp), %xmm0
	pcmpeqb	__xmm@137fa26520a05c63d9acc5143587f72e(%rip), %xmm0
	pmovmskb	%xmm0, %eax
	cmpl	$65535, %eax
	jne	.LBB32_2
	movl	8(%rbx), %eax
	movl	%eax, -8(%rbp)
	movq	%rbx, -24(%rbp)
	movq	(%rbx), %rax
	movq	%rax, -16(%rbp)
	movq	16(%rsi), %rdi
	cmpq	(%rsi), %rdi
	jne	.LBB32_6
.Ltmp14:
	movq	%rsi, %rcx
	callq	_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h2dce19cdc32559a3E
	nop
.Ltmp15:
.LBB32_6:
	movq	8(%rsi), %rax
	leaq	(%rdi,%rdi,2), %rcx
	movl	-8(%rbp), %edx
	movl	%edx, 8(%rax,%rcx,4)
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax,%rcx,4)
	incq	%rdi
	movq	%rdi, 16(%rsi)
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	-24(%rbp), %r8
	callq	*__imp_HeapFree(%rip)
	nop
	.seh_startepilogue
	addq	$88, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	retq
.LBB32_2:
	movq	%rbx, -16(%rbp)
	movq	%rdi, -8(%rbp)
.Ltmp12:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.44(%rip), %rax
	movq	%rax, 32(%rsp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.43(%rip), %rcx
	leaq	anon.b508fe7ec78c99d5e791de770789df49.26(%rip), %r9
	leaq	-16(%rbp), %r8
	movl	$25, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core6result13unwrap_failed
	nop
.Ltmp13:
	ud2
	.seh_handlerdata
	.long	$cppxdata$_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@IMGREL
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E,unique,33
	.seh_endproc
	.def	"?dtor$7@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$7@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@4HA":
.seh_proc "?dtor$7@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@4HA"
.LBB32_7:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	80(%rdx), %rbp
	.seh_endprologue
	leaq	-40(%rbp), %rcx
	callq	_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E
	nop
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E,unique,33
	.seh_endproc
	.def	"?dtor$8@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$8@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@4HA":
.seh_proc "?dtor$8@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@4HA"
.LBB32_8:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	80(%rdx), %rbp
	.seh_endprologue
	leaq	-16(%rbp), %rcx
	callq	_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E
	nop
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E,unique,33
	.seh_endproc
	.def	"?dtor$9@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$9@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@4HA":
.seh_proc "?dtor$9@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@4HA"
.LBB32_9:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	80(%rdx), %rbp
	.seh_endprologue
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	-24(%rbp), %r8
	callq	*__imp_HeapFree(%rip)
	nop
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	retq
.Lfunc_end32:
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E,unique,33
	.seh_endproc
	.section	.xdata,"dr",associative,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E,unique,5
	.p2align	2, 0x0
$cppxdata$_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E:
	.long	429065506
	.long	3
	.long	$stateUnwindMap$_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@IMGREL
	.long	0
	.long	0
	.long	5
	.long	$ip2state$_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@IMGREL
	.long	80
	.long	0
	.long	1
$stateUnwindMap$_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E:
	.long	-1
	.long	"?dtor$7@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@4HA"@IMGREL
	.long	-1
	.long	"?dtor$8@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@4HA"@IMGREL
	.long	-1
	.long	"?dtor$9@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E@4HA"@IMGREL
$ip2state$_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E:
	.long	.Lfunc_begin32@IMGREL
	.long	-1
	.long	.Ltmp10@IMGREL
	.long	0
	.long	.Ltmp14@IMGREL
	.long	2
	.long	.Ltmp12@IMGREL
	.long	1
	.long	.Ltmp13@IMGREL
	.long	-1
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E,unique,33

	.def	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE;
	.scl	3;
	.type	32;
	.endef
	.globl	__xmm@51e0179316183cedd60bd5d689c8336d
	.section	.rdata,"dr",discard,__xmm@51e0179316183cedd60bd5d689c8336d
	.p2align	4, 0x0
__xmm@51e0179316183cedd60bd5d689c8336d:
	.byte	109
	.byte	51
	.byte	200
	.byte	137
	.byte	214
	.byte	213
	.byte	11
	.byte	214
	.byte	237
	.byte	60
	.byte	24
	.byte	22
	.byte	147
	.byte	23
	.byte	224
	.byte	81
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE,unique,34
	.p2align	4
_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE:
.Lfunc_begin33:
.seh_proc _ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE
	.seh_handler __CxxFrameHandler3, @unwind, @except
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$88, %rsp
	.seh_stackalloc 88
	leaq	80(%rsp), %rbp
	.seh_setframe %rbp, 80
	.seh_endprologue
	movq	$-2, (%rbp)
	movq	%r8, %rdi
	movq	%rdx, %rbx
	movq	%rcx, %rsi
	movq	%rdx, -40(%rbp)
	movq	%r8, -32(%rbp)
.Ltmp16:
	leaq	-16(%rbp), %rcx
	callq	*24(%r8)
	nop
.Ltmp17:
	movdqa	-16(%rbp), %xmm0
	pcmpeqb	__xmm@51e0179316183cedd60bd5d689c8336d(%rip), %xmm0
	pmovmskb	%xmm0, %eax
	cmpl	$65535, %eax
	jne	.LBB33_2
	movl	8(%rbx), %eax
	movl	%eax, -8(%rbp)
	movq	%rbx, -24(%rbp)
	movq	(%rbx), %rax
	movq	%rax, -16(%rbp)
	movq	16(%rsi), %rdi
	cmpq	(%rsi), %rdi
	jne	.LBB33_6
.Ltmp20:
	movq	%rsi, %rcx
	callq	_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h2dce19cdc32559a3E
	nop
.Ltmp21:
.LBB33_6:
	movq	8(%rsi), %rax
	leaq	(%rdi,%rdi,2), %rcx
	movl	-8(%rbp), %edx
	movl	%edx, 8(%rax,%rcx,4)
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax,%rcx,4)
	incq	%rdi
	movq	%rdi, 16(%rsi)
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	-24(%rbp), %r8
	callq	*__imp_HeapFree(%rip)
	nop
	.seh_startepilogue
	addq	$88, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	retq
.LBB33_2:
	movq	%rbx, -16(%rbp)
	movq	%rdi, -8(%rbp)
.Ltmp18:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.44(%rip), %rax
	movq	%rax, 32(%rsp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.43(%rip), %rcx
	leaq	anon.b508fe7ec78c99d5e791de770789df49.26(%rip), %r9
	leaq	-16(%rbp), %r8
	movl	$25, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core6result13unwrap_failed
	nop
.Ltmp19:
	ud2
	.seh_handlerdata
	.long	$cppxdata$_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@IMGREL
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE,unique,34
	.seh_endproc
	.def	"?dtor$7@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$7@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@4HA":
.seh_proc "?dtor$7@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@4HA"
.LBB33_7:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	80(%rdx), %rbp
	.seh_endprologue
	leaq	-40(%rbp), %rcx
	callq	_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E
	nop
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE,unique,34
	.seh_endproc
	.def	"?dtor$8@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$8@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@4HA":
.seh_proc "?dtor$8@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@4HA"
.LBB33_8:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	80(%rdx), %rbp
	.seh_endprologue
	leaq	-16(%rbp), %rcx
	callq	_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E
	nop
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE,unique,34
	.seh_endproc
	.def	"?dtor$9@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$9@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@4HA":
.seh_proc "?dtor$9@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@4HA"
.LBB33_9:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$40, %rsp
	.seh_stackalloc 40
	leaq	80(%rdx), %rbp
	.seh_endprologue
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	-24(%rbp), %r8
	callq	*__imp_HeapFree(%rip)
	nop
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	retq
.Lfunc_end33:
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE,unique,34
	.seh_endproc
	.section	.xdata,"dr",associative,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE,unique,6
	.p2align	2, 0x0
$cppxdata$_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE:
	.long	429065506
	.long	3
	.long	$stateUnwindMap$_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@IMGREL
	.long	0
	.long	0
	.long	5
	.long	$ip2state$_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@IMGREL
	.long	80
	.long	0
	.long	1
$stateUnwindMap$_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE:
	.long	-1
	.long	"?dtor$7@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@4HA"@IMGREL
	.long	-1
	.long	"?dtor$8@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@4HA"@IMGREL
	.long	-1
	.long	"?dtor$9@?0?_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE@4HA"@IMGREL
$ip2state$_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE:
	.long	.Lfunc_begin33@IMGREL
	.long	-1
	.long	.Ltmp16@IMGREL
	.long	0
	.long	.Ltmp20@IMGREL
	.long	2
	.long	.Ltmp18@IMGREL
	.long	1
	.long	.Ltmp19@IMGREL
	.long	-1
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE,unique,34

	.def	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$6as_any17h9cf9c2ed2eace5ffE;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$6as_any17h9cf9c2ed2eace5ffE,unique,35
	.p2align	4
_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$6as_any17h9cf9c2ed2eace5ffE:
.Lfunc_begin34:
	movq	%rcx, %rax
	leaq	anon.b508fe7ec78c99d5e791de770789df49.42(%rip), %rdx
	retq
.Lfunc_end34:

	.def	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$6as_any17hb2eccc2f12461f42E;
	.scl	3;
	.type	32;
	.endef
	.section	.text,"xr",one_only,_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$6as_any17hb2eccc2f12461f42E,unique,36
	.p2align	4
_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$6as_any17hb2eccc2f12461f42E:
.Lfunc_begin35:
	movq	%rcx, %rax
	leaq	anon.b508fe7ec78c99d5e791de770789df49.41(%rip), %rdx
	retq
.Lfunc_end35:

	.def	_ZN9benchmark12ecs_checksum17h4fc2884772e760b4E;
	.scl	3;
	.type	32;
	.endef
	.globl	__xmm@954b12c8df80673ea62deeed96157d8d
	.section	.rdata,"dr",discard,__xmm@954b12c8df80673ea62deeed96157d8d
	.p2align	4, 0x0
__xmm@954b12c8df80673ea62deeed96157d8d:
	.byte	141
	.byte	125
	.byte	21
	.byte	150
	.byte	237
	.byte	238
	.byte	45
	.byte	166
	.byte	62
	.byte	103
	.byte	128
	.byte	223
	.byte	200
	.byte	18
	.byte	75
	.byte	149
	.globl	__xmm@fa121c8cead71781eb1a49b8335194f9
	.section	.rdata,"dr",discard,__xmm@fa121c8cead71781eb1a49b8335194f9
	.p2align	4, 0x0
__xmm@fa121c8cead71781eb1a49b8335194f9:
	.byte	249
	.byte	148
	.byte	81
	.byte	51
	.byte	184
	.byte	73
	.byte	26
	.byte	235
	.byte	129
	.byte	23
	.byte	215
	.byte	234
	.byte	140
	.byte	28
	.byte	18
	.byte	250
	.section	.text,"xr",one_only,_ZN9benchmark12ecs_checksum17h4fc2884772e760b4E,unique,37
	.p2align	4
_ZN9benchmark12ecs_checksum17h4fc2884772e760b4E:
.Lfunc_begin36:
.seh_proc _ZN9benchmark12ecs_checksum17h4fc2884772e760b4E
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$136, %rsp
	.seh_stackalloc 136
	movapd	%xmm8, 112(%rsp)
	.seh_savexmm %xmm8, 112
	movdqa	%xmm7, 96(%rsp)
	.seh_savexmm %xmm7, 96
	movdqa	%xmm6, 80(%rsp)
	.seh_savexmm %xmm6, 80
	.seh_endprologue
	testq	%rdx, %rdx
	je	.LBB36_1
	leaq	(%rdx,%rdx,2), %rax
	shlq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, 40(%rsp)
	xorpd	%xmm0, %xmm0
	movabsq	$-3023087607437839507, %r12
	movabsq	$5899741432353668333, %r13
	movabsq	$-2761615780896835794, %rbp
	movdqa	__xmm@954b12c8df80673ea62deeed96157d8d(%rip), %xmm6
	movdqa	__xmm@fa121c8cead71781eb1a49b8335194f9(%rip), %xmm7
	movl	$255, %r14d
	jmp	.LBB36_4
.LBB36_1:
	xorpd	%xmm0, %xmm0
.LBB36_2:
	movaps	80(%rsp), %xmm6
	movaps	96(%rsp), %xmm7
	movaps	112(%rsp), %xmm8
	.seh_startepilogue
	addq	$136, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	.seh_endepilogue
	retq
.LBB36_30:
	xorl	%r8d, %r8d
.LBB36_34:
	movapd	%xmm0, %xmm1
	leaq	(%r8,%r8,2), %rdx
	cvtps2pd	(%rax,%rdx,4), %xmm0
	movapd	%xmm0, %xmm2
	unpckhpd	%xmm0, %xmm2
	addsd	%xmm0, %xmm2
	movss	8(%rax,%rdx,4), %xmm0
	cvtss2sd	%xmm0, %xmm0
	addsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	.p2align	4
.LBB36_14:
	cmpq	40(%rsp), %rcx
	je	.LBB36_2
.LBB36_4:
	movq	%rcx, %rax
	addq	$48, %rcx
	movq	16(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB36_14
	movq	%rax, 72(%rsp)
	movq	8(%rax), %rsi
	cmpq	$1, %rdi
	jne	.LBB36_15
	xorl	%eax, %eax
	jmp	.LBB36_7
	.p2align	4
.LBB36_15:
	movq	%rdi, %rdx
	xorl	%eax, %eax
	.p2align	4
.LBB36_16:
	movq	%rax, %r8
	movq	%rdx, %r9
	shrq	%r9
	addq	%r9, %rax
	imulq	$56, %rax, %r10
	xorl	%r11d, %r11d
	cmpq	%r12, 24(%rsi,%r10)
	setne	%r11b
	cmovbl	%r14d, %r11d
	xorl	%ebx, %ebx
	cmpq	%r13, 32(%rsi,%r10)
	setne	%bl
	cmovbl	%r14d, %ebx
	testb	%r11b, %r11b
	cmovnel	%r11d, %ebx
	cmpb	$1, %bl
	cmoveq	%r8, %rax
	subq	%r9, %rdx
	cmpq	$1, %rdx
	ja	.LBB36_16
.LBB36_7:
	imulq	$56, %rax, %rdx
	movq	24(%rsi,%rdx), %r8
	movq	32(%rsi,%rdx), %r9
	movq	%r8, %rdx
	xorq	%r12, %rdx
	movq	%r9, %r10
	xorq	%r13, %r10
	orq	%rdx, %r10
	sete	32(%rsp)
	je	.LBB36_9
	xorl	%r10d, %r10d
	cmpq	%r13, %r9
	setb	%r10b
	xorl	%r9d, %r9d
	cmpq	%r12, %r8
	setb	%r9b
	cmovel	%r10d, %r9d
	movzbl	%r9b, %r8d
	addq	%r8, %rax
.LBB36_9:
	movq	%r12, %r13
	cmpq	$1, %rdi
	jne	.LBB36_17
	xorl	%ebx, %ebx
	jmp	.LBB36_11
	.p2align	4
.LBB36_17:
	movq	%rdi, %r8
	xorl	%ebx, %ebx
	movabsq	$1405020163985661027, %r12
	.p2align	4
.LBB36_18:
	movq	%rbx, %r9
	movq	%r8, %r10
	shrq	%r10
	addq	%r10, %rbx
	imulq	$56, %rbx, %r11
	xorl	%r15d, %r15d
	cmpq	%rbp, 24(%rsi,%r11)
	setne	%r15b
	cmovbl	%r14d, %r15d
	xorl	%edx, %edx
	cmpq	%r12, 32(%rsi,%r11)
	setne	%dl
	cmovbl	%r14d, %edx
	testb	%r15b, %r15b
	cmovnel	%r15d, %edx
	cmpb	$1, %dl
	cmoveq	%r9, %rbx
	subq	%r10, %r8
	cmpq	$1, %r8
	ja	.LBB36_18
.LBB36_11:
	imulq	$56, %rbx, %r15
	cmpq	%rbp, 24(%rsi,%r15)
	movq	%r13, %r12
	movabsq	$5899741432353668333, %r13
	jne	.LBB36_14
	movabsq	$1405020163985661027, %rdx
	cmpq	%rdx, 32(%rsi,%r15)
	jne	.LBB36_14
	cmpb	$0, 32(%rsp)
	je	.LBB36_14
	movq	%rcx, 32(%rsp)
	cmpq	%rdi, %rax
	jae	.LBB36_23
	movapd	%xmm0, %xmm8
	imulq	$56, %rax, %rax
	movq	40(%rsi,%rax), %rcx
	movq	48(%rsi,%rax), %rax
	callq	*24(%rax)
	movq	%rdx, %r8
	leaq	48(%rsp), %rcx
	movq	%rax, 64(%rsp)
	movq	%rax, %rdx
	callq	*24(%r8)
	movdqa	48(%rsp), %xmm0
	pcmpeqb	%xmm6, %xmm0
	pmovmskb	%xmm0, %eax
	cmpl	$65535, %eax
	jne	.LBB36_21
	cmpq	%rdi, %rbx
	jae	.LBB36_35
	movq	40(%rsi,%r15), %rcx
	movq	48(%rsi,%r15), %rax
	callq	*24(%rax)
	movq	%rax, %rdi
	movq	%rdx, %rax
	leaq	48(%rsp), %rcx
	movq	%rdi, %rdx
	callq	*24(%rax)
	movdqa	48(%rsp), %xmm0
	pcmpeqb	%xmm7, %xmm0
	pmovmskb	%xmm0, %eax
	cmpl	$65535, %eax
	jne	.LBB36_27
	movq	72(%rsp), %rax
	movq	40(%rax), %rdx
	movq	64(%rsp), %r8
	movq	16(%r8), %rax
	cmpq	%rdx, %rax
	cmovbq	%rax, %rdx
	movq	16(%rdi), %rax
	cmpq	%rdx, %rax
	cmovbq	%rax, %rdx
	testq	%rdx, %rdx
	movq	32(%rsp), %rcx
	movapd	%xmm8, %xmm0
	je	.LBB36_14
	movq	8(%r8), %rax
	cmpq	$1, %rdx
	je	.LBB36_30
	movq	%rdx, %r9
	movabsq	$1152921504606846974, %r8
	andq	%r8, %r9
	leaq	20(%rax), %r10
	xorl	%r8d, %r8d
	.p2align	4
.LBB36_32:
	cvtps2pd	-20(%r10), %xmm1
	movapd	%xmm1, %xmm2
	unpckhpd	%xmm1, %xmm2
	addsd	%xmm1, %xmm2
	movss	-12(%r10), %xmm1
	movss	(%r10), %xmm3
	cvtss2sd	%xmm1, %xmm1
	addsd	%xmm2, %xmm1
	addsd	%xmm0, %xmm1
	addq	$2, %r8
	cvtps2pd	-8(%r10), %xmm0
	movapd	%xmm0, %xmm2
	unpckhpd	%xmm0, %xmm2
	addsd	%xmm0, %xmm2
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm3, %xmm0
	addsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	addq	$24, %r10
	cmpq	%r8, %r9
	jne	.LBB36_32
	testb	$1, %dl
	jne	.LBB36_34
	jmp	.LBB36_14
.LBB36_21:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.11(%rip), %rcx
	leaq	anon.b508fe7ec78c99d5e791de770789df49.18(%rip), %r8
	movl	$13, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core6option13expect_failed
	ud2
.LBB36_27:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.14(%rip), %rcx
	leaq	anon.b508fe7ec78c99d5e791de770789df49.20(%rip), %r8
	movl	$13, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core6option13expect_failed
	ud2
.LBB36_23:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.17(%rip), %r8
	movq	%rax, %rcx
	movq	%rdi, %rdx
	callq	_RNvNtCs9N2lWLRSIT9_4core9panicking18panic_bounds_check
	ud2
.LBB36_35:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.19(%rip), %r8
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	callq	_RNvNtCs9N2lWLRSIT9_4core9panicking18panic_bounds_check
	ud2
.Lfunc_end36:
	.seh_endproc

	.def	_ZN9benchmark4main17h69cbf529f7153a9bE;
	.scl	2;
	.type	32;
	.endef
	.globl	__xmm@00000000000000003c8888893c888889
	.section	.rdata,"dr",discard,__xmm@00000000000000003c8888893c888889
	.p2align	4, 0x0
__xmm@00000000000000003c8888893c888889:
	.long	0x3c888889
	.long	0x3c888889
	.zero	4
	.zero	4
	.globl	__real@3c888889
	.section	.rdata,"dr",discard,__real@3c888889
	.p2align	2, 0x0
__real@3c888889:
	.long	0x3c888889
	.globl	__real@8000000000000000
	.section	.rdata,"dr",discard,__real@8000000000000000
	.p2align	3, 0x0
__real@8000000000000000:
	.quad	0x8000000000000000
	.globl	__real@4059000000000000
	.section	.rdata,"dr",discard,__real@4059000000000000
	.p2align	3, 0x0
__real@4059000000000000:
	.quad	0x4059000000000000
	.globl	__xmm@00000000000000004530000043300000
	.section	.rdata,"dr",discard,__xmm@00000000000000004530000043300000
	.p2align	4, 0x0
__xmm@00000000000000004530000043300000:
	.long	1127219200
	.long	1160773632
	.long	0
	.long	0
	.globl	__xmm@45300000000000004330000000000000
	.section	.rdata,"dr",discard,__xmm@45300000000000004330000000000000
	.p2align	4, 0x0
__xmm@45300000000000004330000000000000:
	.quad	0x4330000000000000
	.quad	0x4530000000000000
	.globl	__xmm@7fffffffffffffff7fffffffffffffff
	.section	.rdata,"dr",discard,__xmm@7fffffffffffffff7fffffffffffffff
	.p2align	4, 0x0
__xmm@7fffffffffffffff7fffffffffffffff:
	.quad	0x7fffffffffffffff
	.quad	0x7fffffffffffffff
	.globl	__real@3ff0000000000000
	.section	.rdata,"dr",discard,__real@3ff0000000000000
	.p2align	3, 0x0
__real@3ff0000000000000:
	.quad	0x3ff0000000000000
	.globl	__real@3eb0c6f7a0b5ed8d
	.section	.rdata,"dr",discard,__real@3eb0c6f7a0b5ed8d
	.p2align	3, 0x0
__real@3eb0c6f7a0b5ed8d:
	.quad	0x3eb0c6f7a0b5ed8d
	.globl	__real@3a83126f
	.section	.rdata,"dr",discard,__real@3a83126f
	.p2align	2, 0x0
__real@3a83126f:
	.long	0x3a83126f
	.globl	__xmm@0000000000000000be8000003f400000
	.section	.rdata,"dr",discard,__xmm@0000000000000000be8000003f400000
	.p2align	4, 0x0
__xmm@0000000000000000be8000003f400000:
	.long	0x3f400000
	.long	0xbe800000
	.zero	4
	.zero	4
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.globl	_ZN9benchmark4main17h69cbf529f7153a9bE
	.p2align	4
_ZN9benchmark4main17h69cbf529f7153a9bE:
.Lfunc_begin37:
.seh_proc _ZN9benchmark4main17h69cbf529f7153a9bE
	.seh_handler __CxxFrameHandler3, @unwind, @except
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$824, %rsp
	.seh_stackalloc 824
	leaq	128(%rsp), %rbp
	.seh_setframe %rbp, 128
	movapd	%xmm15, 672(%rbp)
	.seh_savexmm %xmm15, 800
	movapd	%xmm14, 656(%rbp)
	.seh_savexmm %xmm14, 784
	movaps	%xmm13, 640(%rbp)
	.seh_savexmm %xmm13, 768
	movapd	%xmm12, 624(%rbp)
	.seh_savexmm %xmm12, 752
	movaps	%xmm11, 608(%rbp)
	.seh_savexmm %xmm11, 736
	movaps	%xmm10, 592(%rbp)
	.seh_savexmm %xmm10, 720
	movaps	%xmm9, 576(%rbp)
	.seh_savexmm %xmm9, 704
	movaps	%xmm8, 560(%rbp)
	.seh_savexmm %xmm8, 688
	movaps	%xmm7, 544(%rbp)
	.seh_savexmm %xmm7, 672
	movapd	%xmm6, 528(%rbp)
	.seh_savexmm %xmm6, 656
	.seh_endprologue
	movq	$-2, 520(%rbp)
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.353.llvm.10752430264614768526(%rip), %rsi
	movq	%rsi, 64(%rbp)
	movq	$6, 72(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.46(%rip), %rcx
	movl	$81, %edx
	callq	_RNvNtNtCslk5dvTldH8g_3std2io5stdio31print_to_buffer_if_capture_used.llvm.10752430264614768526
	testb	%al, %al
	jne	.LBB37_4
	leaq	_RNvNvNtNtCslk5dvTldH8g_3std2io5stdio6stderr8INSTANCE(%rip), %rax
	movq	%rax, 216(%rbp)
	leaq	216(%rbp), %rax
	movq	%rax, 352(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.46(%rip), %rdx
	leaq	352(%rbp), %rcx
	movl	$81, %r8d
	callq	_RNvXso_NtNtCslk5dvTldH8g_3std2io5stdioRNtB5_6StderrNtB7_5Write9write_fmt
	testq	%rax, %rax
	jne	.LBB37_2
.LBB37_4:
	movq	%rsi, 64(%rbp)
	movq	$6, 72(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.47(%rip), %rcx
	movl	$45, %edx
	callq	_RNvNtNtCslk5dvTldH8g_3std2io5stdio31print_to_buffer_if_capture_used.llvm.10752430264614768526
	testb	%al, %al
	jne	.LBB37_7
	leaq	_RNvNvNtNtCslk5dvTldH8g_3std2io5stdio6stderr8INSTANCE(%rip), %rax
	movq	%rax, 216(%rbp)
	leaq	216(%rbp), %rax
	movq	%rax, 352(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.47(%rip), %rdx
	leaq	352(%rbp), %rcx
	movl	$45, %r8d
	callq	_RNvXso_NtNtCslk5dvTldH8g_3std2io5stdioRNtB5_6StderrNtB7_5Write9write_fmt
	testq	%rax, %rax
	jne	.LBB37_6
.LBB37_7:
	pxor	%xmm0, %xmm0
	movdqa	%xmm0, 384(%rbp)
	movdqa	%xmm0, 368(%rbp)
	movdqa	%xmm0, 352(%rbp)
	leaq	352(%rbp), %rcx
	callq	*__imp_GetSystemInfo(%rip)
	movl	384(%rbp), %eax
	cmpl	$1, %eax
	adcl	$0, %eax
	movq	%rax, 256(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.49(%rip), %rax
	movq	%rax, 352(%rbp)
	leaq	_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h42ee529b1b945a22E(%rip), %r14
	movq	%r14, 360(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.51(%rip), %rax
	movq	%rax, 368(%rbp)
	movq	%r14, 376(%rbp)
	leaq	256(%rbp), %rdi
	movq	%rdi, 384(%rbp)
	leaq	_RNvXsi_NtNtNtCs9N2lWLRSIT9_4core3fmt3num3impjNtB9_7Display3fmt(%rip), %r15
	movq	%r15, 392(%rbp)
	movq	%rsi, 288(%rbp)
	movq	$6, 296(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.52(%rip), %rcx
	leaq	352(%rbp), %rdx
	callq	_RNvNtNtCslk5dvTldH8g_3std2io5stdio31print_to_buffer_if_capture_used.llvm.10752430264614768526
	testb	%al, %al
	jne	.LBB37_10
	leaq	_RNvNvNtNtCslk5dvTldH8g_3std2io5stdio6stderr8INSTANCE(%rip), %rax
	movq	%rax, 480(%rbp)
	leaq	480(%rbp), %rax
	movq	%rax, 64(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.52(%rip), %rdx
	leaq	64(%rbp), %rcx
	leaq	352(%rbp), %r8
	callq	_RNvXso_NtNtCslk5dvTldH8g_3std2io5stdioRNtB5_6StderrNtB7_5Write9write_fmt
	testq	%rax, %rax
	jne	.LBB37_9
.LBB37_10:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.53(%rip), %rax
	movq	%rax, 216(%rbp)
	movq	$7, 224(%rbp)
	leaq	216(%rbp), %rbx
	movq	%rbx, 352(%rbp)
	movq	%r14, 360(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.54(%rip), %rcx
	movq	%rcx, 368(%rbp)
	movq	%r15, 376(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.55(%rip), %rax
	movq	%rax, 384(%rbp)
	movq	%r15, 392(%rbp)
	movq	%rcx, 400(%rbp)
	movq	%r15, 408(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.56(%rip), %rax
	movq	%rax, 416(%rbp)
	leaq	_RNvXs3_NtNtCs9N2lWLRSIT9_4core3fmt5floatfNtB7_7Display3fmt(%rip), %rax
	movq	%rax, 424(%rbp)
	movq	%rsi, 288(%rbp)
	movq	$6, 296(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.57(%rip), %rcx
	leaq	352(%rbp), %rdx
	callq	_RNvNtNtCslk5dvTldH8g_3std2io5stdio31print_to_buffer_if_capture_used.llvm.10752430264614768526
	testb	%al, %al
	jne	.LBB37_13
	leaq	_RNvNvNtNtCslk5dvTldH8g_3std2io5stdio6stderr8INSTANCE(%rip), %rax
	movq	%rax, 256(%rbp)
	movq	%rdi, 64(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.57(%rip), %rdx
	leaq	64(%rbp), %rcx
	leaq	352(%rbp), %r8
	callq	_RNvXso_NtNtCslk5dvTldH8g_3std2io5stdioRNtB5_6StderrNtB7_5Write9write_fmt
	testq	%rax, %rax
	jne	.LBB37_12
.LBB37_13:
	movq	%rsi, 64(%rbp)
	movq	$6, 72(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.58(%rip), %rcx
	movl	$229, %edx
	callq	_RNvNtNtCslk5dvTldH8g_3std2io5stdio31print_to_buffer_if_capture_used.llvm.10752430264614768526
	testb	%al, %al
	jne	.LBB37_16
	leaq	_RNvNvNtNtCslk5dvTldH8g_3std2io5stdio6stderr8INSTANCE(%rip), %rax
	movq	%rax, 216(%rbp)
	movq	%rbx, 352(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.58(%rip), %rdx
	leaq	352(%rbp), %rcx
	movl	$229, %r8d
	callq	_RNvXso_NtNtCslk5dvTldH8g_3std2io5stdioRNtB5_6StderrNtB7_5Write9write_fmt
	testq	%rax, %rax
	jne	.LBB37_15
.LBB37_16:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.59(%rip), %rcx
	movl	$183, %edx
	callq	_RNvNtNtCslk5dvTldH8g_3std2io5stdio6__print
	movq	$3, 224(%rbp)
	movq	$1000, 232(%rbp)
	movq	$10000, 240(%rbp)
	movq	$100000, 248(%rbp)
	movl	_tls_index(%rip), %eax
	movq	%gs:88, %rcx
	movq	(%rcx,%rax,8), %rax
	leaq	_RNvNCNKNvNvMNtNtCslk5dvTldH8g_3std4hash6randomNtBa_11RandomState3new4KEYS0s_023___RUST_STD_INTERNAL_VAL@SECREL32(%rax), %r14
	leaq	136(%rbp), %rdi
	xorl	%esi, %esi
	movabsq	$384307168202282325, %r12
	movsd	__xmm@0000000000000000be8000003f400000(%rip), %xmm9
	movaps	__xmm@00000000000000003c8888893c888889(%rip), %xmm10
	movss	__real@3c888889(%rip), %xmm11
	movsd	__real@8000000000000000(%rip), %xmm12
	movsd	__real@4059000000000000(%rip), %xmm6
	movsd	__xmm@00000000000000004530000043300000(%rip), %xmm14
	movapd	__xmm@45300000000000004330000000000000(%rip), %xmm15
	leaq	352(%rbp), %r15
	xorl	%eax, %eax
	cmpq	$3, %rax
	je	.LBB37_159
.LBB37_18:
	leaq	1(%rax), %rcx
	movq	%rcx, 216(%rbp)
	movq	232(%rbp,%rax,8), %rbx
	movq	%rbx, 336(%rbp)
	cmpb	$1, 16(%r14)
	jne	.LBB37_20
	movdqu	(%r14), %xmm0
.LBB37_21:
	movq	%xmm0, %rax
	incq	%rax
	movq	%rax, (%r14)
	movq	$0, 64(%rbp)
	movq	$8, 72(%rbp)
	movq	$0, 80(%rbp)
	movups	anon.91f2ae4b6f8e81ba91f1f659949883bf.194.llvm.10039253134249574194+16(%rip), %xmm1
	movups	%xmm1, 16(%rdi)
	movups	anon.91f2ae4b6f8e81ba91f1f659949883bf.194.llvm.10039253134249574194(%rip), %xmm1
	movups	%xmm1, (%rdi)
	movdqu	%xmm0, 168(%rbp)
	movq	$0, 88(%rbp)
	movq	$8, 96(%rbp)
	pxor	%xmm0, %xmm0
	movdqu	%xmm0, -32(%rdi)
	movq	$4, 120(%rbp)
	movq	$0, 128(%rbp)
	movq	$0, 184(%rbp)
	cmpq	%r12, %rbx
	ja	.LBB37_26
	movq	%rcx, 40(%rbp)
	leaq	(,%rbx,8), %rax
	leaq	(%rax,%rax,2), %rdi
	testq	%rdi, %rdi
	movq	%r14, 32(%rbp)
	je	.LBB37_23
	xorl	%edx, %edx
	movq	%rdi, %r8
	callq	_RNvNtNtNtCslk5dvTldH8g_3std3sys5alloc7windows18process_heap_alloc
	testq	%rax, %rax
	je	.LBB37_25
	movq	%rax, %r12
	movq	336(%rbp), %rcx
	jmp	.LBB37_28
.LBB37_23:
	movl	$4, %r12d
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
.LBB37_28:
	movq	%rbx, 256(%rbp)
	movq	%r12, 264(%rbp)
	movq	%r12, 208(%rbp)
	xorl	%r14d, %r14d
	xorl	%ebx, %ebx
	jmp	.LBB37_29
	.p2align	4
.LBB37_152:
	movq	264(%rbp), %r12
.LBB37_153:
	incq	%rbx
	leaq	(%r14,%r14,2), %rax
	movss	%xmm7, (%r12,%rax,8)
	movss	%xmm8, 4(%r12,%rax,8)
	movss	%xmm13, 8(%r12,%rax,8)
	movsd	%xmm9, 12(%r12,%rax,8)
	movl	$1056964608, 20(%r12,%rax,8)
	incq	%r14
	movq	336(%rbp), %rcx
.LBB37_29:
	movq	%r14, 272(%rbp)
	cmpq	%rcx, %rbx
	jae	.LBB37_30
	testq	%rbx, %rbx
	js	.LBB37_38
	cvtsi2ss	%rbx, %xmm7
	jmp	.LBB37_40
	.p2align	4
.LBB37_38:
	movq	%rbx, %rax
	shrq	%rax
	movl	%ebx, %ecx
	andl	$1, %ecx
	orq	%rax, %rcx
	cvtsi2ss	%rcx, %xmm7
	addss	%xmm7, %xmm7
.LBB37_40:
	mulss	__real@3a83126f(%rip), %xmm7
	movq	%rbx, %rax
	movabsq	$5895351198814392785, %rcx
	mulq	%rcx
	movq	%rdx, %rdi
	movq	%rbx, %rax
	movabsq	$595056260442243601, %rcx
	mulq	%rcx
	movq	%rdx, %r13
	movq	$0, 480(%rbp)
	movq	$8, 488(%rbp)
	movq	$0, 496(%rbp)
	movl	$12, %r8d
	xorl	%edx, %edx
	callq	_RNvNtNtNtCslk5dvTldH8g_3std3sys5alloc7windows18process_heap_alloc
	testq	%rax, %rax
	je	.LBB37_41
	movq	%rbx, %rcx
	subq	%rdi, %rcx
	shrq	%rcx
	addq	%rdi, %rcx
	shrq	$6, %rcx
	imull	$97, %ecx, %edx
	movl	%ebx, %ecx
	subl	%edx, %ecx
	cvtsi2ss	%ecx, %xmm8
	movq	%rbx, %rdx
	subq	%r13, %rdx
	shrq	%rdx
	addq	%r13, %rdx
	shrq	$4, %rdx
	movl	%edx, %ecx
	shll	$5, %ecx
	subl	%ecx, %edx
	addl	%ebx, %edx
	cvtsi2ss	%edx, %xmm13
	movss	%xmm7, (%rax)
	movss	%xmm8, 4(%rax)
	movq	%rax, 512(%rbp)
	movss	%xmm13, 8(%rax)
.Ltmp64:
	leaq	480(%rbp), %rcx
	callq	_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17hcf725f0e1b1cc1b2E
	nop
.Ltmp65:
	movq	488(%rbp), %rax
	leaq	anon.b508fe7ec78c99d5e791de770789df49.16(%rip), %rcx
	movq	%rcx, (%rax)
	movq	$19, 8(%rax)
	leaq	_ZN11rust_ecs_3d3ecs11make_column17h3aeea9adf661ae55E(%rip), %rcx
	movq	%rcx, 16(%rax)
	movups	anon.b508fe7ec78c99d5e791de770789df49.2(%rip), %xmm0
	movups	%xmm0, 24(%rax)
	movq	512(%rbp), %rcx
	movq	%rcx, 40(%rax)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.23(%rip), %rcx
	movq	%rcx, 48(%rax)
	movq	480(%rbp), %rax
	movq	488(%rbp), %rdi
	movq	%rax, 288(%rbp)
	movq	%rdi, 296(%rbp)
	movq	$1, 304(%rbp)
	movdqu	24(%rdi), %xmm0
	pcmpeqb	__xmm@137fa26520a05c63d9acc5143587f72e(%rip), %xmm0
	pmovmskb	%xmm0, %eax
	cmpl	$65535, %eax
	je	.LBB37_55
	movl	$12, %r8d
	xorl	%edx, %edx
	callq	_RNvNtNtNtCslk5dvTldH8g_3std3sys5alloc7windows18process_heap_alloc
	testq	%rax, %rax
	je	.LBB37_46
	movsd	%xmm9, (%rax)
	movl	$1056964608, 8(%rax)
	movq	288(%rbp), %r8
	cmpq	$1, %r8
	jne	.LBB37_48
.Ltmp66:
	movq	%rax, 512(%rbp)
	leaq	288(%rbp), %rcx
	callq	_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17hcf725f0e1b1cc1b2E
	nop
.Ltmp67:
	movq	296(%rbp), %rdi
	movl	288(%rbp), %r8d
	movl	292(%rbp), %ecx
	movq	512(%rbp), %rax
	jmp	.LBB37_51
	.p2align	4
.LBB37_48:
	movq	%r8, %rcx
	shrq	$32, %rcx
.LBB37_51:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.21(%rip), %rdx
	movq	%rdx, 56(%rdi)
	movq	$19, 64(%rdi)
	leaq	_ZN11rust_ecs_3d3ecs11make_column17hdf5c8365f5687efaE(%rip), %rdx
	movq	%rdx, 72(%rdi)
	movupd	anon.b508fe7ec78c99d5e791de770789df49.3(%rip), %xmm0
	movupd	%xmm0, 80(%rdi)
	movq	%rax, 96(%rdi)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.22(%rip), %rdx
	movq	%rdx, 104(%rdi)
	movq	$2, 304(%rbp)
	movl	%r8d, 352(%rbp)
	movl	%ecx, 356(%rbp)
	movq	%rdi, 360(%rbp)
	movq	$2, 368(%rbp)
.Ltmp68:
	leaq	480(%rbp), %rcx
	leaq	64(%rbp), %rdx
	movq	%r15, %r8
	callq	_ZN11rust_ecs_3d3ecs5World5spawn17h09a6089dd172fc4bE
	nop
.Ltmp69:
	cmpl	$5, 480(%rbp)
	jne	.LBB37_53
	cmpq	256(%rbp), %r14
	jne	.LBB37_153
.Ltmp70:
	leaq	256(%rbp), %rcx
	callq	_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h5b4fe8b83cd06994E
	nop
.Ltmp71:
	jmp	.LBB37_152
	.p2align	4
.LBB37_30:
	xorl	%edi, %edi
	.p2align	4
.LBB37_31:
	cmpq	$100, %rdi
	jae	.LBB37_32
	leaq	64(%rbp), %rax
	movq	%rax, 352(%rbp)
	#APP
	#NO_APP
	movq	352(%rbp), %rax
	movq	8(%rax), %rcx
	movq	16(%rax), %rdx
.Ltmp62:
	callq	_ZN9benchmark8ecs_step17h0b556ee2ce227fc7E
	nop
.Ltmp63:
	incq	%rdi
	movq	%r12, 352(%rbp)
	movq	%r14, 360(%rbp)
	#APP
	#NO_APP
	movq	360(%rbp), %rax
	testq	%rax, %rax
	je	.LBB37_31
	shlq	$3, %rax
	leaq	(%rax,%rax,2), %r8
	leaq	-24(%r8), %rcx
	movq	%rcx, %rax
	movabsq	$-6148914691236517205, %rdx
	mulq	%rdx
	movq	352(%rbp), %rax
	btl	$4, %edx
	movq	%rax, %rdx
	jb	.LBB37_147
	movsd	(%rax), %xmm0
	movsd	12(%rax), %xmm1
	mulps	%xmm10, %xmm1
	addps	%xmm0, %xmm1
	movlps	%xmm1, (%rax)
	movss	20(%rax), %xmm0
	mulss	%xmm11, %xmm0
	addss	8(%rax), %xmm0
	movss	%xmm0, 8(%rax)
	leaq	24(%rax), %rdx
.LBB37_147:
	cmpq	$24, %rcx
	jb	.LBB37_31
	addq	%r8, %rax
	.p2align	4
.LBB37_149:
	movsd	(%rdx), %xmm0
	movsd	12(%rdx), %xmm1
	movsd	24(%rdx), %xmm2
	movsd	36(%rdx), %xmm3
	mulps	%xmm10, %xmm1
	addps	%xmm0, %xmm1
	movlps	%xmm1, (%rdx)
	movss	20(%rdx), %xmm0
	mulss	%xmm11, %xmm0
	addss	8(%rdx), %xmm0
	movss	%xmm0, 8(%rdx)
	mulps	%xmm10, %xmm3
	addps	%xmm2, %xmm3
	movlps	%xmm3, 24(%rdx)
	movss	44(%rdx), %xmm0
	mulss	%xmm11, %xmm0
	addss	32(%rdx), %xmm0
	movss	%xmm0, 32(%rdx)
	addq	$48, %rdx
	cmpq	%rax, %rdx
	jne	.LBB37_149
	jmp	.LBB37_31
	.p2align	4
.LBB37_32:
	movq	%r14, %rdi
	andq	$-2, %rdi
	movq	$0, 200(%rbp)
	jmp	.LBB37_33
	.p2align	4
.LBB37_83:
	xorl	%eax, %eax
	movapd	%xmm12, %xmm1
.LBB37_87:
	movapd	%xmm1, %xmm2
	leaq	(%rax,%rax,2), %rax
	cvtps2pd	(%r12,%rax,8), %xmm1
	movapd	%xmm1, %xmm3
	unpckhpd	%xmm1, %xmm3
	addsd	%xmm1, %xmm3
	movss	8(%r12,%rax,8), %xmm1
	cvtss2sd	%xmm1, %xmm1
	addsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm1
.LBB37_88:
	movsd	%xmm1, -32(%rbp)
	subsd	%xmm1, %xmm0
	movapd	__xmm@7fffffffffffffff7fffffffffffffff(%rip), %xmm2
	andpd	%xmm2, %xmm1
	maxsd	__real@3ff0000000000000(%rip), %xmm1
	mulsd	__real@3eb0c6f7a0b5ed8d(%rip), %xmm1
	andpd	%xmm2, %xmm0
	ucomisd	%xmm0, %xmm1
	jb	.LBB37_89
.LBB37_33:
	movq	200(%rbp), %rax
	cmpq	$15, %rax
	jae	.LBB37_34
	leaq	1(%rax), %rcx
	movq	%rcx, 200(%rbp)
	movq	%rax, 24(%rbp)
	testb	$1, %al
	leaq	anon.b508fe7ec78c99d5e791de770789df49.61(%rip), %rdx
	movq	%rdx, %rax
	leaq	anon.b508fe7ec78c99d5e791de770789df49.60(%rip), %rcx
	cmoveq	%rcx, %rax
	cmoveq	%rdx, %rcx
	movq	$2, 296(%rbp)
	movq	%rax, 304(%rbp)
	movq	$7, 312(%rbp)
	movq	%rcx, 320(%rbp)
	movq	$7, 328(%rbp)
	xorl	%eax, %eax
	jmp	.LBB37_68
	.p2align	4
.LBB37_142:
	movq	344(%rbp), %rax
.LBB37_68:
	cmpq	$2, %rax
	je	.LBB37_80
	leaq	1(%rax), %rbx
	movq	%rbx, 288(%rbp)
	shlq	$4, %rax
	leaq	304(%rbp), %rcx
	movups	(%rcx,%rax), %xmm0
	movups	%xmm0, 8(%rbp)
	movq	_RNvNvNtNtNtNtNtCslk5dvTldH8g_3std3sys3pal7windows4time12perf_counter9frequency9FREQUENCY.0.llvm.10752430264614768526(%rip), %rsi
	testq	%rsi, %rsi
	jne	.LBB37_73
	movq	$0, 480(%rbp)
	leaq	480(%rbp), %rcx
	callq	*__imp_QueryPerformanceFrequency(%rip)
	testl	%eax, %eax
	je	.LBB37_71
	movq	480(%rbp), %rsi
	movq	%rsi, _RNvNvNtNtNtNtNtCslk5dvTldH8g_3std3sys3pal7windows4time12perf_counter9frequency9FREQUENCY.0.llvm.10752430264614768526(%rip)
.LBB37_73:
	movq	$0, 480(%rbp)
	leaq	480(%rbp), %rcx
	callq	*__imp_QueryPerformanceCounter(%rip)
	testl	%eax, %eax
	je	.LBB37_74
	testq	%rsi, %rsi
	je	.LBB37_76
	movq	480(%rbp), %rax
	movq	%rax, %rcx
	orq	%rsi, %rcx
	shrq	$32, %rcx
	je	.LBB37_91
	xorl	%edx, %edx
	divq	%rsi
	movq	%rax, %rcx
	jmp	.LBB37_93
	.p2align	4
.LBB37_91:
	xorl	%edx, %edx
	divl	%esi
	movl	%eax, %ecx
.LBB37_93:
	imulq	$1000000000, %rdx, %rax
	movq	%rax, %rdx
	orq	%rsi, %rdx
	shrq	$32, %rdx
	movq	%rbx, 344(%rbp)
	je	.LBB37_94
	xorl	%edx, %edx
	divq	%rsi
	jmp	.LBB37_96
	.p2align	4
.LBB37_94:
	xorl	%edx, %edx
	divl	%esi
.LBB37_96:
	imulq	$1000000000, %rcx, %r13
	addq	%rax, %r13
	movq	%r13, %rax
	shrq	$9, %rax
	movabsq	$19342813113834067, %rcx
	mulq	%rcx
	movq	%rdx, %rbx
	movq	8(%rbp), %r8
	movq	16(%rbp), %rax
	movq	%rax, 512(%rbp)
	cmpq	$7, %rax
	movq	%r8, 280(%rbp)
	jne	.LBB37_97
	movl	(%r8), %eax
	movl	$1601397605, %ecx
	xorl	%ecx, %eax
	movl	3(%r8), %ecx
	movl	$1634693983, %edx
	xorl	%edx, %ecx
	orl	%eax, %ecx
	je	.LBB37_109
.LBB37_97:
	xorl	%r8d, %r8d
	jmp	.LBB37_98
	.p2align	4
.LBB37_104:
	incq	%r8
	cmpq	$100, %r8
	je	.LBB37_105
.LBB37_98:
	movq	%r12, 352(%rbp)
	movq	%r14, 360(%rbp)
	#APP
	#NO_APP
	movq	360(%rbp), %rax
	testq	%rax, %rax
	je	.LBB37_104
	shlq	$3, %rax
	leaq	(%rax,%rax,2), %r9
	leaq	-24(%r9), %rcx
	movq	%rcx, %rax
	movabsq	$-6148914691236517205, %rdx
	mulq	%rdx
	movq	352(%rbp), %rax
	btl	$4, %edx
	movq	%rax, %rdx
	jb	.LBB37_101
	movsd	(%rax), %xmm0
	movsd	12(%rax), %xmm1
	mulps	%xmm10, %xmm1
	addps	%xmm0, %xmm1
	movlps	%xmm1, (%rax)
	movss	20(%rax), %xmm0
	mulss	%xmm11, %xmm0
	addss	8(%rax), %xmm0
	movss	%xmm0, 8(%rax)
	leaq	24(%rax), %rdx
.LBB37_101:
	cmpq	$24, %rcx
	jb	.LBB37_104
	addq	%r9, %rax
	.p2align	4
.LBB37_103:
	movsd	(%rdx), %xmm0
	movsd	12(%rdx), %xmm1
	movsd	24(%rdx), %xmm2
	movsd	36(%rdx), %xmm3
	mulps	%xmm10, %xmm1
	addps	%xmm0, %xmm1
	movlps	%xmm1, (%rdx)
	movss	20(%rdx), %xmm0
	mulss	%xmm11, %xmm0
	addss	8(%rdx), %xmm0
	movss	%xmm0, 8(%rdx)
	mulps	%xmm10, %xmm3
	addps	%xmm2, %xmm3
	movlps	%xmm3, 24(%rdx)
	movss	44(%rdx), %xmm0
	mulss	%xmm11, %xmm0
	addss	32(%rdx), %xmm0
	movss	%xmm0, 32(%rdx)
	addq	$48, %rdx
	cmpq	%rax, %rdx
	jne	.LBB37_103
	jmp	.LBB37_104
.LBB37_109:
	xorl	%esi, %esi
	.p2align	4
.LBB37_110:
	cmpq	$99, %rsi
	ja	.LBB37_105
	incq	%rsi
	leaq	64(%rbp), %rax
	movq	%rax, 352(%rbp)
	#APP
	#NO_APP
	movq	352(%rbp), %rax
	movq	8(%rax), %rcx
	movq	16(%rax), %rdx
.Ltmp50:
	callq	_ZN9benchmark8ecs_step17h0b556ee2ce227fc7E
	nop
.Ltmp51:
	jmp	.LBB37_110
	.p2align	4
.LBB37_105:
	movq	_RNvNvNtNtNtNtNtCslk5dvTldH8g_3std3sys3pal7windows4time12perf_counter9frequency9FREQUENCY.0.llvm.10752430264614768526(%rip), %rsi
	testq	%rsi, %rsi
	jne	.LBB37_114
	movq	$0, 480(%rbp)
	leaq	480(%rbp), %rcx
	callq	*__imp_QueryPerformanceFrequency(%rip)
	testl	%eax, %eax
	je	.LBB37_107
	movq	480(%rbp), %rsi
	movq	%rsi, _RNvNvNtNtNtNtNtCslk5dvTldH8g_3std3sys3pal7windows4time12perf_counter9frequency9FREQUENCY.0.llvm.10752430264614768526(%rip)
.LBB37_114:
	movq	$0, 480(%rbp)
	leaq	480(%rbp), %rcx
	callq	*__imp_QueryPerformanceCounter(%rip)
	testl	%eax, %eax
	je	.LBB37_115
	testq	%rsi, %rsi
	je	.LBB37_117
	movq	480(%rbp), %rax
	movq	%rax, %rcx
	orq	%rsi, %rcx
	shrq	$32, %rcx
	je	.LBB37_119
	xorl	%edx, %edx
	divq	%rsi
	movq	%rax, %rcx
	jmp	.LBB37_121
	.p2align	4
.LBB37_119:
	xorl	%edx, %edx
	divl	%esi
	movl	%eax, %ecx
.LBB37_121:
	imulq	$1000000000, %rdx, %rax
	movq	%rax, %rdx
	orq	%rsi, %rdx
	shrq	$32, %rdx
	je	.LBB37_122
	xorl	%edx, %edx
	divq	%rsi
	jmp	.LBB37_124
	.p2align	4
.LBB37_122:
	xorl	%edx, %edx
	divl	%esi
.LBB37_124:
	shrq	$11, %rbx
	imull	$1000000000, %ebx, %edx
	subl	%edx, %r13d
	imulq	$1000000000, %rcx, %rcx
	addq	%rax, %rcx
	movq	%rcx, %rax
	shrq	$9, %rax
	movabsq	$19342813113834067, %rdx
	mulq	%rdx
	shrq	$11, %rdx
	imull	$1000000000, %edx, %eax
	subl	%eax, %ecx
	movq	%rdx, 352(%rbp)
	movl	%ecx, 360(%rbp)
.Ltmp32:
	movq	%r15, %rcx
	movq	%rbx, %rdx
	movl	%r13d, %r8d
	callq	_RNvMNtCslk5dvTldH8g_3std4timeNtB2_7Instant22checked_duration_since
	nop
.Ltmp33:
	movl	%edx, %ecx
	movl	$1000000000, %edx
	mulq	%rdx
	cmpl	$1000000000, %ecx
	movl	$0, %r8d
	cmovel	%r8d, %ecx
	cmoveq	%r8, %rdx
	movl	$0, %esi
	cmoveq	%r8, %rax
	addq	%rax, %rcx
	adcq	$0, %rdx
	movq	%rcx, 48(%rbp)
	movq	%rdx, 56(%rbp)
	cmpq	$7, 512(%rbp)
	jne	.LBB37_127
	movq	280(%rbp), %rdx
	movl	(%rdx), %eax
	movl	$1601397605, %ecx
	xorl	%ecx, %eax
	movl	3(%rdx), %ecx
	movl	$1634693983, %edx
	xorl	%edx, %ecx
	orl	%eax, %ecx
	je	.LBB37_134
.LBB37_127:
	movapd	%xmm12, %xmm0
	testq	%r14, %r14
	je	.LBB37_135
	leaq	-1(%r14), %rax
	testq	%rax, %rax
	je	.LBB37_129
	leaq	32(%r12), %rcx
	xorl	%eax, %eax
	movapd	%xmm12, %xmm0
	.p2align	4
.LBB37_131:
	cvtps2pd	-32(%rcx), %xmm1
	movapd	%xmm1, %xmm2
	unpckhpd	%xmm1, %xmm2
	addsd	%xmm1, %xmm2
	movss	-24(%rcx), %xmm1
	movss	(%rcx), %xmm3
	cvtss2sd	%xmm1, %xmm1
	addsd	%xmm2, %xmm1
	addsd	%xmm0, %xmm1
	cvtps2pd	-8(%rcx), %xmm0
	movapd	%xmm0, %xmm2
	unpckhpd	%xmm0, %xmm2
	addsd	%xmm0, %xmm2
	xorps	%xmm0, %xmm0
	cvtss2sd	%xmm3, %xmm0
	addsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	addq	$2, %rax
	addq	$48, %rcx
	cmpq	%rax, %rdi
	jne	.LBB37_131
	testb	$1, %r14b
	jne	.LBB37_133
	jmp	.LBB37_135
.LBB37_129:
	xorl	%eax, %eax
	movapd	%xmm12, %xmm0
.LBB37_133:
	movapd	%xmm0, %xmm1
	leaq	(%rax,%rax,2), %rax
	cvtps2pd	(%r12,%rax,8), %xmm0
	movapd	%xmm0, %xmm2
	unpckhpd	%xmm0, %xmm2
	addsd	%xmm0, %xmm2
	movss	8(%r12,%rax,8), %xmm0
	cvtss2sd	%xmm0, %xmm0
	addsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	jmp	.LBB37_135
.LBB37_134:
	movq	72(%rbp), %rcx
	movq	80(%rbp), %rdx
.Ltmp34:
	callq	_ZN9benchmark12ecs_checksum17h4fc2884772e760b4E
	nop
.Ltmp35:
	.p2align	4
.LBB37_135:
	movsd	%xmm0, (%rbp)
	movq	%rbp, %rbx
	#APP
	#NO_APP
	movapd	48(%rbp), %xmm0
	movapd	%xmm0, -80(%rbp)
	leaq	-80(%rbp), %rcx
	callq	__floatuntidf
	divsd	%xmm6, %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	336(%rbp), %xmm1
	unpcklps	%xmm14, %xmm1
	subpd	%xmm15, %xmm1
	movapd	%xmm1, %xmm2
	unpckhpd	%xmm1, %xmm2
	addsd	%xmm1, %xmm2
	divsd	%xmm2, %xmm0
	movsd	%xmm0, -16(%rbp)
	leaq	8(%rbp), %rax
	movq	%rax, 352(%rbp)
	leaq	_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h42ee529b1b945a22E(%rip), %rax
	movq	%rax, 360(%rbp)
	leaq	336(%rbp), %rax
	movq	%rax, 368(%rbp)
	leaq	_RNvXsi_NtNtNtCs9N2lWLRSIT9_4core3fmt3num3impjNtB9_7Display3fmt(%rip), %rax
	movq	%rax, 376(%rbp)
	leaq	24(%rbp), %rcx
	movq	%rcx, 384(%rbp)
	movq	%rax, 392(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.54(%rip), %rcx
	movq	%rcx, 400(%rbp)
	movq	%rax, 408(%rbp)
	leaq	48(%rbp), %rax
	movq	%rax, 416(%rbp)
	leaq	_RNvXNtNtCs9N2lWLRSIT9_4core3fmt3numoNtB4_7Display3fmt(%rip), %rax
	movq	%rax, 424(%rbp)
	leaq	-8(%rbp), %rax
	movq	%rax, 432(%rbp)
	leaq	_RNvXs7_NtNtCs9N2lWLRSIT9_4core3fmt5floatdNtB7_7Display3fmt(%rip), %rax
	movq	%rax, 440(%rbp)
	leaq	-16(%rbp), %rcx
	movq	%rcx, 448(%rbp)
	movq	%rax, 456(%rbp)
	movq	%rbx, 464(%rbp)
	movq	%rax, 472(%rbp)
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.352.llvm.10752430264614768526(%rip), %rax
	movq	%rax, -56(%rbp)
	movq	$6, -48(%rbp)
.Ltmp36:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.64(%rip), %rcx
	movq	%r15, %rdx
	callq	_RNvNtNtCslk5dvTldH8g_3std2io5stdio31print_to_buffer_if_capture_used.llvm.10752430264614768526
	nop
.Ltmp37:
	testb	%al, %al
	jne	.LBB37_142
	movl	_RNvNtNtCslk5dvTldH8g_3std2io5stdio6STDOUT.llvm.10752430264614768526+56(%rip), %eax
	testl	%eax, %eax
	jne	.LBB37_138
.LBB37_139:
	leaq	_RNvNtNtCslk5dvTldH8g_3std2io5stdio6STDOUT.llvm.10752430264614768526(%rip), %rax
	movq	%rax, -40(%rbp)
	leaq	-40(%rbp), %rax
	movq	%rax, 480(%rbp)
.Ltmp40:
	leaq	480(%rbp), %rcx
	leaq	anon.b508fe7ec78c99d5e791de770789df49.64(%rip), %rdx
	movq	%r15, %r8
	callq	_RNvXse_NtNtCslk5dvTldH8g_3std2io5stdioRNtB5_6StdoutNtB7_5Write9write_fmt
	nop
.Ltmp41:
	testq	%rax, %rax
	je	.LBB37_142
	jmp	.LBB37_141
.LBB37_138:
.Ltmp38:
	callq	_RINvMNtNtCslk5dvTldH8g_3std4sync9once_lockINtB3_8OnceLockINtNtB5_14reentrant_lock13ReentrantLockINtNtCs9N2lWLRSIT9_4core4cell7RefCellINtNtNtNtB7_2io8buffered10linewriter10LineWriterNtNtB2e_5stdio9StdoutRawEEEE10initializeNCINvB2_11get_or_initNCNvB2V_6stdout0E0zEB7_.llvm.10752430264614768526
	nop
.Ltmp39:
	jmp	.LBB37_139
	.p2align	4
.LBB37_80:
	movq	72(%rbp), %rcx
	movq	80(%rbp), %rdx
.Ltmp58:
	callq	_ZN9benchmark12ecs_checksum17h4fc2884772e760b4E
	nop
.Ltmp59:
	movq	%xmm0, -24(%rbp)
	movapd	%xmm12, %xmm1
	testq	%r14, %r14
	je	.LBB37_88
	leaq	-1(%r14), %rax
	testq	%rax, %rax
	je	.LBB37_83
	leaq	32(%r12), %rcx
	xorl	%eax, %eax
	movapd	%xmm12, %xmm1
	.p2align	4
.LBB37_85:
	cvtps2pd	-32(%rcx), %xmm2
	movapd	%xmm2, %xmm3
	unpckhpd	%xmm2, %xmm3
	addsd	%xmm2, %xmm3
	movss	-24(%rcx), %xmm2
	movss	(%rcx), %xmm4
	cvtss2sd	%xmm2, %xmm2
	addsd	%xmm3, %xmm2
	addsd	%xmm1, %xmm2
	cvtps2pd	-8(%rcx), %xmm1
	movapd	%xmm1, %xmm3
	unpckhpd	%xmm1, %xmm3
	addsd	%xmm1, %xmm3
	xorps	%xmm1, %xmm1
	cvtss2sd	%xmm4, %xmm1
	addsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm1
	addq	$2, %rax
	addq	$48, %rcx
	cmpq	%rax, %rdi
	jne	.LBB37_85
	testb	$1, %r14b
	jne	.LBB37_87
	jmp	.LBB37_88
	.p2align	4
.LBB37_34:
	cmpq	$0, 256(%rbp)
	je	.LBB37_36
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%r12, %r8
	callq	*__imp_HeapFree(%rip)
.LBB37_36:
	leaq	64(%rbp), %rcx
	callq	_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE
	movq	40(%rbp), %rax
	movq	32(%rbp), %r14
	leaq	136(%rbp), %rdi
	movabsq	$384307168202282325, %r12
	cmpq	$3, %rax
	jne	.LBB37_18
	jmp	.LBB37_159
.LBB37_20:
	pxor	%xmm0, %xmm0
	movdqa	%xmm0, 352(%rbp)
	movl	$16, %edx
	movq	%rcx, %rbx
	movq	%r15, %rcx
	callq	*__imp_ProcessPrng(%rip)
	movq	%rbx, %rcx
	movq	360(%rbp), %rax
	movdqa	352(%rbp), %xmm0
	movq	%rax, 8(%r14)
	movb	$1, 16(%r14)
	movq	336(%rbp), %rbx
	jmp	.LBB37_21
.LBB37_141:
	movq	%rax, 192(%rbp)
	leaq	-56(%rbp), %rax
	movq	%rax, 480(%rbp)
	leaq	_RNvXs1i_NtCs9N2lWLRSIT9_4core3fmtReNtB6_7Display3fmtCslk5dvTldH8g_3std.llvm.10752430264614768526(%rip), %rax
	movq	%rax, 488(%rbp)
	leaq	192(%rbp), %rax
	movq	%rax, 496(%rbp)
	leaq	_RNvXs7_NtNtCslk5dvTldH8g_3std2io5errorNtB5_5ErrorNtNtCs9N2lWLRSIT9_4core3fmt7Display3fmt(%rip), %rax
	movq	%rax, 504(%rbp)
.Ltmp42:
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.67.llvm.10752430264614768526(%rip), %rcx
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.69.llvm.10752430264614768526(%rip), %r8
	leaq	480(%rbp), %rdx
	callq	_RNvNtCs9N2lWLRSIT9_4core9panicking9panic_fmt
	nop
.Ltmp43:
	jmp	.LBB37_3
.LBB37_159:
	movaps	528(%rbp), %xmm6
	movaps	544(%rbp), %xmm7
	movaps	560(%rbp), %xmm8
	movaps	576(%rbp), %xmm9
	movaps	592(%rbp), %xmm10
	movaps	608(%rbp), %xmm11
	movaps	624(%rbp), %xmm12
	movaps	640(%rbp), %xmm13
	movaps	656(%rbp), %xmm14
	movaps	672(%rbp), %xmm15
	.seh_startepilogue
	addq	$824, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
.LBB37_41:
.Ltmp78:
	movl	$4, %ecx
	movl	$12, %edx
	callq	_RNvNtCsgRIRWNK8DTq_5alloc5alloc18handle_alloc_error
	nop
.Ltmp79:
	jmp	.LBB37_3
.LBB37_46:
.Ltmp72:
	movl	$4, %ecx
	movl	$12, %edx
	callq	_RNvNtCsgRIRWNK8DTq_5alloc5alloc18handle_alloc_error
	nop
.Ltmp73:
	jmp	.LBB37_3
.LBB37_89:
	leaq	-24(%rbp), %rax
	movq	%rax, 352(%rbp)
	leaq	_RNvXs7_NtNtCs9N2lWLRSIT9_4core3fmt5floatdNtB7_7Display3fmt(%rip), %rcx
	movq	%rcx, 360(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, 368(%rbp)
	movq	%rcx, 376(%rbp)
.Ltmp60:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.62(%rip), %rcx
	leaq	anon.b508fe7ec78c99d5e791de770789df49.63(%rip), %r8
	leaq	352(%rbp), %rdx
	callq	_RNvNtCs9N2lWLRSIT9_4core9panicking9panic_fmt
	nop
.Ltmp61:
	jmp	.LBB37_3
.LBB37_76:
.Ltmp52:
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.154.llvm.10752430264614768526(%rip), %rcx
	callq	_RNvNtNtCs9N2lWLRSIT9_4core9panicking11panic_const23panic_const_div_by_zero
	nop
.Ltmp53:
	jmp	.LBB37_3
.LBB37_115:
	callq	*__imp_GetLastError(%rip)
	shlq	$32, %rax
	orq	$2, %rax
	movq	%rax, 352(%rbp)
.Ltmp46:
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.471.llvm.10752430264614768526(%rip), %rax
	movq	%rax, 32(%rsp)
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.135.llvm.10752430264614768526(%rip), %rcx
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.138.llvm.10752430264614768526(%rip), %r9
	leaq	352(%rbp), %r8
	movl	$43, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core6result13unwrap_failed
	nop
.Ltmp47:
	jmp	.LBB37_3
.LBB37_117:
.Ltmp44:
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.154.llvm.10752430264614768526(%rip), %rcx
	callq	_RNvNtNtCs9N2lWLRSIT9_4core9panicking11panic_const23panic_const_div_by_zero
	nop
.Ltmp45:
	jmp	.LBB37_3
.LBB37_74:
	callq	*__imp_GetLastError(%rip)
	shlq	$32, %rax
	orq	$2, %rax
	movq	%rax, 352(%rbp)
.Ltmp54:
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.471.llvm.10752430264614768526(%rip), %rax
	movq	%rax, 32(%rsp)
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.135.llvm.10752430264614768526(%rip), %rcx
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.138.llvm.10752430264614768526(%rip), %r9
	leaq	352(%rbp), %r8
	movl	$43, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core6result13unwrap_failed
	nop
.Ltmp55:
	jmp	.LBB37_3
.LBB37_2:
	movq	%rax, 288(%rbp)
	leaq	64(%rbp), %rax
	movq	%rax, 352(%rbp)
	leaq	_RNvXs1i_NtCs9N2lWLRSIT9_4core3fmtReNtB6_7Display3fmtCslk5dvTldH8g_3std.llvm.10752430264614768526(%rip), %rax
	movq	%rax, 360(%rbp)
	leaq	288(%rbp), %rax
	movq	%rax, 368(%rbp)
	leaq	_RNvXs7_NtNtCslk5dvTldH8g_3std2io5errorNtB5_5ErrorNtNtCs9N2lWLRSIT9_4core3fmt7Display3fmt(%rip), %rax
	movq	%rax, 376(%rbp)
.Ltmp22:
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.67.llvm.10752430264614768526(%rip), %rcx
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.69.llvm.10752430264614768526(%rip), %r8
	leaq	352(%rbp), %rdx
	callq	_RNvNtCs9N2lWLRSIT9_4core9panicking9panic_fmt
	nop
.Ltmp23:
	jmp	.LBB37_3
.LBB37_6:
	movq	%rax, 288(%rbp)
	leaq	64(%rbp), %rax
	movq	%rax, 352(%rbp)
	leaq	_RNvXs1i_NtCs9N2lWLRSIT9_4core3fmtReNtB6_7Display3fmtCslk5dvTldH8g_3std.llvm.10752430264614768526(%rip), %rax
	movq	%rax, 360(%rbp)
	leaq	288(%rbp), %rax
	movq	%rax, 368(%rbp)
	leaq	_RNvXs7_NtNtCslk5dvTldH8g_3std2io5errorNtB5_5ErrorNtNtCs9N2lWLRSIT9_4core3fmt7Display3fmt(%rip), %rax
	movq	%rax, 376(%rbp)
.Ltmp24:
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.67.llvm.10752430264614768526(%rip), %rcx
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.69.llvm.10752430264614768526(%rip), %r8
	leaq	352(%rbp), %rdx
	callq	_RNvNtCs9N2lWLRSIT9_4core9panicking9panic_fmt
	nop
.Ltmp25:
	jmp	.LBB37_3
.LBB37_9:
	movq	%rax, 216(%rbp)
	leaq	288(%rbp), %rax
	movq	%rax, 64(%rbp)
	leaq	_RNvXs1i_NtCs9N2lWLRSIT9_4core3fmtReNtB6_7Display3fmtCslk5dvTldH8g_3std.llvm.10752430264614768526(%rip), %rax
	movq	%rax, 72(%rbp)
	leaq	216(%rbp), %rax
	movq	%rax, 80(%rbp)
	leaq	_RNvXs7_NtNtCslk5dvTldH8g_3std2io5errorNtB5_5ErrorNtNtCs9N2lWLRSIT9_4core3fmt7Display3fmt(%rip), %rax
	movq	%rax, 88(%rbp)
.Ltmp26:
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.67.llvm.10752430264614768526(%rip), %rcx
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.69.llvm.10752430264614768526(%rip), %r8
	leaq	64(%rbp), %rdx
	callq	_RNvNtCs9N2lWLRSIT9_4core9panicking9panic_fmt
	nop
.Ltmp27:
	jmp	.LBB37_3
.LBB37_12:
	movq	%rax, 480(%rbp)
	leaq	288(%rbp), %rax
	movq	%rax, 64(%rbp)
	leaq	_RNvXs1i_NtCs9N2lWLRSIT9_4core3fmtReNtB6_7Display3fmtCslk5dvTldH8g_3std.llvm.10752430264614768526(%rip), %rax
	movq	%rax, 72(%rbp)
	leaq	480(%rbp), %rax
	movq	%rax, 80(%rbp)
	leaq	_RNvXs7_NtNtCslk5dvTldH8g_3std2io5errorNtB5_5ErrorNtNtCs9N2lWLRSIT9_4core3fmt7Display3fmt(%rip), %rax
	movq	%rax, 88(%rbp)
.Ltmp28:
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.67.llvm.10752430264614768526(%rip), %rcx
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.69.llvm.10752430264614768526(%rip), %r8
	leaq	64(%rbp), %rdx
	callq	_RNvNtCs9N2lWLRSIT9_4core9panicking9panic_fmt
	nop
.Ltmp29:
	jmp	.LBB37_3
.LBB37_15:
	movq	%rax, 288(%rbp)
	leaq	64(%rbp), %rax
	movq	%rax, 352(%rbp)
	leaq	_RNvXs1i_NtCs9N2lWLRSIT9_4core3fmtReNtB6_7Display3fmtCslk5dvTldH8g_3std.llvm.10752430264614768526(%rip), %rax
	movq	%rax, 360(%rbp)
	leaq	288(%rbp), %rax
	movq	%rax, 368(%rbp)
	leaq	_RNvXs7_NtNtCslk5dvTldH8g_3std2io5errorNtB5_5ErrorNtNtCs9N2lWLRSIT9_4core3fmt7Display3fmt(%rip), %rax
	movq	%rax, 376(%rbp)
.Ltmp30:
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.67.llvm.10752430264614768526(%rip), %rcx
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.69.llvm.10752430264614768526(%rip), %r8
	leaq	352(%rbp), %rdx
	callq	_RNvNtCs9N2lWLRSIT9_4core9panicking9panic_fmt
	nop
.Ltmp31:
	jmp	.LBB37_3
.LBB37_71:
	callq	*__imp_GetLastError(%rip)
	shlq	$32, %rax
	orq	$2, %rax
	movq	%rax, 352(%rbp)
.Ltmp56:
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.473.llvm.10752430264614768526(%rip), %rax
	movq	%rax, 32(%rsp)
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.135.llvm.10752430264614768526(%rip), %rcx
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.138.llvm.10752430264614768526(%rip), %r9
	leaq	352(%rbp), %r8
	movl	$43, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core6result13unwrap_failed
	nop
.Ltmp57:
	jmp	.LBB37_3
.LBB37_107:
	callq	*__imp_GetLastError(%rip)
	shlq	$32, %rax
	orq	$2, %rax
	movq	%rax, 352(%rbp)
.Ltmp48:
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.473.llvm.10752430264614768526(%rip), %rax
	movq	%rax, 32(%rsp)
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.135.llvm.10752430264614768526(%rip), %rcx
	leaq	anon.32a2af1bbf6a8b8558ce716b079c9e59.138.llvm.10752430264614768526(%rip), %r9
	leaq	352(%rbp), %r8
	movl	$43, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core6result13unwrap_failed
	nop
.Ltmp49:
	jmp	.LBB37_3
.LBB37_55:
	movq	40(%rdi), %rax
	movq	%rax, 344(%rbp)
	movq	%rdi, 280(%rbp)
	movq	48(%rdi), %rax
	movq	%rax, 512(%rbp)
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.LBB37_57
.Ltmp74:
	movq	344(%rbp), %rcx
	callq	*%rax
	nop
.Ltmp75:
.LBB37_57:
	movq	512(%rbp), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.LBB37_59
	movq	512(%rbp), %rax
	movq	16(%rax), %r8
	movq	344(%rbp), %rcx
	callq	_RNvCsGIExRX8pES_7___rustc14___rust_dealloc
.LBB37_59:
	cmpq	$0, 288(%rbp)
	je	.LBB37_61
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	280(%rbp), %r8
	callq	*__imp_HeapFree(%rip)
.LBB37_61:
	movl	$1, 480(%rbp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.21(%rip), %rax
	movq	%rax, 488(%rbp)
	movq	$19, 496(%rbp)
.LBB37_53:
	movq	496(%rbp), %rax
	movq	%rax, 368(%rbp)
	movl	480(%rbp), %eax
	movl	%eax, 352(%rbp)
	movl	484(%rbp), %eax
	movl	%eax, 356(%rbp)
	movq	488(%rbp), %rax
	movq	%rax, 360(%rbp)
.Ltmp76:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.65(%rip), %rax
	movq	%rax, 32(%rsp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.28(%rip), %rcx
	leaq	anon.b508fe7ec78c99d5e791de770789df49.27(%rip), %r9
	leaq	352(%rbp), %r8
	movl	$43, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core6result13unwrap_failed
	nop
.Ltmp77:
	jmp	.LBB37_3
.LBB37_25:
	movl	$4, %esi
	movq	%rdi, 208(%rbp)
.LBB37_26:
.Ltmp80:
	movq	%rsi, %rcx
	movq	208(%rbp), %rdx
	callq	_RNvNtCsgRIRWNK8DTq_5alloc7raw_vec12handle_error
	nop
.Ltmp81:
.LBB37_3:
	ud2
	.seh_handlerdata
	.long	$cppxdata$_ZN9benchmark4main17h69cbf529f7153a9bE@IMGREL
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$42@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$42@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$42@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_42:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	anon.b508fe7ec78c99d5e791de770789df49.23(%rip), %rdx
	movq	512(%rbp), %rcx
	callq	_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E
	movaps	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movaps	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movaps	48(%rsp), %xmm14
	movaps	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$54@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$54@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$54@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_54:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	anon.b508fe7ec78c99d5e791de770789df49.22(%rip), %rdx
	movq	512(%rbp), %rcx
	callq	_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..Entry$GT$17he303f0ffcc96e6f2E
	movaps	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movaps	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movaps	48(%rsp), %xmm14
	movaps	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$62@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$62@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$62@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_62:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	movq	512(%rbp), %rax
	movq	8(%rax), %rdx
	testq	%rdx, %rdx
	je	.LBB37_64
	movq	512(%rbp), %rax
	movq	16(%rax), %r8
	movq	344(%rbp), %rcx
	callq	_RNvCsGIExRX8pES_7___rustc14___rust_dealloc
.LBB37_64:
	cmpq	$0, 288(%rbp)
	je	.LBB37_66
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	280(%rbp), %r8
	callq	*__imp_HeapFree(%rip)
.LBB37_66:
	movapd	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movapd	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movapd	48(%rsp), %xmm14
	movapd	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$77@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$77@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$77@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_77:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	cmpq	$0, 256(%rbp)
	je	.LBB37_79
	movq	264(%rbp), %rsi
	callq	*__imp_GetProcessHeap(%rip)
	movq	%rax, %rcx
	xorl	%edx, %edx
	movq	%rsi, %r8
	callq	*__imp_HeapFree(%rip)
.LBB37_79:
	movapd	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movapd	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movapd	48(%rsp), %xmm14
	movapd	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$112@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$112@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$112@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_112:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	352(%rbp), %rcx
	callq	_RINvNtCs9N2lWLRSIT9_4core3ptr13drop_in_placeNtNtNtCslk5dvTldH8g_3std2io5error5ErrorEBM_.llvm.10752430264614768526
	movaps	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movaps	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movaps	48(%rsp), %xmm14
	movaps	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$154@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$154@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$154@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_154:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	288(%rbp), %rcx
	callq	_RINvNtCs9N2lWLRSIT9_4core3ptr13drop_in_placeNtNtNtCslk5dvTldH8g_3std2io5error5ErrorEBM_.llvm.10752430264614768526
	movaps	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movaps	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movaps	48(%rsp), %xmm14
	movaps	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$155@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$155@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$155@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_155:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	288(%rbp), %rcx
	callq	_RINvNtCs9N2lWLRSIT9_4core3ptr13drop_in_placeNtNtNtCslk5dvTldH8g_3std2io5error5ErrorEBM_.llvm.10752430264614768526
	movaps	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movaps	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movaps	48(%rsp), %xmm14
	movaps	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$156@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$156@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$156@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_156:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	216(%rbp), %rcx
	callq	_RINvNtCs9N2lWLRSIT9_4core3ptr13drop_in_placeNtNtNtCslk5dvTldH8g_3std2io5error5ErrorEBM_.llvm.10752430264614768526
	movaps	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movaps	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movaps	48(%rsp), %xmm14
	movaps	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$157@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$157@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$157@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_157:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	480(%rbp), %rcx
	callq	_RINvNtCs9N2lWLRSIT9_4core3ptr13drop_in_placeNtNtNtCslk5dvTldH8g_3std2io5error5ErrorEBM_.llvm.10752430264614768526
	movaps	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movaps	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movaps	48(%rsp), %xmm14
	movaps	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$158@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$158@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$158@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_158:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	288(%rbp), %rcx
	callq	_RINvNtCs9N2lWLRSIT9_4core3ptr13drop_in_placeNtNtNtCslk5dvTldH8g_3std2io5error5ErrorEBM_.llvm.10752430264614768526
	movaps	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movaps	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movaps	48(%rsp), %xmm14
	movaps	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$160@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$160@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$160@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_160:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	64(%rbp), %rcx
	callq	_ZN4core3ptr44drop_in_place$LT$rust_ecs_3d..ecs..World$GT$17hd10af69d607d99ecE
	movaps	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movaps	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movaps	48(%rsp), %xmm14
	movaps	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$161@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$161@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$161@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_161:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	480(%rbp), %rcx
	callq	_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE
	movapd	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movapd	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movapd	48(%rsp), %xmm14
	movapd	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$162@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$162@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$162@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_162:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	288(%rbp), %rcx
	callq	_ZN4core3ptr45drop_in_place$LT$rust_ecs_3d..ecs..Bundle$GT$17ha471a6f5978ffb3bE
	movapd	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movapd	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movapd	48(%rsp), %xmm14
	movapd	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$163@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$163@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$163@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_163:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	352(%rbp), %rcx
	callq	_RINvNtCs9N2lWLRSIT9_4core3ptr13drop_in_placeNtNtNtCslk5dvTldH8g_3std2io5error5ErrorEBM_.llvm.10752430264614768526
	movaps	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movaps	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movaps	48(%rsp), %xmm14
	movaps	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$164@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$164@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$164@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_164:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	352(%rbp), %rcx
	callq	_RINvNtCs9N2lWLRSIT9_4core3ptr13drop_in_placeNtNtNtCslk5dvTldH8g_3std2io5error5ErrorEBM_.llvm.10752430264614768526
	movaps	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movaps	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movaps	48(%rsp), %xmm14
	movaps	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$165@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$165@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$165@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_165:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	352(%rbp), %rcx
	callq	_RINvNtCs9N2lWLRSIT9_4core3ptr13drop_in_placeNtNtNtCslk5dvTldH8g_3std2io5error5ErrorEBM_.llvm.10752430264614768526
	movaps	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movaps	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movaps	48(%rsp), %xmm14
	movaps	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.def	"?dtor$166@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA";
	.scl	3;
	.type	32;
	.endef
	.p2align	4
"?dtor$166@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA":
.seh_proc "?dtor$166@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"
.LBB37_166:
	movq	%rdx, 16(%rsp)
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	leaq	128(%rdx), %rbp
	movapd	%xmm15, 32(%rsp)
	.seh_savexmm %xmm15, 32
	movapd	%xmm14, 48(%rsp)
	.seh_savexmm %xmm14, 48
	movaps	%xmm13, 64(%rsp)
	.seh_savexmm %xmm13, 64
	movapd	%xmm12, 80(%rsp)
	.seh_savexmm %xmm12, 80
	movaps	%xmm11, 96(%rsp)
	.seh_savexmm %xmm11, 96
	movaps	%xmm10, 112(%rsp)
	.seh_savexmm %xmm10, 112
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 144(%rsp)
	.seh_savexmm %xmm8, 144
	movaps	%xmm7, 160(%rsp)
	.seh_savexmm %xmm7, 160
	movapd	%xmm6, 176(%rsp)
	.seh_savexmm %xmm6, 176
	.seh_endprologue
	leaq	192(%rbp), %rcx
	callq	_RINvNtCs9N2lWLRSIT9_4core3ptr13drop_in_placeNtNtNtCslk5dvTldH8g_3std2io5error5ErrorEBM_.llvm.10752430264614768526
	movaps	176(%rsp), %xmm6
	movaps	160(%rsp), %xmm7
	movaps	144(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	112(%rsp), %xmm10
	movaps	96(%rsp), %xmm11
	movaps	80(%rsp), %xmm12
	movaps	64(%rsp), %xmm13
	movaps	48(%rsp), %xmm14
	movaps	32(%rsp), %xmm15
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.seh_endepilogue
	retq
.Lfunc_end37:
	.seh_handlerdata
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38
	.seh_endproc
	.section	.xdata,"dr",associative,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,7
	.p2align	2, 0x0
$cppxdata$_ZN9benchmark4main17h69cbf529f7153a9bE:
	.long	429065506
	.long	17
	.long	$stateUnwindMap$_ZN9benchmark4main17h69cbf529f7153a9bE@IMGREL
	.long	0
	.long	0
	.long	26
	.long	$ip2state$_ZN9benchmark4main17h69cbf529f7153a9bE@IMGREL
	.long	648
	.long	0
	.long	1
$stateUnwindMap$_ZN9benchmark4main17h69cbf529f7153a9bE:
	.long	-1
	.long	"?dtor$154@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	-1
	.long	"?dtor$155@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	-1
	.long	"?dtor$156@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	-1
	.long	"?dtor$157@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	-1
	.long	"?dtor$158@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	-1
	.long	"?dtor$160@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	5
	.long	"?dtor$77@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	6
	.long	"?dtor$166@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	6
	.long	"?dtor$165@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	6
	.long	"?dtor$112@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	6
	.long	"?dtor$164@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	6
	.long	"?dtor$163@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	6
	.long	"?dtor$62@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	6
	.long	"?dtor$162@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	13
	.long	"?dtor$54@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	6
	.long	"?dtor$161@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
	.long	15
	.long	"?dtor$42@?0?_ZN9benchmark4main17h69cbf529f7153a9bE@4HA"@IMGREL
$ip2state$_ZN9benchmark4main17h69cbf529f7153a9bE:
	.long	.Lfunc_begin37@IMGREL
	.long	-1
	.long	.Ltmp64@IMGREL
	.long	16
	.long	.Ltmp66@IMGREL
	.long	14
	.long	.Ltmp68@IMGREL
	.long	6
	.long	.Ltmp35@IMGREL
	.long	-1
	.long	.Ltmp36@IMGREL
	.long	6
	.long	.Ltmp59@IMGREL
	.long	-1
	.long	.Ltmp42@IMGREL
	.long	7
	.long	.Ltmp78@IMGREL
	.long	15
	.long	.Ltmp72@IMGREL
	.long	13
	.long	.Ltmp60@IMGREL
	.long	6
	.long	.Ltmp46@IMGREL
	.long	8
	.long	.Ltmp44@IMGREL
	.long	6
	.long	.Ltmp54@IMGREL
	.long	10
	.long	.Ltmp22@IMGREL
	.long	0
	.long	.Ltmp24@IMGREL
	.long	1
	.long	.Ltmp26@IMGREL
	.long	2
	.long	.Ltmp28@IMGREL
	.long	3
	.long	.Ltmp30@IMGREL
	.long	4
	.long	.Ltmp56@IMGREL
	.long	11
	.long	.Ltmp48@IMGREL
	.long	9
	.long	.Ltmp74@IMGREL
	.long	12
	.long	.Ltmp75@IMGREL
	.long	-1
	.long	.Ltmp76@IMGREL
	.long	6
	.long	.Ltmp80@IMGREL
	.long	5
	.long	.Ltmp81@IMGREL
	.long	-1
	.section	.text,"xr",one_only,_ZN9benchmark4main17h69cbf529f7153a9bE,unique,38

	.def	_ZN9benchmark8ecs_step17h0b556ee2ce227fc7E;
	.scl	3;
	.type	32;
	.endef
	.globl	__xmm@3c8888893c8888893c8888893c888889
	.section	.rdata,"dr",discard,__xmm@3c8888893c8888893c8888893c888889
	.p2align	4, 0x0
__xmm@3c8888893c8888893c8888893c888889:
	.long	0x3c888889
	.long	0x3c888889
	.long	0x3c888889
	.long	0x3c888889
	.section	.text,"xr",one_only,_ZN9benchmark8ecs_step17h0b556ee2ce227fc7E,unique,39
	.p2align	4
_ZN9benchmark8ecs_step17h0b556ee2ce227fc7E:
.Lfunc_begin38:
.seh_proc _ZN9benchmark8ecs_step17h0b556ee2ce227fc7E
	pushq	%r15
	.seh_pushreg %r15
	pushq	%r14
	.seh_pushreg %r14
	pushq	%r13
	.seh_pushreg %r13
	pushq	%r12
	.seh_pushreg %r12
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$200, %rsp
	.seh_stackalloc 200
	movaps	%xmm12, 176(%rsp)
	.seh_savexmm %xmm12, 176
	movaps	%xmm11, 160(%rsp)
	.seh_savexmm %xmm11, 160
	movaps	%xmm10, 144(%rsp)
	.seh_savexmm %xmm10, 144
	movaps	%xmm9, 128(%rsp)
	.seh_savexmm %xmm9, 128
	movaps	%xmm8, 112(%rsp)
	.seh_savexmm %xmm8, 112
	movdqa	%xmm7, 96(%rsp)
	.seh_savexmm %xmm7, 96
	movdqa	%xmm6, 80(%rsp)
	.seh_savexmm %xmm6, 80
	.seh_endprologue
	testq	%rdx, %rdx
	je	.LBB38_37
	movq	%rcx, %r8
	leaq	(%rdx,%rdx,2), %rax
	shlq	$4, %rax
	addq	%rcx, %rax
	movq	%rax, 48(%rsp)
	movabsq	$-3023087607437839507, %r12
	movabsq	$5899741432353668333, %r13
	movabsq	$-2761615780896835794, %rbp
	movabsq	$1405020163985661027, %rdi
	movdqa	__xmm@954b12c8df80673ea62deeed96157d8d(%rip), %xmm6
	movdqa	__xmm@fa121c8cead71781eb1a49b8335194f9(%rip), %xmm7
	movaps	__xmm@00000000000000003c8888893c888889(%rip), %xmm8
	movss	__real@3c888889(%rip), %xmm9
	movaps	__xmm@3c8888893c8888893c8888893c888889(%rip), %xmm10
	movl	$255, %r15d
	jmp	.LBB38_4
.LBB38_2:
	movq	56(%rsp), %r8
	.p2align	4
.LBB38_3:
	cmpq	48(%rsp), %r8
	je	.LBB38_37
.LBB38_4:
	movq	%r8, %rcx
	addq	$48, %r8
	movq	16(%rcx), %rax
	testq	%rax, %rax
	je	.LBB38_3
	movq	%r8, 56(%rsp)
	movq	8(%rcx), %r14
	cmpq	$1, %rax
	jne	.LBB38_7
	xorl	%edx, %edx
	jmp	.LBB38_9
	.p2align	4
.LBB38_7:
	movq	%rax, %rcx
	xorl	%edx, %edx
	.p2align	4
.LBB38_8:
	movq	%rdx, %r8
	movq	%rcx, %r9
	shrq	%r9
	addq	%r9, %rdx
	imulq	$56, %rdx, %r10
	xorl	%r11d, %r11d
	cmpq	%r12, 24(%r14,%r10)
	setne	%r11b
	cmovbl	%r15d, %r11d
	xorl	%esi, %esi
	cmpq	%r13, 32(%r14,%r10)
	setne	%sil
	cmovbl	%r15d, %esi
	testb	%r11b, %r11b
	cmovnel	%r11d, %esi
	cmpb	$1, %sil
	cmoveq	%r8, %rdx
	subq	%r9, %rcx
	cmpq	$1, %rcx
	ja	.LBB38_8
.LBB38_9:
	imulq	$56, %rdx, %r8
	movq	24(%r14,%r8), %rcx
	movq	32(%r14,%r8), %r9
	movq	%rcx, %r8
	xorq	%r12, %r8
	movq	%r9, %r10
	xorq	%r13, %r10
	orq	%r8, %r10
	sete	47(%rsp)
	je	.LBB38_11
	xorl	%r10d, %r10d
	cmpq	%r13, %r9
	setb	%r10b
	xorl	%r9d, %r9d
	cmpq	%r12, %rcx
	setb	%r9b
	cmovel	%r10d, %r9d
	movzbl	%r9b, %ecx
	addq	%rcx, %rdx
.LBB38_11:
	cmpq	$1, %rax
	jne	.LBB38_13
	xorl	%ecx, %ecx
	jmp	.LBB38_15
	.p2align	4
.LBB38_13:
	movq	%rax, %r9
	xorl	%ecx, %ecx
	.p2align	4
.LBB38_14:
	movq	%rcx, %r10
	movq	%r9, %r11
	shrq	%r11
	addq	%r11, %rcx
	imulq	$56, %rcx, %rsi
	xorl	%ebx, %ebx
	cmpq	%rbp, 24(%r14,%rsi)
	setne	%bl
	cmovbl	%r15d, %ebx
	xorl	%r8d, %r8d
	cmpq	%rdi, 32(%r14,%rsi)
	setne	%r8b
	cmovbl	%r15d, %r8d
	testb	%bl, %bl
	cmovnel	%ebx, %r8d
	cmpb	$1, %r8b
	cmoveq	%r10, %rcx
	subq	%r11, %r9
	cmpq	$1, %r9
	ja	.LBB38_14
.LBB38_15:
	imulq	$56, %rcx, %rsi
	cmpq	%rbp, 24(%r14,%rsi)
	movq	56(%rsp), %r8
	jne	.LBB38_3
	cmpq	%rdi, 32(%r14,%rsi)
	jne	.LBB38_3
	cmpb	$0, 47(%rsp)
	je	.LBB38_3
	cmpq	%rcx, %rdx
	jae	.LBB38_21
	cmpq	%rax, %rcx
	ja	.LBB38_41
	jne	.LBB38_24
	jmp	.LBB38_42
.LBB38_21:
	cmpq	%rax, %rdx
	ja	.LBB38_38
	je	.LBB38_44
	cmpq	%rdx, %rcx
	jae	.LBB38_43
.LBB38_24:
	imulq	$56, %rdx, %rax
	movq	40(%r14,%rax), %rcx
	movq	48(%r14,%rax), %rax
	callq	*32(%rax)
	movq	%rax, %rbx
	movq	%rdx, %rax
	leaq	64(%rsp), %rcx
	movq	%rbx, %rdx
	callq	*24(%rax)
	movdqa	64(%rsp), %xmm0
	pcmpeqb	%xmm6, %xmm0
	pmovmskb	%xmm0, %eax
	cmpl	$65535, %eax
	jne	.LBB38_39
	movq	40(%r14,%rsi), %rcx
	movq	48(%r14,%rsi), %rax
	callq	*32(%rax)
	movq	%rax, %r14
	movq	%rdx, %rax
	leaq	64(%rsp), %rcx
	movq	%r14, %rdx
	callq	*24(%rax)
	movdqa	64(%rsp), %xmm0
	pcmpeqb	%xmm7, %xmm0
	pmovmskb	%xmm0, %eax
	cmpl	$65535, %eax
	jne	.LBB38_40
	movq	16(%rbx), %rax
	movq	16(%r14), %rcx
	cmpq	%rax, %rcx
	cmovbq	%rcx, %rax
	testq	%rax, %rax
	je	.LBB38_2
	movq	8(%rbx), %rcx
	movq	8(%r14), %rdx
	cmpq	$4, %rax
	jb	.LBB38_28
	leaq	(,%rax,4), %r8
	leaq	(%r8,%r8,2), %r8
	leaq	(%rdx,%r8), %r9
	cmpq	%r9, %rcx
	jae	.LBB38_32
	addq	%rcx, %r8
	cmpq	%r8, %rdx
	jae	.LBB38_32
.LBB38_28:
	xorl	%r8d, %r8d
.LBB38_35:
	leaq	(%r8,%r8,2), %r9
	leaq	8(,%r9,4), %r9
	subq	%r8, %rax
	.p2align	4
.LBB38_36:
	movsd	-8(%rdx,%r9), %xmm0
	mulps	%xmm8, %xmm0
	movsd	-8(%rcx,%r9), %xmm1
	addps	%xmm0, %xmm1
	movlps	%xmm1, -8(%rcx,%r9)
	movss	(%rdx,%r9), %xmm0
	mulss	%xmm9, %xmm0
	addss	(%rcx,%r9), %xmm0
	movss	%xmm0, (%rcx,%r9)
	addq	$12, %r9
	decq	%rax
	jne	.LBB38_36
	jmp	.LBB38_2
.LBB38_32:
	movq	%rax, %r8
	movabsq	$1152921504606846972, %r9
	andq	%r9, %r8
	xorl	%r9d, %r9d
	movq	%r8, %r10
	.p2align	4
.LBB38_33:
	movss	44(%rdx,%r9), %xmm0
	movss	32(%rdx,%r9), %xmm2
	unpcklps	%xmm0, %xmm2
	movss	20(%rdx,%r9), %xmm3
	movss	(%rdx,%r9), %xmm0
	movss	4(%rdx,%r9), %xmm1
	movss	8(%rdx,%r9), %xmm5
	unpcklps	%xmm3, %xmm5
	movlhps	%xmm2, %xmm5
	movss	12(%rdx,%r9), %xmm2
	unpcklps	%xmm2, %xmm0
	mulps	%xmm10, %xmm5
	movss	44(%rcx,%r9), %xmm2
	movss	32(%rcx,%r9), %xmm11
	unpcklps	%xmm2, %xmm11
	movss	20(%rcx,%r9), %xmm12
	movss	(%rcx,%r9), %xmm3
	movss	4(%rcx,%r9), %xmm4
	movss	8(%rcx,%r9), %xmm2
	unpcklps	%xmm12, %xmm2
	movlhps	%xmm11, %xmm2
	addps	%xmm5, %xmm2
	movss	12(%rcx,%r9), %xmm5
	unpcklps	%xmm5, %xmm3
	movss	40(%rcx,%r9), %xmm5
	movss	28(%rcx,%r9), %xmm11
	unpcklps	%xmm5, %xmm11
	movss	16(%rcx,%r9), %xmm5
	unpcklps	%xmm5, %xmm4
	movlhps	%xmm11, %xmm4
	movss	36(%rcx,%r9), %xmm5
	movss	24(%rcx,%r9), %xmm11
	unpcklps	%xmm5, %xmm11
	movlhps	%xmm11, %xmm3
	movss	40(%rdx,%r9), %xmm5
	movss	28(%rdx,%r9), %xmm11
	unpcklps	%xmm5, %xmm11
	movss	16(%rdx,%r9), %xmm5
	unpcklps	%xmm5, %xmm1
	movlhps	%xmm11, %xmm1
	movss	36(%rdx,%r9), %xmm5
	movss	24(%rdx,%r9), %xmm11
	unpcklps	%xmm5, %xmm11
	movlhps	%xmm11, %xmm0
	mulps	%xmm10, %xmm1
	addps	%xmm4, %xmm1
	mulps	%xmm10, %xmm0
	addps	%xmm3, %xmm0
	movaps	%xmm0, %xmm3
	shufps	$255, %xmm1, %xmm3
	shufps	$233, %xmm2, %xmm3
	shufps	$210, %xmm3, %xmm3
	movaps	%xmm2, %xmm4
	shufps	$212, %xmm0, %xmm4
	movaps	%xmm1, %xmm5
	movlhps	%xmm0, %xmm5
	shufps	$130, %xmm4, %xmm5
	shufps	$85, %xmm1, %xmm2
	unpckhpd	%xmm1, %xmm0
	shufps	$130, %xmm0, %xmm2
	movups	%xmm2, 16(%rcx,%r9)
	movups	%xmm5, (%rcx,%r9)
	movups	%xmm3, 32(%rcx,%r9)
	addq	$48, %r9
	addq	$-4, %r10
	jne	.LBB38_33
	cmpq	%r8, %rax
	je	.LBB38_2
	jmp	.LBB38_35
.LBB38_37:
	movaps	80(%rsp), %xmm6
	movaps	96(%rsp), %xmm7
	movaps	112(%rsp), %xmm8
	movaps	128(%rsp), %xmm9
	movaps	144(%rsp), %xmm10
	movaps	160(%rsp), %xmm11
	movaps	176(%rsp), %xmm12
	.seh_startepilogue
	addq	$200, %rsp
	popq	%rbx
	popq	%rbp
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	.seh_endepilogue
	retq
.LBB38_38:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.25(%rip), %rcx
	leaq	anon.b508fe7ec78c99d5e791de770789df49.5(%rip), %r8
	movl	$19, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core9panicking9panic_fmt
	ud2
.LBB38_39:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.11(%rip), %rcx
	leaq	anon.b508fe7ec78c99d5e791de770789df49.12(%rip), %r8
	movl	$13, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core6option13expect_failed
	ud2
.LBB38_40:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.14(%rip), %rcx
	leaq	anon.b508fe7ec78c99d5e791de770789df49.15(%rip), %r8
	movl	$13, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core6option13expect_failed
	ud2
.LBB38_41:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.25(%rip), %rcx
	leaq	anon.b508fe7ec78c99d5e791de770789df49.8(%rip), %r8
	movl	$19, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core9panicking9panic_fmt
	ud2
.LBB38_42:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.9(%rip), %r8
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core9panicking18panic_bounds_check
	ud2
.LBB38_43:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.7(%rip), %r8
	callq	_RNvNtCs9N2lWLRSIT9_4core9panicking18panic_bounds_check
	ud2
.LBB38_44:
	leaq	anon.b508fe7ec78c99d5e791de770789df49.6(%rip), %r8
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	callq	_RNvNtCs9N2lWLRSIT9_4core9panicking18panic_bounds_check
	ud2
.Lfunc_end38:
	.seh_endproc

	.def	main;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",one_only,main,unique,40
	.globl	main
	.p2align	4
main:
.Lfunc_begin39:
.seh_proc main
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%rdx, %r9
	movslq	%ecx, %r8
	leaq	_ZN9benchmark4main17h69cbf529f7153a9bE(%rip), %rax
	movq	%rax, 48(%rsp)
	movb	$0, 32(%rsp)
	leaq	anon.b508fe7ec78c99d5e791de770789df49.24(%rip), %rdx
	leaq	48(%rsp), %rcx
	callq	_RNvNtCslk5dvTldH8g_3std2rt19lang_start_internal
	nop
	.seh_startepilogue
	addq	$56, %rsp
	.seh_endepilogue
	retq
.Lfunc_end39:
	.seh_endproc

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.0,unique,41
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.0:
	.quad	_ZN4core3ptr77drop_in_place$LT$rust_ecs_3d..ecs..TypedColumn$LT$benchmark..Position$GT$$GT$17h12ad3ae020af1b1dE
	.asciz	"\030\000\000\000\000\000\000\000\b\000\000\000\000\000\000"
	.quad	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$6as_any17h9cf9c2ed2eace5ffE
	.quad	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$10as_any_mut17h2a3d69d82943a8fcE
	.quad	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17he6c2a9f3e075ea4aE
	.quad	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$11swap_remove17hae943442ace9669aE
	.quad	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$16swap_remove_drop17h510933a940fc1b46E

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.1,unique,42
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.1:
	.quad	_ZN4core3ptr77drop_in_place$LT$rust_ecs_3d..ecs..TypedColumn$LT$benchmark..Position$GT$$GT$17h12ad3ae020af1b1dE
	.asciz	"\030\000\000\000\000\000\000\000\b\000\000\000\000\000\000"
	.quad	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$6as_any17hb2eccc2f12461f42E
	.quad	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$10as_any_mut17h22176cbf6cdeba80E
	.quad	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$4push17h0919e29c7c3c0c81E
	.quad	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$11swap_remove17h8396e09de5cae836E
	.quad	_ZN89_$LT$rust_ecs_3d..ecs..TypedColumn$LT$T$GT$$u20$as$u20$rust_ecs_3d..ecs..ErasedColumn$GT$16swap_remove_drop17h510933a940fc1b46E

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.2,unique,43
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.2:
	.quad	-3023087607437839507
	.quad	5899741432353668333

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.3,unique,44
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.3:
	.quad	-2761615780896835794
	.quad	1405020163985661027

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.4,unique,45
anon.b508fe7ec78c99d5e791de770789df49.4:
	.asciz	"src\\ecs.rs"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.5,unique,46
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.5:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.4
	.asciz	"\n\000\000\000\000\000\000\000\347\001\000\0007\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.6,unique,47
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.6:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.4
	.asciz	"\n\000\000\000\000\000\000\000\350\001\000\000\027\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.7,unique,48
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.7:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.4
	.asciz	"\n\000\000\000\000\000\000\000\350\001\000\000&\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.8,unique,49
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.8:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.4
	.asciz	"\n\000\000\000\000\000\000\000\344\001\000\0007\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.9,unique,50
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.9:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.4
	.asciz	"\n\000\000\000\000\000\000\000\345\001\000\000%\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.10,unique,51
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.10:
	.quad	-6472254385268884083
	.quad	-7689031284852496578

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.11,unique,52
anon.b508fe7ec78c99d5e791de770789df49.11:
	.ascii	"Typ kolumny A"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.12,unique,53
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.12:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.4
	.asciz	"\n\000\000\000\000\000\000\000\356\001\000\000\022\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.13,unique,54
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.13:
	.quad	-1505810069918214919
	.quad	-427247623085811839

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.14,unique,55
anon.b508fe7ec78c99d5e791de770789df49.14:
	.ascii	"Typ kolumny B"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.15,unique,56
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.15:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.4
	.asciz	"\n\000\000\000\000\000\000\000\363\001\000\000\022\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.16,unique,57
anon.b508fe7ec78c99d5e791de770789df49.16:
	.ascii	"benchmark::Position"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.17,unique,58
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.17:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.4
	.asciz	"\n\000\000\000\000\000\000\000\216\001\000\000&\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.18,unique,59
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.18:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.4
	.asciz	"\n\000\000\000\000\000\000\000\222\001\000\000\022\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.19,unique,60
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.19:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.4
	.asciz	"\n\000\000\000\000\000\000\000\223\001\000\000&\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.20,unique,61
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.20:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.4
	.asciz	"\n\000\000\000\000\000\000\000\227\001\000\000\022\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.21,unique,62
anon.b508fe7ec78c99d5e791de770789df49.21:
	.ascii	"benchmark::Velocity"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.22,unique,63
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.22:
	.asciz	"\000\000\000\000\000\000\000\000\f\000\000\000\000\000\000\000\004\000\000\000\000\000\000"
	.quad	_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h966f94812fa9fbf9E

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.23,unique,64
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.23:
	.asciz	"\000\000\000\000\000\000\000\000\f\000\000\000\000\000\000\000\004\000\000\000\000\000\000"
	.quad	_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h9c72df069e4641e2E

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.24,unique,65
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.24:
	.asciz	"\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\b\000\000\000\000\000\000"
	.quad	_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17ha654f34c7b287520E
	.quad	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h221471c0058ed7f6E
	.quad	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17h221471c0058ed7f6E

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.25,unique,66
anon.b508fe7ec78c99d5e791de770789df49.25:
	.ascii	"mid > len"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.26,unique,67
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.26:
	.quad	_ZN4core3ptr114drop_in_place$LT$alloc..boxed..Box$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hbe3e06e44b717239E
	.asciz	"\020\000\000\000\000\000\000\000\b\000\000\000\000\000\000"
	.quad	_ZN67_$LT$alloc..boxed..Box$LT$T$C$A$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hb693ce5af18efb60E

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.27,unique,68
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.27:
	.asciz	"\000\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000\b\000\000\000\000\000\000"
	.quad	_ZN63_$LT$rust_ecs_3d..ecs..EcsError$u20$as$u20$core..fmt..Debug$GT$3fmt17h264be93e7cdaefe1E

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.28,unique,69
anon.b508fe7ec78c99d5e791de770789df49.28:
	.ascii	"called `Result::unwrap()` on an `Err` value"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.29,unique,70
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.29:
	.asciz	"\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\004\000\000\000\000\000\000"
	.quad	_RNvXsW_NtNtCs9N2lWLRSIT9_4core3fmt3nummNtB7_5Debug3fmt

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.30,unique,71
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.30:
	.asciz	"\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\b\000\000\000\000\000\000"
	.quad	_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h06188036efc5adb1E

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.31,unique,72
anon.b508fe7ec78c99d5e791de770789df49.31:
	.ascii	"Entity"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.32,unique,73
anon.b508fe7ec78c99d5e791de770789df49.32:
	.ascii	"index"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.33,unique,74
anon.b508fe7ec78c99d5e791de770789df49.33:
	.ascii	"generation"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.35,unique,75
anon.b508fe7ec78c99d5e791de770789df49.35:
	.ascii	"StaleEntity"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.37,unique,76
anon.b508fe7ec78c99d5e791de770789df49.37:
	.ascii	"DuplicateComponent"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.38,unique,77
anon.b508fe7ec78c99d5e791de770789df49.38:
	.ascii	"MissingComponent"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.39,unique,78
anon.b508fe7ec78c99d5e791de770789df49.39:
	.ascii	"DuplicateQueryType"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.40,unique,79
anon.b508fe7ec78c99d5e791de770789df49.40:
	.ascii	"CapacityExceeded"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.41,unique,80
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.41:
	.quad	_ZN4core3ptr63drop_in_place$LT$alloc..vec..Vec$LT$benchmark..Position$GT$$GT$17h4e3cf871d0206ec9E
	.asciz	"\030\000\000\000\000\000\000\000\b\000\000\000\000\000\000"
	.quad	_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h1f2fa274c83a6852E

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.42,unique,81
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.42:
	.quad	_ZN4core3ptr63drop_in_place$LT$alloc..vec..Vec$LT$benchmark..Position$GT$$GT$17h4e3cf871d0206ec9E
	.asciz	"\030\000\000\000\000\000\000\000\b\000\000\000\000\000\000"
	.quad	_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h6367d78081015d06E

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.43,unique,82
anon.b508fe7ec78c99d5e791de770789df49.43:
	.ascii	"Niezgodny typ kolumny ECS"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.44,unique,83
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.44:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.4
	.asciz	"\n\000\000\000\000\000\000\000?\000\000\000*\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.45,unique,84
anon.b508fe7ec78c99d5e791de770789df49.45:
	.asciz	"src\\bin\\benchmark.rs"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.46,unique,85
anon.b508fe7ec78c99d5e791de770789df49.46:
	.ascii	"benchmark=position_velocity_integration\n"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.47,unique,86
anon.b508fe7ec78c99d5e791de770789df49.47:
	.ascii	"package_version=0.1.0\n"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.48,unique,87
anon.b508fe7ec78c99d5e791de770789df49.48:
	.ascii	"windows"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.49,unique,88
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.49:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.48
	.asciz	"\007\000\000\000\000\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.50,unique,89
anon.b508fe7ec78c99d5e791de770789df49.50:
	.ascii	"x86_64"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.51,unique,90
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.51:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.50
	.asciz	"\006\000\000\000\000\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.52,unique,91
anon.b508fe7ec78c99d5e791de770789df49.52:
	.asciz	"\003os=\300\006,arch=\300\016,logical_cpus=\300\001\n"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.53,unique,92
anon.b508fe7ec78c99d5e791de770789df49.53:
	.ascii	"release"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.54,unique,93
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.54:
	.asciz	"d\000\000\000\000\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.55,unique,94
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.55:
	.asciz	"\017\000\000\000\000\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.56,unique,95
	.p2align	2, 0x0
anon.b508fe7ec78c99d5e791de770789df49.56:
	.ascii	"\211\210\210<"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.57,unique,96
anon.b508fe7ec78c99d5e791de770789df49.57:
	.asciz	"\bprofile=\300\016,warmup_steps=\300\t,samples=\300\022,steps_per_sample=\300\004,dt=\300\001\n"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.58,unique,97
anon.b508fe7ec78c99d5e791de770789df49.58:
	.ascii	"allocation_and_checksum_excluded=true; execution=single_thread; order=alternating; numbers=wall_clock_nanoseconds\n"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.59,unique,98
anon.b508fe7ec78c99d5e791de770789df49.59:
	.ascii	"implementation,entities,sample,iterations,total_ns,ns_per_iteration,ns_per_entity,checksum\n"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.60,unique,99
anon.b508fe7ec78c99d5e791de770789df49.60:
	.ascii	"ecs_soa"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.61,unique,100
anon.b508fe7ec78c99d5e791de770789df49.61:
	.ascii	"vec_aos"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.62,unique,101
anon.b508fe7ec78c99d5e791de770789df49.62:
	.asciz	"-Niezgodne wyniki wariant\303\263w pomiarowych: ecs=\300\006, aos=\300"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.63,unique,102
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.63:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.45
	.asciz	"\024\000\000\000\000\000\000\000}\000\000\000\r\000\000"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.64,unique,103
anon.b508fe7ec78c99d5e791de770789df49.64:
	.asciz	"\300\001,\300\001,\300\001,\300\001,\300\001,\305 \000\000p\003\000\001,\305 \000\000p\006\000\001,\305 \000\000p\006\000\001\n"

	.section	.rdata,"dr",one_only,anon.b508fe7ec78c99d5e791de770789df49.65,unique,104
	.p2align	3, 0x0
anon.b508fe7ec78c99d5e791de770789df49.65:
	.quad	anon.b508fe7ec78c99d5e791de770789df49.45
	.asciz	"\024\000\000\000\000\000\000\000Y\000\000\000.\000\000"

	.section	.debug$S,"dr"
	.p2align	2, 0x0
	.long	4
	.long	241
	.long	.Ltmp83-.Ltmp82
.Ltmp82:
	.short	.Ltmp85-.Ltmp84
.Ltmp84:
	.short	4353
	.long	0
	.asciz	"C:\\Users\\piotr\\Downloads\\praca inzynierksa (1)\\praca inzynierksa\\praca inzynierska\\silnik\\target-asm\\release\\deps\\benchmark.benchmark.5aa4c9b99defd8e9-cgu.0.rcgu.o"
	.p2align	2, 0x0
.Ltmp85:
	.short	.Ltmp87-.Ltmp86
.Ltmp86:
	.short	4412
	.long	21
	.short	208
	.short	1
	.short	96
	.short	0
	.short	0
	.short	22012
	.short	0
	.short	0
	.short	0
	.asciz	"clang LLVM (rustc version 1.96.0 (ac68faa20 2026-05-25))"
	.p2align	2, 0x0
.Ltmp87:
.Ltmp83:
	.p2align	2, 0x0
	.cv_filechecksums
	.cv_stringtable
	.long	241
	.long	.Ltmp89-.Ltmp88
.Ltmp88:
	.short	.Ltmp91-.Ltmp90
.Ltmp90:
	.short	4428
	.long	4099
	.p2align	2, 0x0
.Ltmp91:
.Ltmp89:
	.p2align	2, 0x0
	.section	.debug$T,"dr"
	.p2align	2, 0x0
	.long	4
	.short	0x36
	.short	0x1605
	.long	0x0
	.asciz	"/rustc/ac68faa20c58cbccd01ee7208bf3b6e93a7d7f96"
	.short	0x6e
	.short	0x1605
	.long	0x0
	.asciz	"/rustc/ac68faa20c58cbccd01ee7208bf3b6e93a7d7f96/library\\alloc\\src\\lib.rs\\@\\alloc.c47466a5ce6d558a-cgu.0"
	.short	0xa
	.short	0x1605
	.long	0x0
	.byte	0
	.byte	243
	.byte	242
	.byte	241
	.short	0x1a
	.short	0x1603
	.short	0x5
	.long	0x1000
	.long	0x1002
	.long	0x1001
	.long	0x1002
	.long	0x1002
	.byte	242
	.byte	241
	.globl	_fltused

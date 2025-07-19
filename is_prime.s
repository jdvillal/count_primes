    .globl is_prime
    .text

# int is_prime(int n)
is_prime:
    pushq %rbp
    movq %rsp, %rbp
    movl %edi, -4(%rbp)        # Store input n in stack variable

    # if (n < 2) return 0;
    cmpl $2, -4(%rbp)
    jl .not_prime

    # i = 2
    movl $2, -8(%rbp)

.loop:
    movl -8(%rbp), %eax        # eax = i
    imull %eax, %eax           # eax = i * i
    cmpl -4(%rbp), %eax        # if (i * i > n) break;
    jg .is_prime

    movl -4(%rbp), %eax        # eax = n
    xorl %edx, %edx
    movl -8(%rbp), %ecx        # ecx = i
    idivl %ecx                 # eax = n / i, edx = n % i

    cmpl $0, %edx              # if (n % i == 0)
    je .not_prime

    addl $1, -8(%rbp)          # i++
    jmp .loop

.is_prime:
    movl $1, %eax              # return 1 (true)
    popq %rbp
    ret

.not_prime:
    movl $0, %eax              # return 0 (false)
    popq %rbp
    ret
    
.section .note.GNU-stack,"",@progbits

.section .text
.globl _start
_start:
movl $1, %eax
push $5
movl (%esp), %ebx
int $0x80

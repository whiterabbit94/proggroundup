# Program to illustrate how functions work.
# This program will compute the value of 2^3 & 5^2

.section .data

.section .text

.globl _start
_start:
pushl $3	# push second argument
pushl $2	# push first argument
call power
addl $8, %esp	# move the stack pointer back

pushl %eax	# save the first answer before calling the next function
pushl $2
pushl $5
call power
addl $8, %esp

popl %ebx	# The second answer is already in %eax. 
		# We saved it onto the stack, so now
		# we can just pop it out into %ebx

addl %eax, %ebx	# add them together, the result is in %ebx

movl $1, %eax	# Exit (%ebx is returned)
int $0x80


# PURPOSE: This function is used to compute
#	   the value of a number raised to a power.
# INPUT:   First argument - the base number
#	   Second argument - the power to raise
# OUTPUT: Will give the result as a return value
# NOTES: The power must be 1 or greater
# VARIABLES:
#	%ebx - holds the base
#	%ecx - holds the power
#	-4(%ebp) - holds the current result
#	%eax is used for temporary storage

.type power, @function
power:

pushl %ebp	# save old base pointer
movl %esp, %ebp # make stack pointer the base pointer
subl $4, %esp	# get room for our local storage

movl 8(%ebp), %ebx	#put first argument in %eax
movl 12(%ebp), %ecx	# put second argument in %ecx
movl %ebx, -4(%ebp)	#store current result














# Purpose: This program finds the maximum number of a set of data items.

# VARIABLES: The registers have th following uses:

# %edi - Holds the index of the data item being examined
# %ebx - Largest fata item found
# %eax - Current data item

# The following memory locations are used:

# data_items - contains the item data. A 0 is used to terminate the data


.section .data

data_items:
.long 3, 67, 34, 222, 45, 75, 54, 34, 44, 33, 22, 11, 66, 0

.section .text

.globl _start

_start:

mov $0, %edi	#move 0 into the index register
mov data_items(, %edi, 4), %eax	#load the first byte of data

mov %eax, %ebx	#since this is the first item, %eax is the biggest

start_loop:

cmpl $0, %eax	#check to see if we've hit the end
je loop_exit
incl %edi	#load next value
mov data_items(, %edi, 4), %eax
cmpl %ebx, %eax	#compare values
jle start_loop	#jump to loop begginig if the new one isn't bigger
mov %eax, %ebx	#move the value as the largest
jmp start_loop	#jump to loop beggining

loop_exit:

# %ebx is the status code for the exit system call and 
# it already has the maximum number

	mov $1, %eax	#1 is the exit() syscall
	int $0x80

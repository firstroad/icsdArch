.data
	iMsg0: .asciiz "Insert integer x: "
	iMsg1: .asciiz "Insert integer y: "
	oMsg0: .asciiz "Both numbers are 0!"
	oMsg1: .asciiz "Greatest Common Divisor is "

.text
main:

Start:
	la $a0, iMsg0
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0

	la $a0, iMsg1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0

	bgt $t0, $zero, second
	sub $t0, $zero, $t0
second:
	bgt $t1, $zero, continue
	sub $t1, $zero, $t0
continue:
	add $t2, $t0, $t1
	bgt $t2, $zero, GCD
	
	la $a0, oMsg0
	li $v0, 4
	syscall
	
	j Start
GCD:
	bgt $t1, $zero, GCD_kernel
GCD_kernel:
	div $t0, $t1
Enallages: 
	move $t0, $t1
	mfhi $t1
	bgt $t1, $zero, GCD_kernel
	
	la $a0, oMsg1
	li $v0, 4
	syscall

	move $a0, $t0
	li $v0, 1
	syscall

	li $a0, '\n'
	li $v0, 11
	syscall
	
	j Start

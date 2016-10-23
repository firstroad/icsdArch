.data
onoma: .asciiz "Hello World!"

.text
main:

la $a0, onoma 
li $v0, 4
syscall

li $v0, 10
syscall

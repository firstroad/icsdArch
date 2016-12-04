.data
  oMsg: .asciiz "How many Fibonacci numbers would you like to display? "
.text
main:
  li $v0, 4
  la $a0, oMsg
  syscall

  li $v0, 5
  syscall
  move $s0, $v0
  
  li $t2, 0
  li $t1, 1
  li $t0, 0
  ble $s0, $zero, exit

loop:
  li $v0, 1
  move $a0, $t2
  syscall
  
  li $v0, 11
  li $a0, ' '
  syscall
  
  move $t0, $t1
  move $t1, $t2
  
  add $t2, $t1, $t0
  
  addi $s0, $s0, -1
  bgt $s0, $zero, loop

exit:           
  li $v0, 10
  syscall

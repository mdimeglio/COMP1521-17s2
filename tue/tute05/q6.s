   .data

x: .space 8
y: .space 4
   
   .text
   
   .globl main
main:
   # allocate frame on stack for used registers and local variables
   sub   $sp, $sp, 4
   # save the $ra register to the stack
   sw    $ra, 0($sp)
   
   # read system call
   li   $v0, 5
   syscall
   sw   $v0, y

   # calculations
   lw   $t0, y
   addi $t0, $t0, 2000
   lw   $t1, y
   addi $t1, $t1, 3000
   mult $t0, $t1      # (Hi,Lo) = $t0 * $t1
   mfhi $t0
   sw   $t0, x        # top 32 bits of product
   mflo $t0
   sw   $t0, x+4      # bottom 32 bits of product

   # restore the $ra register from the stack
   lw    $ra, 0($sp)
   # deallocate main's function frame
   add   $sp, $sp, 4

   # main function end
   jr    $ra
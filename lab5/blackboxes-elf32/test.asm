
extern scanf
extern printf
extern exit
extern FUNC_NAME

global main


section .data
welc:   db "Test func for 2 numbers",10,0
str:    db "num1=%d",10,"num2=%d",10,"res=%d",10,0
fmt:    db "%d%d",0


section .bss
num1:   resb 4
num2:   resb 4


section .text
main:
    push welc
    call printf
    add esp,4

    push num2
    push num1
    push fmt
    call scanf
    add esp,12

    push DWORD [num2]
    push DWORD [num1]
    call FUNC_NAME
    add esp,8

    push eax
    push DWORD [num2]
    push DWORD [num1]
    push str
    call printf
    add esp,16

    push DWORD 0
    call exit



extern scanf
extern printf
extern exit

global main


section .data
welc:	db "Greater of 2 numbers",10,0
str:	db "num1=%d",10,"num2=%d",10,"greater=%d",10,0
fmt:	db "%d%d",0


section .bss
num1:	resb 4
num2:	resb 4


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

	mov eax,DWORD [num1]
	mov ebx,DWORD [num2]

	cmp eax,ebx
	jg bigger
	push ebx
	jmp less
bigger:
	push eax
less:
	push DWORD [num2]
	push DWORD [num1]
	push str
	call printf
	add esp,16

	push DWORD 0
	call exit


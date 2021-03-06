
extern scanf
extern printf
extern exit

global main


section .data
welc:	db "Factorial",10,0
str:	db "num=%d",10,"fact=%d",10,0
fmt:	db "%d",0


section .bss
num:	resb 4


section .text
main:
	push welc
	call printf
	add esp,4

	push num
	push fmt
	call scanf
	add esp,8

	mov ecx,DWORD [num]
	mov ebx,1
	mov eax,ebx

s_loop:
	mul ebx
	inc ebx
	cmp ebx,ecx
	jle s_loop
e_loop:

	push eax
	push DWORD [num]
	push str
	call printf
	add esp,12

	push DWORD 0
	call exit


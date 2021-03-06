
extern printf
extern exit

global main


section .data
hello:	db 'Hello World!',10,0
msg1:	db 'My name is Alexander',10,0
msg2:	db 'I am from KE-101',10,0


section .text
main:
	push hello
	call printf
	add esp,4

	push msg1
	call printf
	add esp,4

	push msg2
	call printf
	add esp,4

	push DWORD 0
	call exit



extern printf
extern exit
extern FUNC_NAME

global main


section .data
str:	db "Operation: ",0
op_add:	db "+",10,0
op_sub:	db "-",10,0
op_mul:	db "*",10,0
op_div:	db "/",10,0
op_mod:	db "%",10,0
op_and:	db "&",10,0
op_or:	db "|",10,0
op_xor:	db "^",10,0
num1:	equ 51
num2:	equ 13


section .text
main:
	push str
	call printf
	add esp,4

	push num2
	push num1
	call FUNC_NAME
	add esp,8

	mov ecx,eax
	mov ebx,num2

	mov eax,num1
	add eax,ebx
	cmp eax,ecx
	jne add_false
	push op_add
	jmp print_res
add_false:

	mov eax,num1
	sub eax,ebx
	cmp eax,ecx
	jne sub_false
	push op_sub
	jmp print_res
sub_false:

	mov eax,num1
	mul ebx
	cmp eax,ecx
	jne mul_false
	push op_mul
	jmp print_res
mul_false:

	mov eax,num1
	div ebx
	cmp eax,ecx
	jne div_false
	push op_div
	jmp print_res
div_false:

	mov eax,num1
	and eax,ebx
	cmp eax,ecx
	jne and_false
	push op_and
	jmp print_res
and_false:

	mov eax,num1
	or eax,ebx
	cmp eax,ecx
	jne or_false
	push op_or
	jmp print_res
or_false:

	mov eax,num1
	xor eax,ebx
	cmp eax,ecx
	jne xor_false
	push op_xor
	jmp print_res
xor_false:

	push op_mod
print_res:
	call printf
	add esp,4

	push DWORD 0
	call exit




global main


section .data
hello:  db  'Hello World!',10,0
lh:     equ $-hello

msg1:   db  'My name is Alexander',10,0
lmsg1:  equ $-msg1

msg2:   db  'I am from KE-101',10,0
lmsg2:  equ $-msg2


section .text
main:
    mov edx,lh
    mov ecx,hello
    mov ebx,1
    mov eax,4
    int 0x80

    mov edx,lmsg1
    mov ecx,msg1
    mov ebx,1
    mov eax,4
    int 0x80

    mov edx,lmsg2
    mov ecx,msg2
    mov ebx,1
    mov eax,4
    int 0x80

    mov ebx,0
    mov eax,1
    int 0x80


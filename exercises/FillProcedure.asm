.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

arr DWORD 10 DUP(?)
largePrime DWORD 49157
sumOfArr DWORD ?


.code
main proc

mov eax, 21
mov ecx, LENGTH arr
mov esi, OFFSET arr
call FillArr
call SumArr
mov sumOfArr, eax

 invoke ExitProcess,0
main endp

COMMENT ~
	procedure fills array with values from 0-255
	uses the register ecx, eax, and esi
~
FillArr PROC uses ecx eax esi

FillArrLoop:
	xor eax, largePrime
	ror largePrime, 1
	and eax, 000000FFh
	mov DWORD PTR [esi], eax
	add esi, 4
loop FillArrLoop

ret
FillArr endp




COMMENT ~
	procedure will sum the values in an array
	passed ESI, ECX, and returns to eax
~
SumArr PROC uses esi ecx
mov eax, 0

SumArrLoop:
	add eax, DWORD PTR [esi]
	add esi, 4
loop SumArrLoop

ret
SumArr endp

end main
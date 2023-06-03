.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, swExitCode: DWORD

.data
	A DWORD 0
	B DWORD 1
	C1 DWORD 2  ; C is a reserved word
	D DWORD 3
	E DWORD 4
	F DWORD 5
	G DWORD 6
	H DWORD 7
	I DWORD 8
	J DWORD 9
	K DWORD 10
	L DWORD 11
	M DWORD 12
	N DWORD 13
	O DWORD 14
	P DWORD 15

.code
main proc
	mov eax, 0 ; initialize eax to 0

	;adds E(4) * D(3)
	add eax, E
	add eax, E
	add eax, E

	mov ebx, eax ; ebx=12

	;adds EBX(12) * F(5)
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx

	mov ebx, eax ; ebx=60

	;adds EBX(60) * G(6)
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx

	mov ebx, eax ; ebx=360

	;adds EBX(360) * H(7)
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx

	mov ebx, eax ; ebx=2520

	;adds EBX(2520) * I(8)
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx

	mov ebx, eax ; ebx=20,160
	
	;adds EBX(20160) * J(9)
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx

	mov ebx, eax ; ebx=181,440
	
	;adds EBX(181440) * K(10)
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx

	mov ebx, eax ; ebx=1,814,400

	;adds EBX(1814400) * l(11)
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx
	add eax, ebx

	;start of the addition segments
	add eax, B
	add eax, C1
	add eax, M
	add eax, N
	add eax, O
	add eax, P

	mov A, eax ;gets the final value of A

	INVOKE ExitProcess, 0
main ENDP
END main
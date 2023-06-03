.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, swExitCode: DWORD

.data
	;define variables in data segment
	aVar DWORD 0
	bVar DWORD 5
	cVar DWORD 10
	dVar DWORD 4
	eVar DWORD 6
	fVar DWORD 7
	gVar DWORD 8
	hVar DWORD 2
	iVar DWORD 3
	jVar DWORD 12


.code
main PROC
	; write assembly code here
	mov eax, 0	; set eax to 0

	;adds B + C
	add eax, bVar	
	add eax, cVar

	;adds D(4) * B(5)
	add eax, bVar
	add eax, bVar
	add eax, bVar
	add eax, bVar

	;adds B(5) * E(6)
	add eax, eVar
	add eax, eVar
	add eax, eVar
	add eax, eVar
	add eax, eVar

	;adds E(6) * F(7)
	add eax, fVar
	add eax, fVar
	add eax, fVar
	add eax, fVar
	add eax, fVar
	add eax, fVar

	;adds F(7) * G(8)
	add eax, gVar
	add eax, gVar
	add eax, gVar
	add eax, gVar
	add eax, gVar
	add eax, gVar
	add eax, gVar

	;adds D(4) * D(4)
	add eax, dVar
	add eax, dVar
	add eax, dVar
	add eax, dVar
	
	;adds B(5) * B(5)
	add eax, bVar
	add eax, bVar
	add eax, bVar
	add eax, bVar
	add eax, bVar

	;adds H(2) * I(3)
	add eax, iVar
	add eax, iVar

	;adds I(3) * D(4)
	add eax, dVar
	add eax, dVar
	add eax, dVar

	;adds H(2) + J(12)
	add eax, jVar
	add eax, hVar

	;adds eax to aVar
	add aVar, eax

	INVOKE ExitProcess, 0
main ENDP
END main
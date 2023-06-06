.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

COMMENT ~
	program performs bitwise division and multiplication on numbers
	uses the SAR, SHL, SHR, and SAL instructions
~

.data
uTestVal BYTE 02h
sTestVal SBYTE 080h

.code
main proc
	
	mov eax, 0					;sets eax to 0
	mov ax, 0FAFAh				;moves the hex value 0xFAFAh into AX register
	ror ax, 4					;rotates right by four causing the hex values to switch
	rol ax, 8					;rotates left by 8 causing no change at all

	mov eax, 0					;sets eax to 0

	sar sTestVal, 1				;divides 'sTestVal' by 2
	shl uTestVal, 4				;multiplies 'uTestVal' by 16/2^4

	mov uTestVal, 02h
	movsx eax, uTestVal
	shl eax, 2
	shl uTestVal, 5
	add uTestVal, al			;'uTestVal' should equal 2 * 36 = 72

	

 invoke ExitProcess,0
main endp

end main
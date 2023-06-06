.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	;SAMPLE RUN #5
	var1 BYTE '0'
	var2 BYTE '0'
	var3 BYTE '0'
	var4 BYTE '0'
	
.code
main proc
	;-----------------------------------------------------------------
	;#1 - phase 1 shift the value of the variables in the .data segment
	;-----------------------------------------------------------------

	mov ah, var4	;#2 - stores var4 in the second lowest bit of the eax register


	;#3 - change var4 to var3
	mov al, var3
	mov var4, al

	;#4 - change var3 to var2
	mov al, var2
	mov var3, al

	;#5- change var2 to var1
	mov al, var1
	mov var2, al

	;#6 - change var1 to var4
	mov var1, ah

	;-----------------------------------------------------------------
	;#7 - phase 2 loads the value of the variables in the eax register
	;-----------------------------------------------------------------

	mov eax, 0	;#8 - sets eax register to 0

	;#9
	;using arithmetic shift algorithm to shift the value 00004400 to 44000000
	;done using the equation (base)^x * x in this case (2)^4 * 00004441
	mov ah, var1
	mov al, var2

	add eax, eax
	add eax, eax
	add eax, eax
	add eax, eax
	add eax, eax
	add eax, eax
	add eax, eax
	add eax, eax
	add eax, eax
	add eax, eax
	add eax, eax
	add eax, eax
	add eax, eax
	add eax, eax
	add eax, eax
	add eax, eax

	add ah, var3	;#10 - moves value of var3 (42) to eax (44410000) -> 44414200

	add al, var4	;#11- moves value of var4 (43) to eax (44414200) -> 44414243

	;--------------------------------------------
	;#12 - phase 3 twos complement or something
	;-----------------------------------------------
	
	mov ebx, 0	;#13 - sets the value of the eax register to 0

	;#14
	;I'm using the value of -1 to set the registers to their highest possible values because they
	;have an interesting behavior where they wrap around

	;#15 - find the twos complement of var1 (BC)
	mov bh, -1 
	sub bh, var1
	add bh, 1
	;#16 - find the twos complement of var2 (BF)
	mov bl, -1
	sub bl, var2
	add bl, 1

	;#17
	;shifts the value of the complements by 4 to the right
	;uses the same algorithm (base)^x * x in this case (2)^4 * 0000BCBF
	add ebx, ebx
	add ebx, ebx
	add ebx, ebx
	add ebx, ebx
	add ebx, ebx
	add ebx, ebx
	add ebx, ebx
	add ebx, ebx
	add ebx, ebx
	add ebx, ebx
	add ebx, ebx
	add ebx, ebx
	add ebx, ebx
	add ebx, ebx
	add ebx, ebx
	add ebx, ebx

	;#18 - adds the complement to the second lowest byte in ebx
	mov bh, -1
	sub bh, var3
	add bh, 1
	;#19 - adds the complement to the lowest byte in ebx
	mov bl, -1
	sub bl, var4
	add bl, 1


	
	invoke ExitProcess,0
main ENDP
end main
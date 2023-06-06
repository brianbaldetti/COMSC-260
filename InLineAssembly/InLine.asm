; LongestIncreasingSequence      (Longest.asm)
; Assembly language subroutine that receives two input parameters: the offset 
; of an array and the array's size. It must return a count of the longest 
; strictly increasing sequence of integer values. 

.586
.model flat,C

MAX_INT = 2147483647

COMMENT ~
; #5 here is my assembly function prototype that I will be using notice that the arr
;    parameter is passed by reference so I am actually using a pointer to reference it
~
LongestIncreasingSequence PROTO,
	arrPtr:PTR DWORD, lengthArr:DWORD

.code
COMMENT ~
; #6 here is my main function body that I use to find the longest sequence of numbers
;    the funciton uses the register ESI, EDZ ECX, EBX, EAX and well as the variables
;    arrPtr and lengthArr, however notice that EAX is not resored b/c it must be returned
;    to the orginal program that it is being called in
~


LongestIncreasingSequence PROC uses esi edx ecx ebx,
arrPtr:PTR DWORD, lengthArr:DWORD

	
	mov esi, arrPtr			; #7 below I set up my variables and initialize them to starting values of one

	mov ecx, lengthArr
	dec ecx					; #8 initializing ecx and decrementing it b/c we will be comparing to the adjacent element to the right 


	mov edx, 0
	mov eax, 0
	mov ebx, 0

	
	LoopCmp:				; #9 main loop of the program that is responsible for most of the comparision
		mov ebx, [esi]

		cmp [esi + 4], ebx
		jg Larger
		jmp Smaller
		
		COMMENT ~
		; #10 code here increments the current sequence counter and compares it to the longest sequence
		;     if it is greater than the longest sequence is updated to the current sequence length
		~
		Larger:
		inc edx
		cmp eax, edx
		jg EndLoopCmp
		mov eax, edx
		jmp EndLoopCmp

		
		Smaller:			 ; #11 if the element to the right isn't then the sequence is reset to 0
		mov edx, 0

		
		EndLoopCmp:			; #12 increments ESI by the byte length of DWORD
		add esi, 4

	loop LoopCmp

	COMMENT ~
	; #13 eax is incremented before as long as it is changed this is because without this code
	;     the first element in the sequnce is not actually counted in the sequence
	~
	cmp eax, 0
	je EndProc
	inc eax

	EndProc:
	ret
LongestIncreasingSequence ENDP
END


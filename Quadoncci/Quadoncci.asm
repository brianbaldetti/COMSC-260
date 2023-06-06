.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

;----------------------------------
;SAMPLE RUN 5

NUM = 15	;number of elements to be stored in the quadArray

.data
quadArray DWORD NUM DUP(0)	;DWORD array that holds the values for the 'quadoncci' sequence
;----------------------------------

.code
main proc
	
mov esi, OFFSET quadArray	;initialize esi
mov ecx, NUM	;	#1 size of the array is moved into EXC register

;	#2	exc is incremented as it will be ran as a post test loop this will cause
;an overflow error and set ecx to 0 in some case however it doesn't matter bc
;the pretest loop will set it back to the same value
inc ecx			

;	#3	the reason that it is ran as a post test loop is because if the value of num is zero
;then it wont run correctly
jmp L1			

COMMENT # 4
	at first I tried to only have one loop that is evaluated but after a lot
	of trial and error I settled on simply using 4 base cases that will run
	before a main loop that will fill in the rest of the number in the loop
	#

;-------------------
;	#5 loop moves value 1 into the first element of 'quadArray'
L0:
	mov DWORD PTR [esi], 1
	add esi, 4
	jmp L4
;	#6 loop that is ran in all cases
L1:
	loop L0
	jmp ENDLOOPS

;----------------
;	#7 loop moves value 1 into second element of 'quadArray'
L3:
	mov DWORD PTR [esi], 1
	add esi, 4
	jmp L6
L4:
	loop L3
	jmp ENDLOOPS

;-----------------------------------
;	#8 loop moves value 1 into third element of 'quadArray'
L5:
	mov DWORD PTR [esi], 1
	add esi, 4
	jmp L8
L6:
	loop L5
	jmp ENDLOOPS

;-----------------
;	#9 loop moves value 1 into fourth element of 'quadArray'
L7:
	mov DWORD PTR [esi], 1
	add esi, 4
	jmp L10
L8:
	loop L7
	jmp ENDLOOPS

;--------------------
;	#10 this is the non-base case loop that will run if the value specified in NUM
;is greater than 4, and it runs as a pretest loopuntil ECX is 0
L9:
	mov ebx, DWORD PTR [esi - 16]
	add ebx, DWORD PTR [esi - 12]
	add ebx, DWORD PTR [esi - 8]
	add ebx, DWORD PTR [esi - 4]

	mov DWORD PTR [esi], ebx
	add esi, 4
L10:
	loop L9
;---------------------------

;	#11 this code label is jumped to if any of the base cases arent true and simply
;acts as a pointer to the end of the program once it is called
ENDLOOPS:

	invoke	ExitProcess,0
main endp
end main
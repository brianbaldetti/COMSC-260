.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
		
;-----------------------------------------------------------
;SAMPLE RUN #5

ROWS = 7					 ; this can be changed to any value between 2 - 16
COLS = 2*ROWS-1				 ; holds the number of cols that will be used
MID_COL = COLS/2			 ; holds the middle col
FILL = (32 - COLS)			 ; holds the # of colms after the filled cols 

.data
V BYTE 32*ROWS dup (1)		 ; the memory allocated for the V pattern

;-----------------------------------------------------------

.code
; #1 this is the main procedure that will be used for this program
; as you can see it uses the registers ECX, ESI, EAX, EBX
; this program has 4 loops that it uses 
draw_v_pattern PROC USES ecx esi eax ebx
	dec ecx				; #2 we decrement ecx because the main loop will not affect the final row
	mov eax, 0			; #3 we use eax as the row counter for this program

	; #4 main outer loops that will be used to make the shape for all the rows EXCEPT the last one
	L0:
		push ecx		; #5 ecx is stored on the stack as L1 is a nested look
		mov ebx, 0		; #6 ebx is a col counter
		mov ecx, COLS	; #7 L1 will shift through all the cols of the shape

		L1:
			cmp ebx, eax				; #8 if the rows and cols are equal to one another then add and asterisks
			je ASTRICK
			mov BYTE PTR [esi], ' '
			jmp SKIP

			; #9 here the astrerisks is stored in th earray but ebx is also changes to twice the value of the rows
			; this is because the cols are twice that of the rows as well
			; in addition ebx is added to by the value of one and then subtracted by the value of ebx
			; this means that when EBX is again equal to the row number then this code will be ran
			ASTRICK:
				mov BYTE PTR [esi], '*'
				mov ebx, eax
				add ebx, eax
				add ebx, 1
				sub ebx, ecx

			; #10 increment the ESI pointer and the EBX counter
			SKIP:
				inc esi
				inc ebx
		loop L1

		; #11 this code right here will be used to fill up the remaining space of the array after every iteration of L0
		mov ecx, FILL
		L2:
			mov BYTE PTR [esi], ' '
			inc esi
		loop L2

		pop ecx
		inc eax
	loop L0

	; #12 code to fill final row
	mov ecx, 32
	mov eax, 0
	L3:
		cmp eax, MID_COL
		je FINAL_ASTRICK
		mov BYTE PTR [esi], ' '
		jmp FINAL_SKIP

		FINAL_ASTRICK:
			mov BYTE PTR [esi], '*'

		FINAL_SKIP:
			inc esi
			inc eax
	loop L3



ret
draw_v_pattern ENDP

main proc

; #13 code here will be used to set up the draw_v_pattern function to be called
mov ecx, ROWS 
mov esi, OFFSET V
call draw_v_pattern

invoke ExitProcess,0
main endp
end main
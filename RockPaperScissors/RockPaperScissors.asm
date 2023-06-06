.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

; __________________________________________________________________
; SAMPLE RUN #5

player1 BYTE 'S'  ; this can be 'r', 'p', 's', 'R', 'P', or 'S'
player2 BYTE 'S'  ; this can be 'r', 'p', 's', 'R', 'P', or 'S'
outcome BYTE ?    ; this will be 1, 2, or 3 at the end
; __________________________________________________________________


.code
main proc

; #1 initializing ebx and edx registers that are passed to 'RPS' procedure
mov bl, player1
mov dl, player2
call RPS

 invoke ExitProcess,0
main endp

; #2 procedure is responsible for converting lowercase letters to uppercase letters this can
; easily be done by subtracting 32 from the value to find the uppercase complementary letter
to_upper PROC
	sub al, 32

	EndToUpper:
	ret
to_upper ENDP

RPS PROC uses eax edx ebx

	; #3 this part makes sure that the first letter is not lowercase
	; in addition if it is it changes the value of the register and the data variable
	mov al, bl
	cmp al, 90
	jl CheckCaseTwo
	call to_upper
	mov bl, al
	mov player1, bl		; changes the value of the 'player1' variable to uppercase version

	; #4 this part checks that the second letter is not lowercase
	; in addtion if it is it changes the valeu of the register and the data variable
	CheckCaseTwo:
	mov al, dl
	cmp al, 90
	jl NextPart
	call to_upper
	mov dl, al
	mov player2, dl		; changes the value of the 'player2' variable to uppercase version 
	
	; #5 checks if tie has occured and if it does then it jumps to the 'Tie:' code label
	NextPart:
	cmp bl, dl
	je Tie

	; #6 this code checks the input of 'player1' until it finds the correct input from here it will then
	; evaluate the results of the program based on the input of 'player1'
	cmp bl, 'R'
	je ROCK
	cmp bl, 'P'
	je PAPER
	cmp bl, 'S'
	je SCISSORS

	; #7 this is the base case procedure that will run if nothing else is true and it will set the 
	; outcome variable to 3, also this will run if the input is not the correct value as we can't
	; score a game where either player doesn't use rock, paper, or scissors
	Tie:
		mov outcome, 3
		jmp EndProc

	; #8 this code checks the results if 'player1' inputs "R"
	ROCK:
		cmp dl, 'S'
		je PlayerOneWins
		jmp PlayerTwoWins

	; #9 this code checks the results if 'player1' inputs "P"
	PAPER:
		cmp dl, 'R'
		je PlayerOneWins
		jmp PlayerTwoWins

	; #10 this code checks the results if 'player1' inputs "S"
	SCISSORS:
		cmp dl, 'P'
		je PlayerOneWins
		jmp PlayerTwoWins

	; #11 here the code will set the value of 'outcome' to 1 indicating that 'player1' has won
	; in addtion it will then jump to the end of the procedure
	PlayerOneWins:
		mov outcome, 1
		jmp EndProc

	; #12 here the code will set the value of 'outcome' to 2 indicating that 'player1' has won
	; in addition just like the previous code label it will jump to the end of the procedure
	PlayerTwoWins:
		mov outcome, 2
		jmp EndProc


	EndProc:
	ret
RPS ENDP


end main
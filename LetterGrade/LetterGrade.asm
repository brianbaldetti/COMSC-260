.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword


A_grade = 90 ;the minimum score to get an A (can be changed according to the grading scale used)
B_grade = 80 ;the minimum score to get a B (can be changed according to the grading scale used)
C_grade = 70 ;the minimum score to get a C (can be changed according to the grading scale used)
D_grade = 60 ;the minimum score to get a D (can be changed according to the grading scale used)

.data
letter_grade BYTE ? ; stores the letter grade ('A', 'B', 'C', 'D', or 'F')

.code
main proc

	; _________________________________________
	; SAMPLE RUN #5

	; #1 EAX is initialized with a value btwn 0-100 to be tested for then calculate_grade is called
	mov eax, 69
	; #2 the call instruction is passed calculate_grade as an operand
	call calculate_grade
	; _________________________________________


  
  invoke ExitProcess, 0
main endp

; #3 calculate_grade is responsible for evaluating the value in EAX and then it will
; assign a value to 'letter_grade' based on the value in EAX
calculate_grade PROC

	; #4 at first i made this program using a different scructure however I realized I could write it this way instead
	; though I have preserved the orginal code below in a multi-lined comment

	; #5 this code uses less instructions and is less CPU intensive I think yet it requires more memory usage
	; so really it is a trade-off btwn CPU resources and memory resources also this uses 13 compared to 21 lines of code

	; #6 instructions check if grade is an "A"
	mov letter_grade, 'A'
	cmp eax, A_grade
	jae endProc

	; #7 instruction check if grade is an "B"
	mov letter_grade, 'B'
	cmp eax, B_grade
	jae endProc

	; #8 instruction check if grade is a "C"
	mov letter_grade, 'C'
	cmp eax, C_grade
	jae endProc

	; #9 instruction check if grade is a "D"
	mov letter_grade, 'D'
	cmp eax, D_grade
	jae endProc

	; #10 base case that runs if nothing else is evaluated as true
	mov letter_grade, 'F'


	; #11 this is my orginal implementation that I decided to change
	; i left all the comments in it still though for readability and interpretation
	COMMENT ~
	; this will be the first test to see if the value is an A
	cmp eax, A_grade
	jb BGrade
	mov letter_grade, 'A'
	jmp endProc

	; this will be the second test to see if the value is a B
	BGrade:
	cmp eax, B_grade
	jb CGrade
	mov letter_grade, 'B'
	jmp endProc

	; this will be the third test to see if the value is a C
	CGrade:
	cmp eax, C_grade
	jb DGrade
	mov letter_grade, 'C'
	jmp endProc

	; this will be the fourth test to see if the value is a D
	DGrade:
	cmp eax, D_grade
	jb FGrade
	mov letter_grade, 'D'
	jmp endProc
	
	; this will be the final code label that simply move the ltr "F" into 'letter_grade' variable
	FGrade:
	mov letter_grade, 'F'
	~


	; #8 code label will be used to skip to the end of a program if a proper letter grade is found


	endProc:
	ret
calculate_grade ENDP

end main

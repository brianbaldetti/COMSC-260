.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
   ;SAMPLE RUN #4

   ;0 programmer defined data types
   array1 DWORD 0, 0, 0, 0, 0
   array2 DWORD 0, 0, 0, 0, 0
   array3 DWORD LENGTHOF array1 dup(?)	;declares array3 as uninitialized with the same # of elements as array1

.code
main proc
	;#1 making sure that the eax register doesn't hold any values
	;	this isn't necessary but it helps me remember tha eax should not hold anything
	;	at the start of the program
	mov eax, 0

	;#2 basically im using array3 as a tmp array to store the value of array1 before I change it
	mov eax, array1[0]
	mov array3[0], eax
	mov eax, array1[4]
	mov array3[4], eax
	mov eax, array1[8]
	mov array3[8], eax
	mov eax, array1[12]
	mov array3[12], eax
	mov eax, array1[16]
	mov array3[16], eax

	;#3 here im changing the value of array1 to the reverse order of array2
	mov eax, array2[16]
	mov array1[0], eax

	mov eax, array2[12]
	mov array1[4], eax

	mov eax, array2[8]
	mov array1[8], eax
	
	mov eax, array2[4]
	mov array1[12], eax

	mov eax, array2[0]
	mov array1[16], eax

	;#4	now im chaning the value of 'array2' to the reverse order of 'array3'
	mov eax, array3[16]
	mov array2[0], eax

	mov eax, array3[12]
	mov array2[4], eax

	mov eax, array3[8]
	mov array2[8], eax

	mov eax, array3[4]
	mov array2[12], eax

	mov eax, array3[0]
	mov array2[16], eax
	;_____________________
	;PART 2
	;_____________________

	;#5 here im chaning the value of 'array3' to make sure that it holds the difference of the
	;	new 'array1' and the new 'array2'

	mov eax, array1[0]		;#6	register eax is being used to store the value of 'array1' at an index before it is subtracted
	sub eax, array2[0]
	mov array3[0], eax

	
	mov eax, array1[4]
	sub eax, array2[4]		;#7 after register eax holds the value of 'array1' it is subtracted by 'array2'
	mov array3[4], eax

	mov eax, array1[8]
	sub eax, array2[8]
	mov array3[8], eax		;#8 finally after the value is subtracted it is moved to the 'correct' spot on 'array3'

	mov eax, array1[12]
	sub eax, array2[12]
	mov array3[12], eax

	mov eax, array1[16]
	sub eax, array2[16]
	mov array3[16], eax		;#9 in the example case it doesn't really matter what spot of move the value to however it will
							;	matter a lot more when I use other values

	
	mov eax, 0				;#10 here im just setting eax to 0, again this isn't really necessary but it
							;	 helps me remember that the program is now finished running and all variables
							;    can be reset to a base value



	invoke ExitProcess,0
main endp
end main
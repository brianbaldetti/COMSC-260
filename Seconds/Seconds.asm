.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

;constant values
SECONDS = 60
MINUTES = 60
HOURS = 24
DAYS = 7

.data
dateTime DWORD ?					;stores complete date and time configuration; day:hour:min:sec
numSecond DWORD 0					;stores the num of seconds in a week; same as num of iterations
day BYTE DAYS						;outermost loop counter 
hour BYTE HOURS						;middle loop counter
minute BYTE MINUTES					;inner loop counter

.code
main proc

;#1
;testing code to make sure program works
;mov eax, 0


mov ecx, DAYS						;#1 first ecx will store the num of days in a week as this is the value of the outermost loop
mov BYTE PTR [dateTime], 0ffh		;#2 offset added 'dateTime' memory operand as an offset for days

;#3 outmost loop that has 7 iterations as that is the num of days in a week
L0:
	mov day, cl								;#4 day stores the num of iterations of L0, scheme repeated in every loop
	mov ecx, HOURS							;5 ecx is set to 24 every iterations and not to 'hours' as that memory is not constant, scheme repeated in every loop
	mov BYTE PTR [dateTime +1], 0ffh		;#6 offset added to the 'dateTime' for hours

;#7 upper middle loop that has 24 iterations as that is the num of hours in a day
L1:
	mov hour, cl							
	mov ecx, MINUTES
	mov BYTE PTR [dateTime+2], 0ffh			;#8 offset added to 'dateTim'e for minutes

;#9 lower middle loop that has 60 iterations as that is the num of minutes in an hour
L2:
	mov minute, cl
	mov ecx, SECONDS
	mov BYTE PTR [dateTime+3], 0ffh			;#10 offset added to 'dateTime' for seconds
	
;#11 lowest loop that has 60 iterations as that is the num of seconds in a minute
L3:
	;tester code to make sure program works
	;inc eax

	inc numSecond							;#12 'numSecond' is incremented every time L3 runs by the value of 1
	inc BYTE PTR [dateTime+3]				;#13 the num of seconds of the CURRENT iteration of L3 held here

	loop L3

	movzx ecx, minute						;#14 ecx is restored to the to the value of the 'minute'  
	inc BYTE PTR [dateTime+2]				;#15 the num of minutes in the CURRENT iteration of L2

	loop L2

	movzx ecx, hour							;#16 ecx is restored to the value of the 'hour' variable
	inc BYTE PTR [dateTime+1]				;#17 the num of hours in the CURRENT iteration of L1

	loop L1

	movzx ecx, day							;#18 exc is restored the the current value of 'day'
	inc BYTE PTR [dateTime]					;#19 the num of days in the CURRENT iteration of L0

	loop L0


	invoke ExitProcess,0
main endp
end main
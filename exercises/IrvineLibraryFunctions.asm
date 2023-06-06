
; Author:
; Program Name:
; Program Description:
; Date

INCLUDE Irvine32.inc

.data
strig BYTE "HELLO!   ", 0
strig2 BYTE "U SAID:    ", 0
stringR BYTE 100 DUP(?)


.code
main PROC

mov edx, OFFSET strig
call writestring

call Crlf
call crlf

call readChar

mov edx, OFFSET strig2
call writeString
call writeChar
call crlf

mov edx, OFFSET strig
call WRITESTRING
call readDec
call crlf
mov edx, OFFSET strig2
call writeString
call writeDec
call crlf

call crlf
mov edx, OFFSET strig
call writestring
call readint
call crlf
mov edx, OFFSET strig2
call writestring
call writeint
call crlf

call crlf
mov edx, OFFSET strig
call writestring
call readHEx
call crlf
mov edx, OFFSET strig2
call writestring
call writehex
call crlf

call crlf
mov edx, OFFSET strig
call WRITESTRING
mov ecx, LENGTH stringR
mov edx, OFFSET stringR
call readstring
call crlf
mov edx, OFFSET strig2
call writestring
mov edx, OFFSET stringR
call writestring
call crlf


 exit
main ENDP
END main

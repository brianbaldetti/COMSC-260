.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
   msgforward WORD 6 DUP(?)
   msgbackward WORD 6 DUP(?)
   restore_esp DWORD ?

.code
main proc
  mov restore_esp, esp ; save the contents of register ESP so it can be restored before the program finishes
                       ; DO NOT REMOVE THIS

  ; clear the registers
  mov eax, 0
  mov ebx, 0
  mov ecx, 0
  mov edx, 0
  mov esi, 0
  mov edi, 0
  mov esp, 0
  mov ebp , 0

  ; store the message "Welcome Home" in reverse order across the six 16-bit registers
   mov ax, "EM"
   mov bx, "OH"
   mov si, " E"
   mov di, "MO"
   mov sp, "CL"
   mov bp, "EW"


 ; PUT YOUR INSTRUCTIONS FOR PHASES 1
 ;#1 - stores the msg 'WELCOME HOME' in the 'msgforward' array

 ;#2 - ecx is used to iterate throughout the array
 mov [msgforward + ecx], bp
 add ecx, 2
 mov [msgforward + ecx], sp
 add ecx, 2
 mov [msgforward + ecx], di
 add ecx, 2
 mov [msgforward + ecx], si
 add ecx, 2
 mov [msgforward + ecx], bx
 add ecx, 2
 mov [msgforward + ecx], ax

 ; PUT YOUR INSTRUCTIONS FOR PHASES 2

 COMMENT |
    #3
    at the start of every instruction ecx and edx are set to 0
    this is only necessary for the first instuction really but i just wanted to avoid
    any errors
 |

 ;#4 - switches value of ax register
 mov ecx, 0
 mov edx, 0
 mov cx, ax
 mov ah, cl
 mov al, ch

 ;#5 - switches value of bx register
 mov ecx, 0
 mov edx, 0
 mov cx, bx
 mov bh, cl
 mov bl, ch

 ;#6 - switches value of esi register
 mov ecx, 0
 mov edx, 0
 mov cx, si
 mov dh, cl
 mov dl, ch
 mov si, dx
 
 ;#7 - switches value of edi register
 mov ecx, 0
 mov edx, 0
 mov cx, di
 mov dh, cl
 mov dl, ch
 mov di, dx

 ;#8 - switches value of esp register
 mov ecx, 0
 mov edx, 0
 mov cx, sp
 mov dh, cl
 mov dl, ch
 mov sp, dx

 ;#9 - switches value of ebp register
 mov ecx, 0
 mov edx, 0
 mov cx, bp
 mov dh, cl
 mov dl, ch
 mov bp, dx

 ; PUT YOUR INSTRUCTIONS FOR PHASES 3

 mov ecx, 0     ;#10 - sets ecx to 0 to be used as a counter

;#11 - this time value are used in the opposite order to ensure that the value are set in reverse order
;this is because the value in the registers are swaped though they still need to be added in the reverse order
 mov [msgbackward + ecx], ax
 add ecx, 2
 mov [msgbackward + ecx], bx
 add ecx, 2
 mov [msgbackward + ecx], si
 add ecx, 2
 mov [msgbackward + ecx], di
 add ecx, 2
 mov [msgbackward + ecx], sp
 add ecx, 2
 mov [msgbackward + ecx], bp


mov esp, restore_esp ; restore register ESP to it's original value so the program can end correctly
                     ; DO NOT REMOVE THIS

	invoke ExitProcess,0
main endp
end main
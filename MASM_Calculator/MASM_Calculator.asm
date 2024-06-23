; BASIC ASSEMBLY CALCULATOR
; JARED WIGHTMAN

; PROJECT INITIALIZATION, INCLUDES IRVINE32 LIBRARY FOR SIMPLE CONSOLE I/O
.386
.model flat, stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

include irvine32.inc

; SECTION FOR DATA AND VARIABLE INITIALIZATION
.data

basicInfo DB "CALCULATOR", 0
outputOperator DB "Enter an operator (+, -, *, /, 'E' to exit):", 0 ; ADD FACTORIAL???
outputOne DB "Enter the first number:", 0
outputTwo DB "Enter the second number:", 0

exitMsg DB "Program exited.", 0
outputResult DB "= ", 0
outputError DB "An error occurred.", 0

inputOperator DWORD ?
inputOne DWORD ?
inputTwo DWORD ?
result DWORD ?

; SECTION FOR LOGIC AND CODE
.code

; PROCESS FOR CHECKING AND EXITING PROGRAM
exitCheck proc uses eax

	cmp al, "E"
	jne break
	mov edx, offset exitMsg
	call writestring
	call Crlf
	invoke ExitProcess, 0
	break:
		ret

exitCheck endp

; MAIN PROCESS BEING RUN
main proc
	
	; OUTPUT "CALCULATOR"
	mov edx, offset basicInfo
	call writestring
	call Crlf

	; "WHILE" LOOP THAT RUNS UNTIL EXIT FUNCTION IS CALLED
	top:
	
		; GET OPERATOR
		mov edx, offset outputOperator
		call writestring
		call Crlf
		mov edx, offset inputOperator
		mov ecx, sizeof inputOperator
		call readstring
		call Crlf
		mov eax, inputOperator
		call exitCheck

		; GET FIRST OPERAND
		mov edx, offset outputOne
		call writestring
		call Crlf
		call readint
		mov inputOne, eax
		call Crlf

		; GET SECOND OPERAND
		mov edx, offset outputTwo
		call writestring
		call Crlf
		call readint
		mov inputTwo, eax
		call Crlf

		; CHECK OPERATOR AND GO TO APPROPRIATE LOGIC
		mov eax, inputOperator
		cmp al, "+"
		je addup
		mov eax, inputOperator
		cmp al, "-"
		je subup
		mov eax, inputOperator
		cmp al, "*"
		je mulup
		mov eax, inputOperator
		cmp al, "/"
		je divup

		; LOGIC FOR FOUR OPERATORS, JUMP TO OUTPUT SECTION
		addup:
			mov eax, inputOne
			add eax, inputTwo
			mov result, eax
			jmp output
		subup:
			mov eax, inputOne
			sub eax, inputTwo
			mov result, eax
			jmp output
		mulup:
			mov eax, inputOne
			mov ebx, inputTwo
			imul ebx
			mov result, eax
			jmp output
		divup:
			mov eax, inputOne
			cdq
			mov ebx, inputTwo
			idiv ebx
			mov result, eax
			jmp output

		; GIVE AN ERROR IF OUTPUT ISN'T REACHED
		mov edx, offset outputError
		call writestring

		; OUTPUT
		output:
			mov edx, offset outputResult
			call writestring
			mov eax, result
			call writeint
			call Crlf

	; JUMP TO TOP OF LOOP FOR REPEAT
	jmp top

; CLOSING MAIN FUNCTION
main endp
end main
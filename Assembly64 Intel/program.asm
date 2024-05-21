section .data
	rangeText: db 'range: '
	rangeLen equ $-rangeText

	markText: db 'mark every: '
	markLen equ $-markText

	marker: db ' <--'
	markerLen equ $-marker

	newline: db 10

section .bss
	range resb 512
	mark resb 512

	digitSpace resb 100
	digitSpacePos resb 8

section .text
	global _start

_start:
	mov rbx, rangeText
	mov rcx, rangeLen
	call _output

	mov rbx, range
	mov rcx, 512
	call _input

	mov rbx, markText
	mov rcx, markLen
	call _output

	mov rbx, mark
	mov rcx, 512
	call _input

	mov rdi, mark
	call _atoi
	mov r8, rax

	mov rdi, range
	call _atoi
	mov r9, rax
	inc r9	; so it doesnt stop 1 number below the user input

	mov r10, 1 ; counter
_loop:
	cmp r10, r9
	je _finish

	mov rax, r10
	call _printRAX

	xor rdx, rdx
	mov rax, r10
	mov rbx, r8
	div rbx

	cmp rdx, 0
	jne _newline

_marker:
	mov rbx, marker
	mov rcx, markerLen
	call _output

_newline:
	mov rbx, newline
	mov rcx, 1
	call _output

	inc r10
	jmp _loop

_finish:
	call _exit

_input:
	mov rax, 0
	mov rdi, 0
	mov rsi, rbx
	mov rdx, rcx
	syscall
	mov byte [rsi + rax - 1], 0
	ret

_output:
	mov rax, 1
	mov rdi, 1
	mov rsi, rbx
	mov rdx, rcx
	syscall
	ret

; Atoi from @tnewman, https://gist.github.com/tnewman/63b64284196301c4569f750a08ef52b2
; Takes number in rdi and returns on rax
_atoi:
    mov rax, 0              ; Set initial total to 0
     
_convert:
    movzx rsi, byte [rdi]   ; Get the current character
    test rsi, rsi           ; Check for \0
    je _done
    
    cmp rsi, 48             ; Anything less than 0 is invalid
    jl _error
    
    cmp rsi, 57             ; Anything greater than 9 is invalid
    jg _error
     
    sub rsi, 48             ; Convert from ASCII to decimal 
    imul rax, 10            ; Multiply total by 10
    add rax, rsi            ; Add current digit to total
    
    inc rdi                 ; Get the address of the next character
    jmp _convert

_error:
    mov rax, -1             ; Return -1 on error
 
_done:
    ret                     ; Return total or error code

_printRAX:
    mov rcx, digitSpace
    mov rbx, 0				; Put 10 for newline and 0 for nothing
    mov [rcx], rbx
    inc rcx
    mov [digitSpacePos], rcx
 
_printRAXLoop:
    mov rdx, 0
    mov rbx, 10
    div rbx
    push rax
    add rdx, 48
 
    mov rcx, [digitSpacePos]
    mov [rcx], dl
    inc rcx
    mov [digitSpacePos], rcx
    
    pop rax
    cmp rax, 0
    jne _printRAXLoop
 
_printRAXLoop2:
    mov rcx, [digitSpacePos]
 
    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall
 
    mov rcx, [digitSpacePos]
    dec rcx
    mov [digitSpacePos], rcx
 
    cmp rcx, digitSpace
    jge _printRAXLoop2
 
    ret

_exit:
	mov rax, 60
	xor rdi, rdi
	syscall

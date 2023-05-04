; general comments

; preprocessor directives
.586
.MODEL FLAT

; stack configuration
.STACK 4096

.CODE

_packDate PROC
    ; Save the parameters
    push ebp
    mov ebp, esp
    push esi
    push edi

    ; Load the month, day, and year into registers
    mov eax, [ebp+8] ; month
    mov ebx, [ebp+12] ; day
    mov ecx, [ebp+16] ; year

    ; Pack the date components
    ; **** **** ***m mmmd dddd yyyy yyyy yyyy
    shl eax, 21
    shl ebx, 16
    or eax, ebx
    or eax, ecx

    ; Restore registers and return
    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    ret
_packDate ENDP

_unpackDate PROC
    ; Save the parameters
    push ebp
    mov ebp, esp
    push esi
    push edi

    ; Load the packed date and dateComponents array address
    mov eax, [ebp+12] ; packedDate
    mov edi, [ebp+8] ; dateComponents

    ; Unpack the date components
    ; 0000 0000 000d dddd
    mov ebx, eax
    shr ebx, 16
    and ebx, 31

    ; 0000 0000 0000 mmmm
    mov ecx, eax
    shr ecx, 21
    and ecx, 15

    ; 0000 yyyy yyyy yyyy
    and eax, 4095

    ; Save the unpacked date components
    mov [edi], ecx
    mov [edi+4], ebx
    mov [edi+8], eax

    ; Restore registers and return
    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    ret
_unpackDate ENDP

main PROC
    ; Allocate dateComponents array on the stack
    sub esp, 12
    lea edi, [esp]

    ; Call packDate with immediate arguments: month = 4, day = 26, year = 2023
    push 2023
    push 26
    push 4
    call _packDate
    add esp, 12

    ; Save the result
    mov [edi], eax

    ; Call unpackDate
    push eax
    push edi
    call _unpackDate
    add esp, 8

    ; Print the unpacked date
    push dword ptr [edi + 8]
    push dword ptr [edi + 4]
    push dword ptr [edi]
    add esp, 16

    ; Deallocate dateComponents array
    add esp, 12

    ; Exit
    mov eax, 1
    ret
main ENDP

END main


default rel

section .data
    msg1 db "첫 번째 숫자 입력: ", 0
    msg2 db "두 번째 숫자 입력: ", 0
    msg3 db "세 번째 숫자 입력: ", 0
    msg4 db "네 번째 숫자 입력: ", 0
    msg5 db "다섯 번째 숫자 입력: ", 0

    input_fmt db "%d", 0
    sum_fmt db 10, "합계: %d", 10, 0
    avg_fmt db "평균: %d", 10, 0

section .bss
    num1 resd 1
    num2 resd 1
    num3 resd 1
    num4 resd 1
    num5 resd 1
    total resd 1

section .text
    global _main
    extern _printf
    extern _scanf

_main:
    push rbp
    mov rbp, rsp

    ; 첫 번째 숫자
    lea rdi, [rel msg1]
    xor eax, eax
    call _printf

    lea rdi, [rel input_fmt]
    lea rsi, [rel num1]
    xor eax, eax
    call _scanf

    ; 두 번째 숫자
    lea rdi, [rel msg2]
    xor eax, eax
    call _printf

    lea rdi, [rel input_fmt]
    lea rsi, [rel num2]
    xor eax, eax
    call _scanf

    ; 세 번째 숫자
    lea rdi, [rel msg3]
    xor eax, eax
    call _printf

    lea rdi, [rel input_fmt]
    lea rsi, [rel num3]
    xor eax, eax
    call _scanf

    ; 네 번째 숫자
    lea rdi, [rel msg4]
    xor eax, eax
    call _printf

    lea rdi, [rel input_fmt]
    lea rsi, [rel num4]
    xor eax, eax
    call _scanf

    ; 다섯 번째 숫자
    lea rdi, [rel msg5]
    xor eax, eax
    call _printf

    lea rdi, [rel input_fmt]
    lea rsi, [rel num5]
    xor eax, eax
    call _scanf

    ; 다섯 숫자 더하기
    mov eax, [rel num1]
    add eax, [rel num2]
    add eax, [rel num3]
    add eax, [rel num4]
    add eax, [rel num5]

    mov [rel total], eax

    ; 합계 출력
    lea rdi, [rel sum_fmt]
    mov esi, [rel total]
    xor eax, eax
    call _printf

    ; 평균 계산
    mov eax, [rel total]
    cdq
    mov ecx, 5
    idiv ecx

    ; 평균 출력
    lea rdi, [rel avg_fmt]
    mov esi, eax
    xor eax, eax
    call _printf

    ; 프로그램 종료
    xor eax, eax
    pop rbp
    ret

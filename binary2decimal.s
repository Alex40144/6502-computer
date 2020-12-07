PORTB = $6000
PORTA = $6001
DDRB  = $6002
DDRA  = $6003

value = $0200 ;2B
mod10 = $0202 ;2B
message = $0204 ;6B

E  = %10000000
RW = %01000000
RS = %00100000

    .org $8000

reset:
    lda #%11111111  ;Port B to output
    sta DDRB

    lda #%11100000  ;Port A data direction
    sta DDRA

    lda #%00111000  ;set 8-bit mode, 2-line display; 5x8 font
    jsr lcd_instruction

    lda #%00001110  ;set display on, cursor on, blink off
    jsr lcd_instruction

    lda #%00000110  ;increment cursor, but don't scroll display
    jsr lcd_instruction

    lda #0
    sta message
    ;initialize value to the number we want to convert
    lda number
    sta value
    lda number + 1
    sta value + 1

divide:
    ;initialize remainder to 0
    lda #0
    sta mod10
    sta mod10 + 1
    clc

    ldx #16
divloop:
    ;rotate left
    rol value
    rol value + 1
    rol mod10
    rol mod10 + 1

    sec
    lda mod10
    sbc #10
    tay ;save in Y
    lda mod10 + 1
    sbc #0
    bcc ignore_result
    sty mod10
    sta mod10 + 1

ignore_result:
    dex
    bne divloop
    rol value
    rol value + 1

    lda mod10
    clc
    adc #"0"
    jsr push_char

    lda value
    ora value + 1
    bne divide

    ldx #0
print:
    lda message,x
    beq loop
    jsr print_char
    inx
    jmp print

loop:
    jmp loop

number: .word 1729

push_char:
    pha 
    ldy #0
char_loop:
    lda message,y
    tax
    pla
    sta message,y
    iny
    txa
    pha
    bne char_loop

    pla
    sta message,y

    rts

lcd_instruction:
    sta PORTB
    lda #0   ; clear RS/RW/E
    sta PORTA
    lda #E    ; set E bit
    sta PORTA
    lda #0     ; clear RS/RW/E
    sta PORTA
    rts

print_char:
    sta PORTB
    lda #RS   ; set RS
    sta PORTA
    lda #(E | RS)    ; set E and RS bit
    sta PORTA
    lda #RS     ; clear E, leaving RS
    sta PORTA
    rts

    .org $fffc
    .word reset
    .word $0000
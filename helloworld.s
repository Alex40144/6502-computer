PORTB = $6000
PORTA = $6001
DDRB  = $6002
DDRA  = $6003

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
    sta PORTB

    lda #0   ; clear RS/RW/E
    sta PORTA

    lda #E    ; set E bit
    sta PORTA

    lda #0     ; clear RS/RW/E
    sta PORTA

    lda #%00001110  ;set display on, cursor on, blink off
    sta PORTB

    lda #0   ; clear RS/RW/E
    sta PORTA

    lda #E    ; set E bit
    sta PORTA

    lda #0     ; clear RS/RW/E
    sta PORTA

    lda #%00000110  ;increment cursor, but don't scroll display
    sta PORTB

    lda #0   ; clear RS/RW/E
    sta PORTA

    lda #E    ; set E bit
    sta PORTA

    lda #0     ; clear RS/RW/E
    sta PORTA

    lda #"H"  ;send letter H
    sta PORTB
    lda #RS   ; set RS
    sta PORTA
    lda #(E | RS)    ; set E and RS bit
    sta PORTA
    lda #RS     ; clear E, leaving RS
    sta PORTA

    lda #"e"  ;send letter H
    sta PORTB
    lda #RS   ; set RS
    sta PORTA
    lda #(E | RS)    ; set E and RS bit
    sta PORTA
    lda #RS     ; clear E, leaving RS
    sta PORTA

    lda #"l"  ;send letter H
    sta PORTB
    lda #RS   ; set RS
    sta PORTA
    lda #(E | RS)    ; set E and RS bit
    sta PORTA
    lda #RS     ; clear E, leaving RS
    sta PORTA

    lda #"l"  ;send letter H
    sta PORTB
    lda #RS   ; set RS
    sta PORTA
    lda #(E | RS)    ; set E and RS bit
    sta PORTA
    lda #RS     ; clear E, leaving RS
    sta PORTA

    lda #"o"  ;send letter H
    sta PORTB
    lda #RS   ; set RS
    sta PORTA
    lda #(E | RS)    ; set E and RS bit
    sta PORTA
    lda #RS     ; clear E, leaving RS
    sta PORTA

    lda #" "  ;send letter H
    sta PORTB
    lda #RS   ; set RS
    sta PORTA
    lda #(E | RS)    ; set E and RS bit
    sta PORTA
    lda #RS     ; clear E, leaving RS
    sta PORTA


    lda #"W"  ;send letter H
    sta PORTB
    lda #RS   ; set RS
    sta PORTA
    lda #(E | RS)    ; set E and RS bit
    sta PORTA
    lda #RS     ; clear E, leaving RS
    sta PORTA

    lda #"o"  ;send letter H
    sta PORTB
    lda #RS   ; set RS
    sta PORTA
    lda #(E | RS)    ; set E and RS bit
    sta PORTA
    lda #RS     ; clear E, leaving RS
    sta PORTA

    lda #"r"  ;send letter H
    sta PORTB
    lda #RS   ; set RS
    sta PORTA
    lda #(E | RS)    ; set E and RS bit
    sta PORTA
    lda #RS     ; clear E, leaving RS
    sta PORTA

    lda #"l"  ;send letter H
    sta PORTB
    lda #RS   ; set RS
    sta PORTA
    lda #(E | RS)    ; set E and RS bit
    sta PORTA
    lda #RS     ; clear E, leaving RS
    sta PORTA

    lda #"d"  ;send letter H
    sta PORTB
    lda #RS   ; set RS
    sta PORTA
    lda #(E | RS)    ; set E and RS bit
    sta PORTA
    lda #RS     ; clear E, leaving RS
    sta PORTA

    lda #"!"  ;send letter H
    sta PORTB
    lda #RS   ; set RS
    sta PORTA
    lda #(E | RS)    ; set E and RS bit
    sta PORTA
    lda #RS     ; clear E, leaving RS
    sta PORTA


loop:
    jmp loop

    .org $fffc
    .word reset
    .word $0000
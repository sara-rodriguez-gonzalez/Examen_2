#include "p16F887.inc"   ; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
 	__CONFIG	_CONFIG1,	_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF 
 	__CONFIG	_CONFIG2,	_BOR40V & _WRT_OFF

RES_VECT  CODE    0x0000            ; processor reset vector
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    GOTO    START                   ; go to beginning of programa

MAIN_PROG CODE                      ; let linker place main program
    i EQU 0x20
    j EQU 0x21
 
    C1 EQU 0x22
    C2 EQU 0x23
    C3 EQU 0x24
    C4 EQU 0x25
    C5 EQU 0x26
    C6 EQU 0x27
    C7 EQU 0x28
    C0 EQU 0x29
 
    D1 EQU 0x42
    D2 EQU 0x43
    D3 EQU 0x44
    D4 EQU 0x45
    D5 EQU 0x46
    D6 EQU 0x47
    D7 EQU 0x48
    D0 EQU 0x49

    l equ 0x30
    n equ 0x31
    k equ 0x32
    m equ 0x33
    REGIS equ 0x34
    CONT equ 0x35
    AUX equ 0x36
    o equ 0x37
    

    
 
START

    BANKSEL PORTA ;
    CLRF PORTA ;Init PORTA
    BANKSEL ANSEL ;
    CLRF ANSEL ;digital I/O
    CLRF ANSELH
    BCF STATUS,RP1 ;0
    BSF STATUS,RP0 ;1
    BANKSEL TRISA ;
    CLRF TRISA
    BANKSEL TRISB ;
    CLRF TRISB
    BANKSEL TRISC
    CLRF TRISC
    BANKSEL TRISD
    MOVLW b'00001111'
    MOVWF TRISD
    BCF STATUS,RP1
    BCF STATUS,RP0
    CLRF PORTA
    CLRF PORTB
    CLRF PORTC
    CLRF PORTD
    CLRF PORTE
    
    

INITLCD
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
INIT_VAR
    CLRF REGIS
    CLRF CONT
    CLRF STATUS
    
    MOVLW 0xC8
    MOVWF o
    
    CLRF C0
    CLRF C1
    CLRF C2
    CLRF C3
    CLRF C4
    CLRF C5
    CLRF C6
    CLRF C7
    
    CLRF D0
    CLRF D1
    CLRF D2
    CLRF D3
    CLRF D4
    CLRF D5
    CLRF D6
    CLRF D7
    
    
    
    
INIT_BIENVENIDA
    call INITBIEN ;Coloca Bienvenida
    call tiempo
    call tiempo
    call tiempo
    call Limpiar
    
INIT_DATOS
    call INITDATOS ;Coloca Create Password: y Enter Password:
    
INICIO	  
    call TECLADO
    call tiempo
    GOTO INICIO
    
TECLADO:
    ;ENCENDER 1
    BSF PORTC,0
	;CHECAR A
    BTFSC PORTD,0
    GOTO FUNC1 
	;CHECAR B
    BTFSC PORTD,1
    GOTO FUNC4
	;CHECAR C
    BTFSC PORTD,2
    GOTO FUNC7
	;CHECAR D
    BTFSC PORTD,3
    GOTO FUNCAST
    BCF PORTC,0
    ;ENCENDER 2
    BSF PORTC,1
	;CHECAR A
    BTFSC PORTD,0
    GOTO FUNC2
	;CHECAR B
    BTFSC PORTD,1
    GOTO FUNC5
	;CHECAR C
    BTFSC PORTD,2
    GOTO FUNC8
	;CHECAR D
    BTFSC PORTD,3
    GOTO FUNC0
    BCF PORTC,1
    ;ENCENDER 3
    BSF PORTC,2
	;CHECAR A
    BTFSC PORTD,0
    GOTO FUNC3
	;CHECAR B
    BTFSC PORTD,1
    GOTO FUNC6
	;CHECAR C
    BTFSC PORTD,2
    GOTO FUNC9
	;CHECAR D
    BTFSC PORTD,3
    GOTO FUNCGATO
    BCF PORTC,2
    RETURN
    
    
CHECK1:
    MOVFW C7
    SUBWF D7
    BTFSC STATUS,Z
    GOTO CHECK2
    BTFSC STATUS,C
    GOTO NEG
    GOTO POS
    
CHECK2:
    CLRF STATUS
    MOVFW C6
    SUBWF D6
    BTFSC STATUS,Z
    GOTO CHECK3
    BTFSC STATUS,C
    GOTO NEG
    GOTO POS
    
CHECK3:
    CLRF STATUS
    MOVFW C5
    SUBWF D5
    BTFSC STATUS,Z
    GOTO CHECK4
    BTFSC STATUS,C
    GOTO NEG
    GOTO POS
    
CHECK4:
    CLRF STATUS
    MOVFW C4
    SUBWF D4
    BTFSC STATUS,Z
    GOTO CHECK5
    BTFSC STATUS,C
    GOTO NEG
    GOTO POS
    
CHECK5:
    CLRF STATUS
    MOVFW C3
    SUBWF D3
    BTFSC STATUS,Z
    GOTO CHECK6
    BTFSC STATUS,C
    GOTO NEG
    GOTO POS
    
CHECK6:
    CLRF STATUS
    MOVFW C2
    SUBWF D2
    BTFSC STATUS,Z
    GOTO CHECK7
    BTFSC STATUS,C
    GOTO NEG
    GOTO POS
 
CHECK7:
    CLRF STATUS
    MOVFW C1
    SUBWF D1
    BTFSC STATUS,Z
    GOTO CHECK8
    BTFSC STATUS,C
    GOTO NEG
    GOTO POS
    
CHECK8:
    CLRF STATUS
    MOVFW C0
    SUBWF D0
    BTFSC STATUS,Z
    GOTO IMP_CORRECTO
    BTFSC STATUS,C
    GOTO NEG
    GOTO POS
    
    
NEG:
    GOTO IMP_INCORRECTO
    
POS:
    GOTO IMP_INCORRECTO
    
IMP_INCORRECTO:
    call Limpiar
   
    call Loading
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x87		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'X'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'X' 
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x95		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW b'00101101'
    MOVWF PORTB
    CALL exec
    
    MOVLW b'00101101'
    MOVWF PORTB
    CALL exec
    
    MOVLW b'00101101'
    MOVWF PORTB
    CALL exec
    
    MOVLW b'00101101'
    MOVWF PORTB
    CALL exec
    
    MOVLW b'00101101'
    MOVWF PORTB
    CALL exec
    
    MOVLW b'00101101'
    MOVWF PORTB
    CALL exec
    
    MOVLW b'00101101'
    MOVWF PORTB
    CALL exec
    
    call tiempo
    call tiempo
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xD4		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
    
    GOTO $
    
IMP_CORRECTO:
    call Limpiar
    
    call Loading
    
    call Limpiar
    
    call Palomita
    
    call time_short
    
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x98		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
    
    GOTO $
    
Palomita:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x87		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC6		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x93		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec

    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xD4		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    RETURN
    
Loading:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x82		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'L'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'G'
    MOVWF PORTB
    CALL exec
    
    MOVLW '.'
    MOVWF PORTB
    CALL exec
    
    MOVLW '.'
    MOVWF PORTB
    CALL exec
    
    MOVLW '.'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x92		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    call time_short
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    call time_short
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    call time_short
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    call time_short
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    call time_short
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    call time_short
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    call time_short
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    call time_short
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    call time_short
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    call time_short
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    call time_short
    
    MOVLW b'11111111'
    MOVWF PORTB
    CALL exec
    
    call time_short
    
    call Limpiar
    
    RETURN
    
    
FUNCGATO:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xD8		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    BSF REGIS,0
    CLRF CONT
    
    MOVLW 0xD8
    MOVWF o
    
    call tiempo
    call tiempo

    GOTO INICIO
    
FUNCAST:
   GOTO CHECK1
    

FUNC0:
    MOVLW '0'
    MOVWF PORTB
    MOVWF AUX
    CALL exec
    CALL time
    GOTO BANDERA
    
FUNC1:
    MOVLW '1'
    MOVWF PORTB
    MOVWF AUX
    CALL exec
    CALL time
    GOTO BANDERA
    
FUNC2:
    MOVLW '2'
    MOVWF PORTB
    MOVWF AUX
    CALL exec
    CALL time
    GOTO BANDERA
    
FUNC3:
    MOVLW '3'
    MOVWF PORTB
    MOVWF AUX
    CALL exec
    CALL time
    GOTO BANDERA
    
FUNC4:
    MOVLW '4'
    MOVWF PORTB
    MOVWF AUX
    CALL exec
    CALL time
    GOTO BANDERA
    
FUNC5:
    MOVLW '5'
    MOVWF PORTB
    MOVWF AUX
    CALL exec
    CALL time
    GOTO BANDERA
    
FUNC6:
    MOVLW '6'
    MOVWF PORTB
    MOVWF AUX
    CALL exec
    CALL time
    GOTO BANDERA
    
FUNC7:
    MOVLW '7'
    MOVWF PORTB
    MOVWF AUX
    CALL exec
    CALL time
    GOTO BANDERA
    
FUNC8:
    MOVLW '8'
    MOVWF PORTB
    MOVWF AUX
    CALL exec
    CALL time
    GOTO BANDERA
    
FUNC9:
    MOVLW '9'
    MOVWF PORTB
    MOVWF AUX
    CALL exec
    CALL time
   GOTO BANDERA
    
OCULTAMIENTO:
    ;Ocultamiento de caracter
    call tiempo
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVF o,0		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    CALL time

    INCF o,1
    
    RETURN
    
BANDERA:
    BTFSS CONT,7
    GOTO FUNC_CHAR7
    BTFSS CONT,6
    GOTO FUNC_CHAR6
    BTFSS CONT,5
    GOTO FUNC_CHAR5
    BTFSS CONT,4
    GOTO FUNC_CHAR4
    BTFSS CONT,3
    GOTO FUNC_CHAR3
    BTFSS CONT,2
    GOTO FUNC_CHAR2
    BTFSS CONT,1
    GOTO FUNC_CHAR1
    BTFSS CONT,0
    GOTO FUNC_CHAR0
    
    
    
FUNC_CHAR7:
    MOVF AUX,0
    BSF CONT,7
    BTFSS REGIS, 0
    MOVWF C7
    BTFSC REGIS, 0
    MOVWF D7
    call OCULTAMIENTO
    GOTO INICIO
    
FUNC_CHAR6:
    MOVF AUX,0
    BSF CONT,6
    BTFSS REGIS,0
    MOVWF C6
    BTFSC REGIS,0
    MOVWF D6
    call OCULTAMIENTO
    GOTO INICIO
    
FUNC_CHAR5:
    MOVF AUX,0
    BSF CONT,5
    BTFSS REGIS,0
    MOVWF C5
    BTFSC REGIS,0
    MOVWF D5
    call OCULTAMIENTO
    GOTO INICIO
    
FUNC_CHAR4:
    MOVF AUX,0
    BSF CONT,4
    BTFSS REGIS,0
    MOVWF C4
    BTFSC REGIS,0
    MOVWF D4
    call OCULTAMIENTO
    GOTO INICIO
    
FUNC_CHAR3:
    MOVF AUX,0
    BSF CONT,3
    BTFSS REGIS,0
    MOVWF C3
    BTFSC REGIS,0
    MOVWF D3
    call OCULTAMIENTO
    GOTO INICIO
    
FUNC_CHAR2:
    MOVF AUX,0
    BSF CONT,2
    BTFSS REGIS,0
    MOVWF C2
    BTFSC REGIS,0
    MOVWF D2
    call OCULTAMIENTO
    GOTO INICIO
    
FUNC_CHAR1:
    MOVF AUX,0
    BSF CONT,1
    BTFSS REGIS,0
    MOVWF C1
    BTFSC REGIS,0
    MOVWF D1
    call OCULTAMIENTO
    GOTO INICIO

FUNC_CHAR0:
    MOVF AUX,0
    BSF CONT,0
    BTFSS REGIS,0
    MOVWF C0
    BTFSC REGIS,0
    MOVWF D0
    call OCULTAMIENTO
    GOTO INICIO
    
    

INITBIEN: 
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC0		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x95		;LCD position
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'W'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'L'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
   
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'M'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xD0		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    return
    
INITDATOS: 
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x80		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'e'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    
    MOVLW 't'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'e'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'P'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    
    MOVLW 's'
    MOVWF PORTB
    CALL exec
    
    MOVLW 's'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'w'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'o'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'd'
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x90		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    
    MOVLW 't'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'e'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec

    MOVLW 'P'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    
    MOVLW 's'
    MOVWF PORTB
    CALL exec
    
    MOVLW 's'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'w'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'o'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'd'
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    ;Colocar en posicion inicial linea Create Password:
    BCF PORTA,0		;command mode
    CALL time
    
    
    MOVLW 0xC8		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    return
    
tiempo:
nop
    NOP
movlw d'30' ;establecer valor de la variable k
movwf m
mloop:
decfsz m,f
goto mloop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movlw d'20' ;establecer valor de la variable i
movwf l
iloop:
nop ;NOPs de relleno (ajuste de tiempo)

 movlw d'25' ;establecer valor de la variable j
movwf n
jloop:
nop ;NOPs de relleno (ajuste de tiempo)
movlw d'145' ;establecer valor de la variable k
movwf k
kloop:
decfsz k,f
goto kloop
decfsz n,f
goto jloop
decfsz l,f
goto iloop
return
			
exec

    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    RETURN
    
time
    CLRF i
    MOVLW d'10'
    MOVWF j
ciclo    
    MOVLW d'80'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo
    RETURN
    
    
time_short:
    nop
    NOP
    movlw d'30' ;establecer valor de la variable k
    movwf m
    mloop2:
    decfsz m,f
    goto mloop2
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    movlw d'20' ;establecer valor de la variable i
    movwf l
    iloop2:
    nop ;NOPs de relleno (ajuste de tiempo)

     movlw d'25' ;establecer valor de la variable j
    movwf n
    jloop2:
    nop ;NOPs de relleno (ajuste de tiempo)
    movlw d'90' ;establecer valor de la variable k
    movwf k
    kloop2:
    decfsz k,f
    goto kloop2
    decfsz n,f
    goto jloop2
    decfsz l,f
    goto iloop2
    RETURN
    
Limpiar:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x01		;reset
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    return
			
    END
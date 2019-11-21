//É necessário pressionar um digito e após pressionar ENTER para a leitura do próximo digito


@128
    D = A
@enter //enter = 128
    M = D

@R0
    D = A

@valor_real_1 //valor_real_1 = 0
    M = D

@R0
    D = A

@valor_real_2 //valor_real_2 = 0
    M = D


(PRIMEIRO)
    @KBD
        D = M

    //@valor_real_1
    //  M = D - 48 //48 é o inicio do mapeamento do naturais e representa o 0, portanto terei o valor real subtraindo-o da entrada
    @valor_real_1
        M = D


    @48
        D = A

    @valor_real_1
        M = M - D

    @KBD        //DEVE MANTER ENTER PRESSIONADO PARA SALTAR PARA SEGUNDO
        D = M

    @valor_pressionado 
        M = D

    @enter      
        D = M

    @valor_pressionado
        D = D - M       

    @SEGUNDO
        D;JEQ     //valor pressionado - 128 == 0 go to SEGUNDO

    @PRIMEIRO
        0;JMP



(SEGUNDO)
    //@valor_real_2    Perguntar o porque não funciona
    //M = D - 48
    
    
    @KBD
        D = M

    @valor_real_2
        M = D

    @48
        D = A

    @valor_real_2
        M = M - D //Atribuindo o segundo valor real


    //Momento de escolher a operação

    //Soma
    @KBD
        D = M
    @valor_pressionado
        M = D
    @43
        D = A
    @valor_pressionado
        D = D - M

    @SOMA
        D;JEQ
    

    //Subtração
    @KBD
        D = M
    @valor_pressionado
        M = D
    @45
        D = A
    @valor_pressionado
        D = D - M      
    @SUBTRACAO
        D;JEQ


    //Multiplicação
    @KBD
        D = M
    @valor_pressionado
        M = D
    @42
        D = A
    @valor_pressionado
        D = D - M    
    @MULTIPLICACAO
        D;JEQ


    //Divisao
    @KBD
        D = M
    @valor_pressionado
        M = D
    @47
        D = A
    @valor_pressionado
        D = D - M   
    @DIVISAO
        D;JEQ


    (SOMA)
        @valor_real_1
            D = M
        @valor_real_2
            D = D + M
        @R3             //Guardando o cálculo em R3
            M = D
        @END
            0;JMP
    
    (SUBTRACAO)
        @valor_real_1
            D = M
        @valor_real_2
            D = D - M
        @R3             //Guardando o cálculo em R3
            M = D
        @END
            0;JMP

    (MULTIPLICACAO)
        @i
             M=1
        (LOOPM)
            @i
               D=M
            @valor_real_2
               D=D-M
            @END
               D;JGT
            @valor_real_1
               D=M
            @R3
               M=M+D
            @i
               M=M+1
            @LOOPM
                0;JMP
            


    (DIVISAO)
               (LOOP)
            @valor_real_1 //DIVIDENDO
                D = M
            @valor_real_2 //DIVISOR
                D = D - M //D = dividendo - divisor 

            @RESTO
                D;JLT  //(dividendo - divisor) < 0 go to RESTO

            @ULT
                D;JEQ  //(dividendo - divisor) == 0

            @R3
                M = M + 1

            @valor_real_2 //DIVISOR
                D = M

            @valor_real_1 //DIVIDENDO
                M = M - D

            @LOOP
                0;JMP

        (ULT)
            @R3 
                M = M + 1
        (RESTO)
            @i
                M=1
            (LOOPR)
            @i
                D=M
            @R3
                D=D-M
            @END
                D;JGT
            @valor_real_2 //DIVISOR
                D=M
            @mult
                M=M+D
                D = M
            @valor_real_1 //DIVIDENDO
                D = D - M
            @R4
                M = D
            @i
                M=M+1
            @LOOPR
                0;JMP

(END)
    @END
        0;JMP
    











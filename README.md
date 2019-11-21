# Assembly Calculator  
## Calculadora em assembly feita na arquitetura desenvolvida pelo nand2tetris  
A calculadora foi feita recebendo uma entrada do teclado e subtraindo 48, que representa 0 na tabela de caracteres para assim obter o valor real. Obtendo o primeiro valor real no local indicado pelo registrador 24576 o usuário deve fornecer ENTER (128) ao algorítimo para que o mesmo possa obter o segundo valor real. A partir daí uma operação pode ser escolhida: soma, subtração, multiplicação e divisão, a escolha deve ser feita com o teclado numérico representado por +, -, *, / respectivamente. O valor das operações é armazenado em R3 e no caso da divisão o resto é armazenado em R4.  
Para utilizar carregue o arquivo na CPUEmulator.sh. No primeiro endereço relativo ao keyboard pressione o valor desejado, no segundo pressione ENTER e inicialize o segundo registrador em seguida escolha a operação com o NumPad.


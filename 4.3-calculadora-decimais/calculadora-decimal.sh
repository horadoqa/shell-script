#!/bin/bash

# Capturando valores do usuário
read -p "Digite o primeiro número: " num1
read -p "Digite o segundo número: " num2

# Escolhendo a operação
echo "Escolha a operação:"
echo "1 - Soma (+)"
echo "2 - Subtração (-)"
echo "3 - Multiplicação (*)"
echo "4 - Divisão (/)"
echo "5 - Potência (^)"
read -p "Digite o número da operação: " operacao

# Executando a operação usando bc
case $operacao in
    1)
        resultado=$(echo "$num1 + $num2" | bc)
        simbolo="+"
        ;;
    2)
        resultado=$(echo "$num1 - $num2" | bc)
        simbolo="-"
        ;;
    3)
        resultado=$(echo "$num1 * $num2" | bc)
        simbolo="*"
        ;;
    4)
        if [ "$num2" = "0" ]; then
            echo "Erro: divisão por zero não é permitida."
            exit 1
        fi
        resultado=$(echo "scale=2; $num1 / $num2" | bc)
        simbolo="/"
        ;;
    5)
        resultado=$(echo "$num1 ^ $num2" | bc)
        simbolo="^"
        ;;
    *)
        echo "Operação inválida!"
        exit 1
        ;;
esac

# Exibindo o resultado
echo -e "\nResultado: $num1 $simbolo $num2 = $resultado"
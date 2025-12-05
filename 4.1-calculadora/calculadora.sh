#!/bin/bash

# Capturando valores do usuário
read -p "Digite o primeiro número: " num1
read -p "Digite o segundo número: " num2

# Capturando a operação desejada
echo "Escolha a operação:"
echo "1 - Soma (+)"
echo "2 - Subtração (-)"
echo "3 - Multiplicação (*)"
echo "4 - Divisão (/)"
read -p "Digite o número da operação: " operacao

# Realizando a operação
case $operacao in
    1)
        resultado=$((num1 + num2))
        simbolo="+"
        ;;
    2)
        resultado=$((num1 - num2))
        simbolo="-"
        ;;
    3)
        resultado=$((num1 * num2))
        simbolo="*"
        ;;
    4)
        if [ $num2 -eq 0 ]; then
            echo "Erro: divisão por zero não é permitida."
            exit 1
        fi
        resultado=$((num1 / num2))
        simbolo="/"
        ;;
    *)
        echo "Operação inválida!"
        exit 1
        ;;
esac

# Exibindo o resultado
echo -e "\nResultado: $num1 $simbolo $num2 = $resultado"
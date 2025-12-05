#!/bin/bash

echo "=== Calculadora Interativa Decimal ==="

while true; do
    # Captura dos números
    read -p "Digite o primeiro número (ou 'sair' para encerrar): " num1
    if [[ $num1 == "sair" ]]; then
        echo "Encerrando a calculadora. Até logo!"
        exit 0
    fi

    read -p "Digite o segundo número: " num2

    # Escolha da operação
    echo "Escolha a operação:"
    echo "1 - Soma (+)"
    echo "2 - Subtração (-)"
    echo "3 - Multiplicação (*)"
    echo "4 - Divisão (/)"
    echo "5 - Potência (^)"
    echo "6 - Módulo (%)"
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
            if [[ $num2 == 0 ]]; then
                echo "Erro: divisão por zero não é permitida."
                continue
            fi
            resultado=$(echo "scale=2; $num1 / $num2" | bc)
            simbolo="/"
            ;;
        5)
            resultado=$(echo "$num1 ^ $num2" | bc)
            simbolo="^"
            ;;
        6)
            resultado=$(echo "$num1 % $num2" | bc)
            simbolo="%"
            ;;
        *)
            echo "Operação inválida! Tente novamente."
            continue
            ;;
    esac

    # Exibindo resultado
    echo -e "\nResultado: $num1 $simbolo $num2 = $resultado"
    echo "-------------------------------"
done
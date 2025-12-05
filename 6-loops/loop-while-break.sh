#!/bin/bash

while true; do
    read -p "Digite algo (ou 'sair' para encerrar): " entrada
    if [[ $entrada == "sair" ]]; then
        echo "Encerrando..."
        break
    fi
    echo "Você digitou: $entrada"
done
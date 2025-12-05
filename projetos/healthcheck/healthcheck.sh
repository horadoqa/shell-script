#!/bin/bash

while true; do
    echo "Realizando healthcheck..."
    curl -s https://horadoqa.com.br/healthcheck
    echo -e "\nAguardando 10 segundos para a próxima verificação..."
    sleep 10
done
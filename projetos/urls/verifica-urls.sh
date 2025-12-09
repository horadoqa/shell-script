#!/bin/bash

INPUT_FILE="urls.txt"
OUTPUT_FILE="resultado.txt"

# Limpa o arquivo de saída
> "$OUTPUT_FILE"

# Cores
RED="\e[31m"
GREEN="\e[32m"
RESET="\e[0m"

while IFS= read -r url; do
    if [ -n "$url" ]; then
        
        timestamp=$(date +"%Y-%m-%d %H:%M:%S")

        # Curl com timeout
        status=$(curl \
            -m 5 \
            --connect-timeout 3 \
            -o /dev/null \
            -s \
            -w "%{http_code}" \
            "$url")

        # Tratamento para status 000
        if [ "$status" = "000" ]; then
            msg="Falha (timeout, DNS inválido ou URL inacessível)"
            color="$RED"
        else
            msg="Status: $status"

            if [ "$status" = "200" ]; then
                color="$GREEN"
            else
                color="$RED"
            fi
        fi

        # Salva no arquivo (sem cores)
        echo "$timestamp - $url - $msg" >> "$OUTPUT_FILE"

        # Exibe no terminal (com cores)
        echo -e "${timestamp} -> Verificado: $url -> ${color}${msg}${RESET}"

    fi
done < "$INPUT_FILE"

#!/bin/bash

while true; do
    DATA=$(date +"%Y-%m-%d %H:%M:%S")
    RESPOSTA=$(curl -s https://horadoqa.com.br/healthcheck)

    echo "[$DATA] $RESPOSTA" | tee -a healthcheck.log

    sleep 10
done

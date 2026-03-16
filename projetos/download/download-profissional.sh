#!/bin/bash

URL="https://update.code.visualstudio.com/commit:ce099c1ed25d9eb3076c11e4a280f3eb52b4fbeb/server-linux-x64/stable"
OUTPUT="vscode-server.tar.gz"
LOGFILE="download.log"

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

attempt=1
sleep_time=10
max_sleep=300

cleanup() {
    echo -e "\n${RED}Script interrompido pelo usuário.${NC}"
    exit 1
}

trap cleanup SIGINT

echo -e "${BLUE}Iniciando downloader resiliente...${NC}"

while true; do

    timestamp=$(date "+%Y-%m-%d %H:%M:%S")

    echo -e "${YELLOW}Tentativa #$attempt - $timestamp${NC}"
    echo "[$timestamp] Tentativa #$attempt" >> "$LOGFILE"

    wget \
        --timeout=30 \
        --tries=1 \
        --show-progress \
        "$URL" -O "$OUTPUT"

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Download concluído com sucesso!${NC}"
        echo "[$timestamp] Sucesso após $attempt tentativas" >> "$LOGFILE"
        break
    fi

    echo -e "${RED}Falhou. Nova tentativa em ${sleep_time}s...${NC}"
    echo "[$timestamp] Falhou - aguardando ${sleep_time}s" >> "$LOGFILE"

    sleep $sleep_time

    # Retry exponencial
    sleep_time=$((sleep_time * 2))
    if [ $sleep_time -gt $max_sleep ]; then
        sleep_time=$max_sleep
    fi

    ((attempt++))

done
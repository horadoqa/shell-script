#!/bin/bash

URL="https://update.code.visualstudio.com/commit:ce099c1ed25d9eb3076c11e4a280f3eb52b4fbeb/server-linux-x64/stable"
OUTPUT="vscode-server.tar.gz"

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

attempt=1

while true; do
    echo -e "${YELLOW}Tentativa #$attempt - $(date)${NC}"

    if wget -q --show-progress "$URL" -O "$OUTPUT"; then
        echo -e "${GREEN}Download concluído com sucesso!${NC}"
        break
    else
        echo -e "${RED}Falhou. Tentando novamente em 10 segundos...${NC}"
        ((attempt++))
        sleep 10
    fi
done
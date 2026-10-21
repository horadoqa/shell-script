
#!/bin/bash

URL="https://serverest.dev/usuarios"
ARQUIVO="ids.txt"

# Consulta a API e salva a resposta temporariamente em uma variável
RESPOSTA=$(curl -fsS "$URL") || {
    echo "Erro ao consultar a API."
    exit 1
}

# Extrai todos os IDs e salva um por linha
echo "$RESPOSTA" | jq -r '.usuarios[]._id' > "$ARQUIVO"

echo "IDs salvos em $ARQUIVO"
echo "Total de IDs: $(wc -l < "$ARQUIVO")"

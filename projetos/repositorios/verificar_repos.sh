
#!/bin/sh

DIRETORIO_BASE="/home/rfahham/projetos"
RELATORIO="relatorio.txt"

if [ ! -d "$DIRETORIO_BASE" ]; then
    echo "Erro: diretório $DIRETORIO_BASE não encontrado!"
    exit 1
fi

{
    echo "RELATÓRIO DE STATUS DOS REPOSITÓRIOS GIT"
    echo "Data: $(date)"
    echo "Diretório base: $DIRETORIO_BASE"
    echo "========================================"

    for REPO in "$DIRETORIO_BASE"/*; do

        # Ignora entradas inexistentes e diretórios que não sejam pastas
        [ -d "$REPO" ] || continue

        # Verifica se é um repositório Git
        if ! git -C "$REPO" rev-parse --git-dir >/dev/null 2>&1; then
            continue
        fi

        echo ""
        echo "Repositório: $REPO"
        echo "----------------------------------------"

        STATUS=$(git -C "$REPO" status --short 2>&1)
        RESULTADO=$?

        if [ "$RESULTADO" -ne 0 ]; then
            echo "ERRO ao executar git status:"
            echo "$STATUS"
        elif [ -z "$STATUS" ]; then
            echo "Status: LIMPO - Nenhuma alteração pendente."
        else
            echo "Status: ALTERAÇÕES PENDENTES"
            git -C "$REPO" status
        fi

    done

    echo ""
    echo "========================================"
    echo "Relatório concluído em: $(date)"

} > "$RELATORIO"

echo "Verificação concluída!"
echo "Relatório salvo em: $RELATORIO"

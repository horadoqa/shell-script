# Backup de Arquivos e Diretórios com `rsync`

### Guia completo para criar backups eficientes em Shell Script

O `rsync` é uma das ferramentas mais poderosas e populares para sincronização e backup de arquivos no Linux.
Ele é **muito mais eficiente que `cp`**, pois copia apenas arquivos alterados, economiza tempo e banda, preserva permissões e pode até trabalhar via SSH.

Este guia mostra como usar o `rsync` dentro de um Shell Script para criar backups profissionais.

---

# 1. Criando o arquivo do script

Vamos criar um arquivo chamado:

```bash
backup-rsync.sh
```

---

# 2. Exemplo de Script de Backup com `rsync`

```bash
#!/bin/bash

SOURCE="/caminho/do/diretorio/original/"
DESTINATION="/caminho/onde/vai/o/backup/"

rsync -avh --delete "$SOURCE" "$DESTINATION"

echo "Backup concluído em $(date)"
```

---

# 3. Explicando os parâmetros do `rsync`

| Parâmetro   | Significado                                                        |
| ----------- | ------------------------------------------------------------------ |
| `-a`        | modo arquivo (preserva permissões, links, donos, datas, recursivo) |
| `-v`        | verbose (mostra o que está sendo feito)                            |
| `-h`        | human readable (mostra tamanhos legíveis)                          |
| `--delete`  | remove do destino arquivos que foram apagados na origem            |
| `-z`        | comprimir dados durante a transferência (útil para backup remoto)  |
| `-P`        | mostra progresso e permite retomar transferências                  |
| `--exclude` | exclui arquivos/pastas                                             |

Exemplo com exclusões:

```bash
rsync -avh --exclude="*.log" --exclude="cache/" "$SOURCE" "$DESTINATION"
```

---

# 4. Exemplos práticos

## 🔹 4.1 Backup local (mais comum)

```bash
rsync -avh /home/user/documentos/ /home/user/backups/documentos/
```

## 🔹 4.2 Backup remoto via SSH

```bash
rsync -avh -e ssh /home/user/projetos/ usuario@servidor.com:/backup/projetos/
```

## 🔹 4.3 Backup do servidor para a máquina local

```bash
rsync -avh -e ssh usuario@servidor.com:/var/www/ /home/user/backup/www/
```

## 🔹 4.4 Criando backups com timestamp (recomendado)

```bash
DESTINATION="/backups/backup_$(date +%Y-%m-%d_%H-%M-%S)/"
mkdir -p "$DESTINATION"

rsync -avh "$SOURCE" "$DESTINATION"
```

---

# 5. Tornando o script executável

```bash
chmod +x backup-rsync.sh
```

---

# 6. Executando o backup

```bash
./backup-rsync.sh
```

---

# 7. Agendando backups automáticos com *cron*

Abra o editor do cron:

```bash
crontab -e
```

Adicione uma linha, como por exemplo:

### Executar todos os dias às 23h

```bash
0 23 * * * /caminho/para/backup-rsync.sh
```

### Executar a cada 30 minutos

```bash
*/30 * * * * /caminho/para/backup-rsync.sh
```

### Executar toda segunda-feira às 2h da manhã

```bash
0 2 * * 1 /caminho/para/backup-rsync.sh
```

---

# 8. Exemplo completo com exclusões, log e timestamp

```bash
#!/bin/bash

SOURCE="/home/user/projetos/"
DEST="/home/user/backups/projetos_$(date +%F_%H-%M-%S)/"

mkdir -p "$DEST"

rsync -avh \
    --exclude="node_modules/" \
    --exclude="*.log" \
    --delete \
    "$SOURCE" "$DEST" \
    >> /home/user/backups/backup.log 2>&1

echo "Backup concluído em $(date)"
```

Este script:

* cria backup com data e hora
* exclui arquivos desnecessários
* registra tudo num log
* mantém o diretório destino sincronizado

---

# 9. Boas práticas ao usar `rsync`

✔ Sempre coloque **/ (barra)** no final dos caminhos
✔ Use `--delete` somente se souber que quer sincronizar e remover arquivos
✔ Nunca teste com `--delete` sem antes usar:

```
rsync -avhn
```

(`-n` faz um *dry-run*, não executa de verdade)

✔ Use `rsync` para backups incrementais rápidos
✔ Sempre faça testes antes de automatizar com *cron*

---

🎉 **Parabéns!**
Agora você sabe criar backups profissionais usando **rsync**, incluindo:

* backup local e remoto
* exclusão automática de arquivos
* preservação de permissões
* logs
* automação com *cron*

Outras opções:

* backup completo com compressão
* retenção automática de backups antigos
* interface interativa (menu)
* envio automático para S3 ou FTP

---
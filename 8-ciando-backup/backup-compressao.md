# Backup Completo com Compressão em Shell Script

### Criando backups compactados com TAR + GZIP/BZIP2/XZ

Este guia ensina como criar **backups completos e compactados** de diretórios ou arquivos no Linux utilizando Shell Script.
A compressão reduz o tamanho do backup, economizando espaço e facilitando transporte.

---

# 1. Criando o arquivo do script

Vamos criar o script:

```bash
backup-compressao.sh
```

---

# 2. Backup completo com `tar` + `gzip` (mais comum)

```bash
#!/bin/bash

SOURCE="/caminho/da/origem"
DESTINATION="/caminho/do/backup"

ARQUIVO="backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

tar -czvf "$DESTINATION/$ARQUIVO" "$SOURCE"

echo "Backup criado com sucesso: $ARQUIVO"
```

### Explicando o comando:

| Parâmetro | Função                   |
| --------- | ------------------------ |
| `-c`      | cria um novo arquivo tar |
| `-z`      | comprime usando gzip     |
| `-v`      | modo verboso             |
| `-f`      | define o nome do arquivo |

**Resultado:**
Um arquivo `.tar.gz` contendo todo o diretório de origem.

---

# 3. Backup com `tar` + `bzip2` (compressão melhor, mais lento)

```bash
tar -cjvf "$DESTINATION/$ARQUIVO.tar.bz2" "$SOURCE"
```

### Usos comuns:

* Quando precisa de melhor taxa de compressão
* Ótimo para arquivos grandes

---

# 4. Backup com `tar` + `xz` (compressão máxima)

```bash
tar -cJvf "$DESTINATION/$ARQUIVO.tar.xz" "$SOURCE"
```

### Usos comuns:

* Melhor compressão possível
* Ideal para armazenamento de longo prazo

---

# 5. Criando backup com múltiplas exclusões

```bash
tar -czvf "$DESTINATION/$ARQUIVO" \
    --exclude="*.log" \
    --exclude="node_modules/" \
    --exclude="cache/" \
    "$SOURCE"
```

---

# 6. Criando diretório de destino caso não exista

```bash
mkdir -p "$DESTINATION"
```

Melhorando o script:

```bash
#!/bin/bash

SOURCE="/caminho/da/origem"
DESTINATION="/backups"
mkdir -p "$DESTINATION"

ARQUIVO="backup_$(date +%F_%H-%M-%S).tar.gz"

tar -czvf "$DESTINATION/$ARQUIVO" "$SOURCE"

echo "Backup salvo em: $DESTINATION/$ARQUIVO"
```

---

# 7. Versão avançada com `rsync + tar`

### (Backup incremental + compressão final)

Esta é uma prática profissional:

1. `rsync` copia apenas arquivos modificados → rápido
2. `tar` comprime → ocupa menos espaço

```bash
#!/bin/bash

SOURCE="/home/user/projetos/"
TMP="/tmp/backup_tmp"
DEST="/backups"
mkdir -p "$TMP" "$DEST"

echo "Sincronizando arquivos..."
rsync -avh --delete "$SOURCE" "$TMP"

ARQUIVO="backup_$(date +%F_%H-%M-%S).tar.gz"

echo "Comprimindo..."
tar -czvf "$DEST/$ARQUIVO" "$TMP"

echo "Backup finalizado em $(date)"
```

---

# 8. Backup completo com log

```bash
LOG="/backups/backup.log"

tar -czvf "$DESTINATION/$ARQUIVO" "$SOURCE" >> "$LOG" 2>&1

echo "Backup concluído: $ARQUIVO" | tee -a "$LOG"
```

---

# 9. Tornando o script executável

```bash
chmod +x backup-compressao.sh
```

---

# 10. Executando

```bash
./backup-compressao.sh
```

---

# 11. Agendando backup automático com *cron*

```bash
crontab -e
```

Exemplo: executar todos os dias às 02h:

```bash
0 2 * * * /caminho/backup-compressao.sh
```

### Executar toda sexta-feira às 23h:

```bash
0 23 * * 5 /caminho/backup-compressao.sh
```

### Executar a cada 15 minutos:

```bash
*/15 * * * * /caminho/backup-compressao.sh
```

---

# 12. Verificando backups

```bash
ls -lh /backups
```

---

# 13. Descompactando um backup

### `.tar.gz`:

```bash
tar -xzvf backup.tar.gz
```

### `.tar.bz2`:

```bash
tar -xjvf backup.tar.bz2
```

### `.tar.xz`:

```bash
tar -xJvf backup.tar.xz
```

---

# Boas práticas

✔ Sempre use timestamp no nome do arquivo
✔ Use `tar -czvf` para backups diários simples
✔ Evite comprimir arquivos já comprimidos (`.zip`, `.mp4`, `.jpg`)
✔ Faça testes antes de automatizar
✔ Combine `rsync` + `tar` para backups inteligentes
✔ Armazene backups em disco separado ou servidor remoto

---

🎉 **Parabéns!**
Agora você sabe criar **backups completos com compressão**, usando desde o básico com `tar`, até versões eficientes com `rsync` e compressão final.

Outras opções:

* Um script de backup profissional com menu interativo
* Backup remoto automático via SSH
* Backup criptografado com GPG
* Backup incremental diário e semanal

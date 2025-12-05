Aqui está um **README completo e profissional**, explicando como implementar **retenção automática de backups antigos** em Shell Script.
Inclui exemplos simples, avançados, com compressão, e com políticas profissionais de retenção (7 dias, 30 dias, semanal, mensal, etc.).

---

# Retenção Automática de Backups Antigos

### Apagando automaticamente backups antigos com Shell Script

Quando você gera backups diariamente (ou várias vezes ao dia), eles começam a ocupar muito espaço.
Para evitar isso, é comum implementar **políticas de retenção**, como:

* manter apenas os últimos **7 dias**
* manter apenas **10 arquivos**
* apagar backups mais antigos que **30 dias**
* manter somente **o último backup semanal**
* manter **backups mensais indefinidamente**

Este guia explica como criar scripts que limpam backups antigos automaticamente.

---

# 1. Criando o arquivo do script

```bash
retencao-backups.sh
```

---

# 2. Exemplo simples — remover backups com mais de 7 dias

```bash
#!/bin/bash

BACKUP_DIR="/backups"

find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm -f {} \;

echo "Backups antigos removidos em $(date)"
```

### Explicação

* `-type f` → apenas arquivos
* `-name "*.tar.gz"` → corresponde aos arquivos de backup
* `-mtime +7` → arquivos modificados há mais de 7 dias
* `-exec rm -f {} \;` → apaga cada arquivo encontrado

---

# 3. Remover arquivos mais antigos mantendo somente os **10 mais recentes**

```bash
#!/bin/bash

BACKUP_DIR="/backups"

ls -tp "$BACKUP_DIR"/*.tar.gz | grep -v '/$' | tail -n +11 | xargs -I {} rm -- {}

echo "Retenção aplicada (mantendo apenas 10 backups)."
```

### Como funciona?

1. `ls -tp` → lista arquivos ordenados do mais recente ao mais antigo
2. `tail -n +11` → pula os 10 primeiros, mostrando o restante
3. `rm` → apaga os mais antigos

---

# 4. Apagar backups de mais de 30 dias e manter apenas os 5 mais recentes

```bash
#!/bin/bash

DIR="/backups"

# Apaga arquivos com mais de 30 dias
find "$DIR" -type f -name "*.tar.gz" -mtime +30 -delete

# Mantém somente os 5 mais recentes
ls -tp "$DIR"/*.tar.gz | tail -n +6 | xargs -r rm --

echo "Política de retenção aplicada com sucesso."
```

---

# 5. Retenção semanal (backup diário + backup semanal permanente)

```bash
#!/bin/bash

DIR="/backups"

# Remover backups diários mais velhos que 7 dias
find "$DIR"/daily -type f -name "*.tar.gz" -mtime +7 -delete

# Remover backups semanais mais velhos que 30 dias
find "$DIR"/weekly -type f -name "*.tar.gz" -mtime +30 -delete
```

---

# 6. Retenção mensal (manter backups mensais indefinidamente)

```bash
#!/bin/bash

DIR="/backups/monthly"

# Apaga mensais mais antigos que 365 dias
find "$DIR" -type f -name "*.tar.gz" -mtime +365 -delete
```

---

# 7. Retenção profissional usando `date` como critério

Criando e apagando por padrão de nome:

```
backup_2025-02-19_23-01.tar.gz
```

Removendo por data:

```bash
#!/bin/bash

DIR="/backups"

# Pega a data de 15 dias atrás
LIMITE=$(date -d "15 days ago" +%s)

for arquivo in "$DIR"/backup_*.tar.gz; do
    DATA_ARQUIVO=$(stat -c %Y "$arquivo")

    if [ "$DATA_ARQUIVO" -lt "$LIMITE" ]; then
        rm "$arquivo"
        echo "Removido: $arquivo"
    fi
done
```

---

# 8. Retenção avançada por tamanho total de backups

Quando o diretório atingir 10 GB, apagar arquivos antigos:

```bash
#!/bin/bash

DIR="/backups"
LIMITE=10000000   # 10 GB em KB

while [ $(du -sk "$DIR" | cut -f1) -gt $LIMITE ]; do
    ARQ=$(ls -tp "$DIR"/*.tar.gz | tail -n 1)
    echo "Apagando $ARQ"
    rm "$ARQ"
done
```

---

# 9. Tornando o script executável

```bash
chmod +x retencao-backups.sh
```

---

# 10. Agendando no cron para rodar todo dia às 01h

```bash
crontab -e
```

Adicionar:

```bash
0 1 * * * /caminho/retencao-backups.sh
```

---

# 11. Boas práticas

✔ Combine retenção diária, semanal e mensal
✔ Registre logs da limpeza
✔ Use nomes com data (`backup_YYYY-MM-DD`)
✔ Teste usando `echo` em vez de `rm` primeiro:

```bash
find "$DIR" -mtime +7 -print
```

✔ Nunca use `rm -rf "$DIR"` com variáveis vazias

---

# 12. Exemplo completo e profissional

### Retenção diária + semanal + mensal

```bash
#!/bin/bash

DIR="/backups"

# Limpa backups diários (mantém 7 dias)
find "$DIR"/daily -name "*.tar.gz" -mtime +7 -delete

# Limpa backups semanais (mantém 4 semanas)
find "$DIR"/weekly -name "*.tar.gz" -mtime +30 -delete

# Limpa backups mensais (mantém 12 meses)
find "$DIR"/monthly -name "*.tar.gz" -mtime +365 -delete

echo "Retenção executada em $(date)"
```

Organização recomendada:

```
/backups
   ├── daily
   ├── weekly
   └── monthly
```

---

🎉 **Parabéns!**
Agora você sabe criar sistemas de **retenção automática de backups**, desde o básico até técnicas profissionais usadas em servidores Linux.

Outras opções:

✅ Um script de **backup + compressão + retenção** tudo em um
✅ Um sistema de backup **com menu interativo**
✅ Backup automático para **S3, FTP ou servidor remoto via SSH**



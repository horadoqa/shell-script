Aqui está um **README completo, claro e profissional**, ensinando a criar um **backup remoto automático via SSH**, usando `rsync` ou `scp`, incluindo chave SSH sem senha, compressão opcional, logs e automação com *cron*.

---

# Backup Remoto Automático via SSH

### Sincronize arquivos entre máquinas de forma segura e automática

Este guia ensina como criar um sistema de backup que copia arquivos de uma máquina local para um servidor remoto utilizando **SSH**, de forma automática e segura.
Você aprenderá:

* Configurar chave SSH sem senha
* Fazer backup via `rsync` (recomendado)
* Fazer backup via `scp`
* Aplicar compressão
* Automatizar via *cron*
* Registrar logs

---

# 1. Pré-requisito: Acesso SSH ao servidor remoto

Você precisa ter acesso:

```bash
ssh usuario@servidor.com
```

Se isso funciona, você pode prosseguir.

---

# 2. Configurando chave SSH sem senha

### (para permitir backup automático no cron)

Execute:

```bash
ssh-keygen -t rsa -b 4096
```

Pressione ENTER para todas as opções.

Depois envie a chave pública para o servidor remoto:

```bash
ssh-copy-id usuario@servidor.com
```

Agora teste:

```bash
ssh usuario@servidor.com
```

Se logar sem pedir senha → OK.

---

# 3. Backup remoto com RSYNC (Método recomendado)

Crie o arquivo:

```bash
backup-remoto.sh
```

Conteúdo:

```bash
#!/bin/bash

SOURCE="/caminho/do/diretorio/local/"
REMOTE_USER="usuario"
REMOTE_HOST="servidor.com"
REMOTE_DIR="/caminho/do/backup/remoto"

rsync -avz --delete -e ssh "$SOURCE" "${REMOTE_USER}@${REMOTE_HOST}:$REMOTE_DIR"

echo "Backup remoto concluído em $(date)"
```

---

# 4. Explicando os parâmetros

| Parâmetro  | Função                                          |
| ---------- | ----------------------------------------------- |
| `-a`       | mantém permissões, datas e recursão             |
| `-v`       | mostra detalhes                                 |
| `-z`       | comprime durante o envio                        |
| `--delete` | apaga no servidor arquivos removidos localmente |
| `-e ssh`   | define que a transferência é via SSH            |

---

# 5. Backup remoto com compressão antes de enviar (TAR + RSYNC)

```bash
#!/bin/bash

SOURCE="/projetos"
ARQUIVO="backup_$(date +%F_%H-%M).tar.gz"

tar -czf "/tmp/$ARQUIVO" "$SOURCE"

scp "/tmp/$ARQUIVO" usuario@servidor.com:/backups/

rm "/tmp/$ARQUIVO"

echo "Backup comprimido enviado em $(date)"
```

---

# 6. Backup remoto usando SCP (alternativa simples)

```bash
#!/bin/bash

scp -r /diretorio/local usuario@servidor.com:/backups/
```

Use `scp` apenas para transferências simples.
Para backups, `rsync` é sempre melhor.

---

# 7. Criando logs do backup

```bash
LOG="/var/log/backup-remoto.log"

rsync -avz -e ssh "$SOURCE" "${REMOTE_USER}@${REMOTE_HOST}:$REMOTE_DIR" \
    >> "$LOG" 2>&1

echo "$(date) - Backup finalizado" >> "$LOG"
```

---

# 8. Tornando o script executável

```bash
chmod +x backup-remoto.sh
```

---

# 9. Testando o backup manualmente

```bash
./backup-remoto.sh
```

---

# 10. Automatizando com CRON

Abra o cron:

```bash
crontab -e
```

### Executar todo dia às 02h da manhã

```bash
0 2 * * * /caminho/backup-remoto.sh
```

### Executar a cada 6 horas

```bash
0 */6 * * * /caminho/backup-remoto.sh
```

### Executar a cada 15 minutos

```bash
*/15 * * * * /caminho/backup-remoto.sh
```

---

# 11. Verificando backups no servidor remoto

No servidor:

```bash
ls -lh /caminho/do/backup/remoto
```

---

# 12. Boas práticas recomendadas

✔ **Use rsync, não scp**, sempre que possível
✔ Habilite backup automático sem senha com chave SSH
✔ Separe backups por data:

```bash
REMOTE_DIR="/backups/$(date +%Y-%m-%d)"
```

✔ Salve logs de execução
✔ Coloque os backups em disco separado do servidor
✔ Sempre teste manualmente antes de colocar no cron

---

# 13. Exemplo profissional completo (com data + log + compressão + limpeza)

```bash
#!/bin/bash

SOURCE="/home/user/projetos"
ARQ="backup_$(date +%F_%H-%M-%S).tar.gz"
TMP="/tmp/$ARQ"

REMOTE_USER="usuario"
REMOTE_HOST="servidor.com"
REMOTE_DIR="/backups/remotos"
LOG="/var/log/backup-remoto.log"

# 1. Compacta
tar -czf "$TMP" "$SOURCE"

# 2. Envia ao servidor remoto
scp "$TMP" "${REMOTE_USER}@${REMOTE_HOST}:$REMOTE_DIR" >> "$LOG" 2>&1

# 3. Apaga arquivo temporário
rm "$TMP"

echo "$(date) - Backup remoto finalizado ($ARQ)" | tee -a "$LOG"
```

---

🎉 **Parabéns!**
Agora você sabe criar **backups remotos automáticos via SSH**, incluindo:

* transferência com rsync
* compressão opcional
* envio com scp
* logs
* execução automatizada com cron
* chave SSH sem senha

Outras opções:

🔹 **Backup remoto + retenção automática**
🔹 **Backup remoto criptografado com GPG**
🔹 **Backup remoto incremental**
🔹 **Menu interativo de backup (TUI)**

---
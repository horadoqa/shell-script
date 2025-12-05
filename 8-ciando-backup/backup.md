# Copiando Arquivos e Diretórios no Shell Script

### Criando um script de backup simples com `cp -r`

Este guia explica como copiar arquivos e diretórios usando Shell Script, criar scripts de backup, torná-los executáveis e até agendar execuções automáticas com o *cron*.

---

## 1. Criando o arquivo do script

Vamos criar um arquivo chamado:

```bash
backup.sh
```

---

## 2. Escrevendo o script de backup

Aqui está um exemplo básico para copiar um diretório inteiro para outro local:

```bash
#!/bin/bash

SOURCE="caminho do diretório original"
DESTINATION="caminho onde ficará o diretório"

cp -r "$SOURCE" "$DESTINATION"

echo "Backup concluído em $(date)"
```

---

## 3. Entendendo os comandos usados

### 📌 `cp`

O comando `cp` copia arquivos ou diretórios.

| Comando                   | Função                                        |
| ------------------------- | --------------------------------------------- |
| `cp arquivo destino`      | copia arquivos                                |
| `cp -r diretorio destino` | copia diretórios de forma recursiva           |
| `cp -v`                   | mostra arquivos copiados                      |
| `cp -u`                   | só copia se o arquivo de origem for mais novo |
| `cp -a`                   | preserva permissões, datas e atributos        |

No script usamos:

```bash
cp -r "$SOURCE" "$DESTINATION"
```

* `-r` → copia diretórios recursivamente
* `"$SOURCE"` → origem
* `"$DESTINATION"` → destino

---

## 4. Exemplos de uso

### 🔹 Copiar um único arquivo

```bash
cp arquivo.txt /home/user/backup/
```

### 🔹 Copiar todos os arquivos de um diretório

```bash
cp /home/user/documentos/* /home/user/backup/
```

### 🔹 Copiar diretório inteiro

```bash
cp -r /home/user/projetos /home/user/backup/
```

### 🔹 Copiar preservando permissões e datas

```bash
cp -a /etc /home/user/backup/
```

---

## 5. Tornando o arquivo executável

Antes de rodar o script, dê permissão:

```bash
chmod +x backup.sh
```

---

## 6. Executando o backup manualmente

```bash
./backup.sh
```

Se tudo estiver correto, você verá algo como:

```
Backup concluído em Wed Feb 19 14:35:12 UTC 2025
```

---

## 7. Agendando o backup automaticamente com *cron*

Abra o editor do cron:

```bash
crontab -e
```

E adicione a linha:

```bash
02 * * * * /caminho/para/backup.sh
```

Esta linha significa:

| Campo         | Valor | Significado       |
| ------------- | ----- | ----------------- |
| Minuto        | `02`  | Rodar no minuto 2 |
| Hora          | `*`   | Qualquer hora     |
| Dia do mês    | `*`   | Todos             |
| Mês           | `*`   | Todos             |
| Dia da semana | `*`   | Todos             |

Ou seja: **o script será executado todo dia, toda hora, no minuto 02**.

### Outro exemplo — Executar todos os dias às 23h:

```bash
0 23 * * * /caminho/para/backup.sh
```

---

## 8. Verificando se o cron está funcionando

Liste suas tarefas agendadas:

```bash
crontab -l
```

Verifique logs:

```bash
grep CRON /var/log/syslog
```

---

## 9. Boas práticas

* Sempre use **aspas** nas variáveis de caminho (`"$SOURCE"`).
* Use `cp -a` quando quiser preservar permissões e datas.
* Armazene backups com timestamp:

```bash
DESTINATION="backup_$(date +%Y-%m-%d_%H-%M-%S)"
```

* Teste manualmente antes de agendar no cron.

---

🎉 **Parabéns!**
Você aprendeu a copiar arquivos e diretórios via Shell Script, criar um sistema simples de backup e agendá-lo automaticamente com o *cron*.

---
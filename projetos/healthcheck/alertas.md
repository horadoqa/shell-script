Perfeito! Vamos criar um **README completo** explicando como adicionar **alertas automáticos por e-mail e Telegram** a um script de monitoramento com `curl`. Vou incluir exemplos práticos, configuração e boas práticas.

---

# Monitoramento de Endpoint com Alertas por E-mail ou Telegram

Este guia mostra como criar um **monitoramento contínuo de um serviço** usando Shell Script, com **alertas automáticos** sempre que o serviço estiver fora do ar.

Exemplo de serviço:

```
https://horadoqa.com.br/healthcheck
```

---

## 1. Pré-requisitos

* **cURL** instalado (`sudo apt install curl`)
* **sendmail** ou **mailx** para envio de e-mail
* Conta no **Telegram** e um **bot** criado para receber alertas
* Token do bot e chat_id do usuário ou grupo

---

## 2. Criando o bot no Telegram

1. Abra o Telegram e inicie conversa com [BotFather](https://t.me/BotFather).
2. Crie um novo bot: `/newbot`
3. Copie o **token** gerado.
4. Obtenha o `chat_id` do usuário ou grupo usando:

```bash
curl -s "https://api.telegram.org/bot<SEU_TOKEN>/getUpdates"
```

---

## 3. Script de monitoramento com alerta

Crie o arquivo:

```bash
monitor-alerta.sh
```

Conteúdo:

```bash
#!/bin/bash

URL="https://horadoqa.com.br/healthcheck"
EMAIL="seuemail@dominio.com"
TELEGRAM_TOKEN="SEU_TOKEN"
TELEGRAM_CHAT_ID="SEU_CHAT_ID"

while true; do
    DATA=$(date +"%Y-%m-%d %H:%M:%S")
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)

    if [ "$STATUS" -eq 200 ]; then
        echo "[$DATA] Serviço OK ($STATUS)"
    else
        echo "[$DATA] Serviço com problema ($STATUS)!" | tee -a monitor.log

        # Alerta por e-mail
        echo "Serviço $URL com problema! Código: $STATUS" | mail -s "ALERTA: Serviço fora do ar" $EMAIL

        # Alerta por Telegram
        curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage" \
            -d chat_id="$TELEGRAM_CHAT_ID" \
            -d text="[$DATA] ALERTA: Serviço $URL fora do ar! Código HTTP: $STATUS"
    fi

    sleep 10
done
```

---

## 4. Explicação

| Item                                     | Função                                      |
| ---------------------------------------- | ------------------------------------------- |
| `curl -s -o /dev/null -w "%{http_code}"` | captura apenas o código HTTP da resposta    |
| `mail -s "..." $EMAIL`                   | envia alerta por e-mail                     |
| `curl -X POST ...`                       | envia mensagem via Telegram Bot API         |
| `sleep 10`                               | intervalo de 10 segundos entre verificações |

---

## 5. Tornando o script executável

```bash
chmod +x monitor-alerta.sh
```

---

## 6. Executando o script

```bash
./monitor-alerta.sh
```

* Mensagens de alerta serão enviadas automaticamente quando o serviço estiver fora do ar.
* Logs são gravados em `monitor.log`.

---

## 7. Automatizando em segundo plano

### Com `nohup`:

```bash
nohup ./monitor-alerta.sh > monitor.log 2>&1 &
```

* Permite que o script continue rodando mesmo após fechar o terminal.

### Verificando processos:

```bash
ps aux | grep monitor-alerta.sh
```

### Parando o processo:

```bash
kill <PID>
```

---

## 8. Boas práticas

* Ajuste o intervalo (`sleep`) para evitar spam de alertas.
* Crie filtros para alertas repetidos, evitando múltiplos e-mails/Telegram para o mesmo problema.
* Mantenha logs para histórico de falhas.
* Teste o envio de e-mails e Telegram antes de usar em produção.

---

🎉 **Pronto!**

Agora você tem um **monitoramento completo com alertas automáticos** por e-mail e Telegram, capaz de detectar falhas rapidamente e avisar imediatamente.

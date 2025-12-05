Perfeito! Aqui está um **README completo e didático** explicando como criar um **monitoramento contínuo de um endpoint com `curl` usando Shell Script**, registrar logs e até destacar respostas com cores.

---

# Monitoramento Contínuo de Endpoint com Shell Script

Este guia ensina a criar um script que realiza **requisições periódicas** a um endpoint HTTP usando `curl`, registra logs e destaca o status da resposta.

Exemplo de uso: monitorar o endpoint de saúde de um serviço:

```
https://horadoqa.com.br/healthcheck
```

---

## 1. Criando o arquivo do script

Crie um arquivo chamado:

```bash
monitor-health.sh
```

---

## 2. Script básico — requisição a cada 10 segundos

```bash
#!/bin/bash

URL="https://horadoqa.com.br/healthcheck"

while true; do
    echo "Realizando healthcheck em $URL..."
    curl -s $URL
    echo -e "\nAguardando 10 segundos para a próxima verificação..."
    sleep 10
done
```

### Explicação:

* `while true; do` → loop infinito
* `curl -s` → faz requisição silenciosa (sem barra de progresso)
* `sleep 10` → aguarda 10 segundos entre requisições

---

## 3. Script com LOG

Para registrar cada verificação:

```bash
#!/bin/bash

URL="https://horadoqa.com.br/healthcheck"
LOG="health.log"

while true; do
    DATA=$(date +"%Y-%m-%d %H:%M:%S")
    RESPOSTA=$(curl -s $URL)

    echo "[$DATA] $RESPOSTA" | tee -a $LOG
    sleep 10
done
```

* `tee -a $LOG` → grava no arquivo **e** mostra na tela
* Cada linha é prefixada com data e hora

---

## 4. Script com destaque de status usando cores

```bash
#!/bin/bash

URL="https://horadoqa.com.br/healthcheck"

while true; do
    DATA=$(date +"%Y-%m-%d %H:%M:%S")
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)

    if [ "$STATUS" -eq 200 ]; then
        echo -e "[$DATA] \e[32mServiço OK ($STATUS)\e[0m"
    else
        echo -e "[$DATA] \e[31mServiço com problema ($STATUS)\e[0m"
    fi

    sleep 10
done
```

* `-o /dev/null` → descarta o corpo da resposta
* `-w "%{http_code}"` → captura apenas o código HTTP
* `\e[32m` → verde para OK
* `\e[31m` → vermelho para erro

---

## 5. Tornando o script executável

```bash
chmod +x monitor-health.sh
```

---

## 6. Executando o script

```bash
./monitor-health.sh
```

---

## 7. Automatizando execução em segundo plano

### Usando `nohup`:

```bash
nohup ./monitor-health.sh > monitor.log 2>&1 &
```

* Executa o script mesmo se fechar o terminal
* Saída e erros vão para `monitor.log`

### Verificando o processo:

```bash
ps aux | grep monitor-health.sh
```

### Parando o processo:

```bash
kill <PID>
```

---

## 8. Boas práticas

✔ Use logs para manter histórico
✔ Utilize cores para facilitar identificação de erros
✔ Ajuste o intervalo (`sleep`) conforme necessidade
✔ Teste a URL antes de automatizar

---

🎉 **Parabéns!**
Você agora tem um **monitoramento contínuo de serviços com Shell Script**, incluindo logs, cores e execução automática.

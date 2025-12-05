# Capturando valores pelo console e usando variáveis em Shell Script

Agora que você já aprendeu a criar variáveis e usar valores internos do sistema, vamos avançar mais um passo: **capturar informações diretamente do usuário** via console.

Isso deixa seus scripts interativos e muito mais úteis.

---

## 1. Crie um novo arquivo

Vamos criar um arquivo chamado:

```bash
dados-usuario.sh
```

---

## 2. Adicione o seguinte código

```bash
#!/bin/bash

# Capturando valores digitados pelo usuário
read -p "Digite seu nome: " nome
read -p "Digite sua idade: " idade
read -p "Digite uma mensagem personalizada: " mensagem

# Exibindo todas as informações em uma única linha formatada
echo -e "\n--- Dados Informados ---"
echo -e "Nome: $nome\nIdade: $idade\nNúmero da sua inscrição: $RANDOM\nMensagem: $mensagem"
```

---

## 3. Entendendo os comandos usados

### 📌 `read`

O comando **read** permite capturar o que o usuário digita no teclado.

Exemplo:

```bash
read -p "Texto para exibir: " variavel
```

* `-p` exibe a mensagem antes da leitura.
* O valor digitado é armazenado na variável.

### 📌 `$RANDOM`

Variável interna do Bash que gera um número aleatório entre **0 e 32767**.

---

## 4. Dê permissão de execução

```bash
chmod +x dados-usuario.sh
```

---

## 5. Execute o script

```bash
./dados-usuario.sh
```

Você verá solicitações como:

```
Digite seu nome:
Digite sua idade:
Digite uma mensagem personalizada:
```

---

## 6. Resultado final

Após informar tudo, o terminal exibirá algo assim:

```
--- Dados Informados ---
Nome: João
Idade: 30
Número da sua inscrição: 14532
Mensagem: Olá, Shell Script!
```

---

🎉 **Parabéns!**

Agora você aprendeu a:

* Criar variáveis
* Capturar valores via console
* Usar variáveis internas como `$RANDOM`
* Exibir tudo de forma organizada em uma única linha

O próximo passo pode ser aprender sobre **condições (`if`)**, **loops (`for`, `while`)**, **funções**, ou até construir **um menu interativo** — basta pedir!

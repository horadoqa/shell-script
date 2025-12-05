# Aprendendo a criar e usar variáveis em Shell Script

Agora que você já criou seu primeiro script, vamos avançar mais um passo e aprender a trabalhar com **variáveis**, um dos conceitos mais importantes em qualquer linguagem de programação.

## 1. O que são variáveis?

Variáveis são espaços na memória usados para armazenar valores.
No Shell Script, elas podem guardar textos, números, resultados de comandos e muito mais.

## 2. Criando seu arquivo de exemplo

Crie um novo arquivo chamado:

```bash
variaveis.sh
```

## 3. Escreva o seguinte código

```bash
#!/bin/bash

# Criando variáveis
nome="Maria"
idade=25
mensagem="Bem-vindo ao Shell Script!"

# Exibindo os valores
echo "Nome: $nome"
echo "Idade: $idade"
echo "Mensagem: $mensagem"
```

---

### 📌 Observações importantes sobre variáveis no Bash

* **Não use espaços antes ou depois do sinal de igual (`=`)**
  ❌ `nome = Maria`
  ✔️ `nome="Maria"`

* Para acessar o valor da variável, use o cifrão:
  ✔️ `$nome`

* Strings podem ser escritas com ou sem aspas, mas recomendam-se aspas para evitar erros.

---

## 4. Dê permissão de execução

```bash
chmod +x variaveis.sh
```

## 5. Execute o arquivo

```bash
./variaveis.sh
```

## 6. Resultado

Você deverá ver no terminal algo como:

```
Nome: Maria
Idade: 25
Mensagem: Bem-vindo ao Shell Script!
```

---
Você também pode imprimir tudo em **uma única linha**:

```bash
echo -e "Nome: $nome, Idade: $idade, Número da sua inscrição: $RANDOM,  Mensagem: $mensagem"
```

E também pode imprimir tudo em **uma única linha**, usando um único `echo` com quebras de linha `\n`:

```bash
echo -e "Nome: $nome\nIdade: $idade\nNúmero da sua inscrição: $RANDOM\nMensagem: $mensagem"
```

---

# Variáveis criadas pelo usuário x variáveis do sistema

Além das variáveis que você cria, o sistema também possui variáveis internas, como:

```bash
$USER     # Nome do usuário
$HOME     # Diretório pessoal
$SHELL    # Shell padrão
$RANDOM   # Gera um número aleatório toda vez que é acessada
```

Você pode exibir qualquer uma delas com `echo`, exemplo:

```bash
echo "Usuário atual: $USER"
```

```bash
echo "Número escolhido foi: $RANDOM"
```

---

### 📌 Observação

O parâmetro `-e` habilita a interpretação de caracteres especiais como `\n`.

Se quiser, posso criar uma versão ainda mais estilizada ou formatada.

---

🎉 **Parabéns novamente!**

Agora você sabe como **criar, atribuir e exibir variáveis** em Shell Script.
Esse conhecimento é fundamental para automatizar tarefas, criar menus, processar dados e muito mais.

O próximo passo pode ser aprender sobre **leitura de entrada**, **condições**, **loops** ou **funções** — basta pedir que eu crie a próxima parte!

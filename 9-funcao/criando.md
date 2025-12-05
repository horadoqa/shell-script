# Funções em Shell Script

Funções em Shell Script permitem **organizar código**, **evitar repetição** e tornar scripts mais legíveis e reutilizáveis.

---

## 1. Sintaxe básica

```bash
nome_da_funcao() {
    # comandos da função
}
```

Ou alternativamente:

```bash
function nome_da_funcao {
    # comandos da função
}
```

* Não é obrigatório declarar parâmetros, mas você pode passar argumentos.
* As funções devem ser definidas **antes de serem chamadas** no script.

---

## 2. Exemplo simples

```bash
#!/bin/bash

# Definindo a função
cumprimentar() {
    echo "Olá! Seja bem-vindo(a)!"
}

# Chamando a função
cumprimentar
```

**Resultado:**

```
Olá! Seja bem-vindo(a)!
```

---

## 3. Função com parâmetros

Você pode passar argumentos para a função, que são acessados como `$1`, `$2`, etc.

```bash
#!/bin/bash

saudar() {
    local nome=$1
    local idade=$2
    echo "Olá $nome, você tem $idade anos."
}

# Chamando a função com argumentos
saudar "Alice" 25
saudar "Bob" 30
```

**Resultado:**

```
Olá Alice, você tem 25 anos.
Olá Bob, você tem 30 anos.
```

---

## 4. Função que retorna valor

Funções podem retornar um **código de status** (0 a 255) usando `return` ou imprimir algo para ser capturado.

```bash
#!/bin/bash

somar() {
    local a=$1
    local b=$2
    local total=$((a + b))
    echo $total  # Retorna via stdout
}

resultado=$(somar 5 7)
echo "O resultado da soma é $resultado"
```

**Resultado:**

```
O resultado da soma é 12
```

> Observação: `return` só retorna um código de status, usado principalmente para verificar sucesso/falha (0 = sucesso).

---

## 5. Função com verificação de erro

```bash
#!/bin/bash

verificar_diretorio() {
    local dir=$1
    if [ -d "$dir" ]; then
        echo "O diretório $dir existe."
        return 0
    else
        echo "O diretório $dir não existe."
        return 1
    fi
}

verificar_diretorio "/tmp"
verificar_diretorio "/nao_existe"
```

**Resultado:**

```
O diretório /tmp existe.
O diretório /nao_existe não existe.
```

---

## 6. Função com valor padrão para parâmetro

```bash
#!/bin/bash

saudar() {
    local nome=${1:-Visitante}  # Se não passar parâmetro, usa "Visitante"
    echo "Olá, $nome!"
}

saudar "Alice"
saudar
```

**Resultado:**

```
Olá, Alice!
Olá, Visitante!
```

---

## 7. Boas práticas

* Use `local` para variáveis dentro da função, evitando sobrescrever variáveis globais.
* Sempre defina funções **antes de chamá-las**.
* Use nomes de função claros e significativos.
* Para funções complexas, documente parâmetros e saída.

---

🎉 **Pronto!**

Agora você sabe:

* Criar funções simples e com parâmetros
* Retornar valores
* Usar funções para organizar scripts e reutilizar código

---


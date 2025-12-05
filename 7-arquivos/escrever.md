# Manipulação de Arquivos em Shell Script

### Criar, escrever, sobrescrever e adicionar conteúdo

Neste guia você aprenderá a:

* Criar arquivos usando Shell Script
* Escrever textos em arquivos
* Sobrescrever conteúdo existente
* Apendar (adicionar) linhas sem apagar o conteúdo anterior
* Usar redirecionadores (`>`, `>>`) e `echo`, `printf` e here-documents

---

## 1. Criando um novo arquivo

A forma mais simples de criar um arquivo é usando **redirecionamento vazio**:

```bash
> arquivo.txt
```

Isso cria um arquivo chamado `arquivo.txt` (ou limpa caso já exista).

Ou usando `touch`:

```bash
touch arquivo.txt
```

---

## 2. Escrevendo em um arquivo (sobrescrever)

Use o operador `>` para **sobrescrever** o conteúdo do arquivo:

```bash
echo "Primeira linha do arquivo" > arquivo.txt
```

Se o arquivo não existir, ele será criado automaticamente.

### Exemplo:

```bash
#!/bin/bash

echo "Criando arquivo com conteúdo inicial..."
echo "Linha 1" > arquivo.txt
```

Após executar, `arquivo.txt` terá:

```
Linha 1
```

---

## 3. Apendar conteúdo (adicionar sem apagar)

Use `>>` para **adicionar** conteúdo ao final do arquivo sem apagar o que já existe.

```bash
echo "Nova linha" >> arquivo.txt
```

### Exemplo:

```bash
echo "Linha 2" >> arquivo.txt
echo "Linha 3" >> arquivo.txt
```

Agora o arquivo terá:

```
Linha 1
Linha 2
Linha 3
```

---

## 4. Usando `printf` para escrever no arquivo

`printf` permite maior controle sobre formatação:

```bash
printf "Nome: %s\nIdade: %d\n" "Maria" 25 > dados.txt
```

Ou apendando:

```bash
printf "Cidade: %s\n" "São Paulo" >> dados.txt
```

---

## 5. Escrevendo várias linhas com **Here Document**

O Here-Doc permite escrever blocos grandes dentro de arquivos.

### 📌 Sobrescrever arquivo:

```bash
cat <<EOF > texto.txt
Linha 1
Linha 2
Linha 3
EOF
```

### 📌 Apendar no arquivo:

```bash
cat <<EOF >> texto.txt
Nova linha adicionada.
Outra linha.
EOF
```

---

## 6. Criando arquivo via script com input do usuário

```bash
#!/bin/bash

read -p "Digite o nome do arquivo: " arq
read -p "Digite um texto: " texto

echo "$texto" > "$arq"

echo "Arquivo $arq criado com sucesso!"
```

---

## 7. Apendando interativamente

```bash
#!/bin/bash

read -p "Arquivo para alterar: " arq
read -p "Digite o texto que deseja adicionar: " texto

echo "$texto" >> "$arq"

echo "Conteúdo adicionado!"
```

---

## 8. Exemplo completo — Criar, sobrescrever e apendar

```bash
#!/bin/bash

echo "Criando arquivo..."
echo "Conteúdo inicial" > exemplo.txt

echo "Apendando conteúdo..."
echo "Linha adicionada 1" >> exemplo.txt
echo "Linha adicionada 2" >> exemplo.txt

echo "Arquivo final:"
cat exemplo.txt
```

---

## 9. Permissão de execução

```bash
chmod +x escrever-arquivos.sh
```

---

## 10. Executando

```bash
./escrever-arquivos.sh
```

---

## 📌 Resumo dos operadores

| Operador | Ação                             |
| -------- | -------------------------------- |
| `>`      | cria ou **sobrescreve** arquivo  |
| `>>`     | cria ou **apenda** ao arquivo    |
| `<`      | usa arquivo como entrada         |
| `<<EOF`  | here-document (múltiplas linhas) |

---

🎉 **Parabéns!**
Agora você sabe como criar, escrever, sobrescrever e apendar arquivos no Shell Script — habilidades essenciais para automação, logs e geração de relatórios.


# Criando o primeiro arquivo em Shell Script

Este guia mostra, passo a passo, como criar e executar seu primeiro arquivo em Shell Script.

## 1. Escolha um editor de texto

Você pode usar qualquer editor, como:

- **Vim** - 
- **Nano**, 
- **Visual Studio Code**, 
- **Sublime Text**, 
- entre outros.

## 2. Escreva seu primeiro código

Crie um novo arquivo, no vscode, no windows use (crtl + n) e adicione o seguinte conteúdo:

```bash
#!/bin/bash

echo "Hello World !!!"
```

---

### 📌 Observação

A linha inicial:

```bash
#!/bin/bash
```

é chamada de **shebang**.
Ela indica ao sistema **qual interpretador** deve ser usado para executar o script.

No caso acima, o script será executado pelo **Bash**.
Você poderia usar outros shells, por exemplo:

```bash
#!/bin/sh
#!/bin/zsh
#!/usr/bin/env bash
#!/usr/bin/env python3
```

---

## 3. Salve o arquivo com a extensão `.sh`

Exemplo de nome:

```bash
hello-world.sh
```

## 4. Dê permissão de execução ao arquivo

Execute o seguinte comando para torná-lo executável:

```bash
chmod +x hello-world.sh
```

## 5. Execute o arquivo

```bash
./hello-world.sh
```

## 6. Resultado

Ao executar, você verá a mensagem:

```
Hello World !!!
```

---

🎉 Parabéns!

Você acabou de criar e executar seu primeiro programa em Shell Script.

A partir daqui, o céu é o limite — explore, experimente e continue aprendendo!
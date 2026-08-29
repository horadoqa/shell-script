# 🧭 Navegação na linha

| Atalho     | Ação                         |
| ---------- | ---------------------------- |
| `Ctrl + A` | Início da linha              |
| `Ctrl + E` | Fim da linha                 |
| `Ctrl + B` | Move 1 caractere para trás   |
| `Ctrl + F` | Move 1 caractere para frente |
| `Alt + B`  | Move 1 palavra para trás     |
| `Alt + F`  | Move 1 palavra para frente   |
| `Ctrl + ←` | Move 1 palavra para trás*    |
| `Ctrl + →` | Move 1 palavra para frente*  |

## Apagar / editar

| Atalho     | Ação                                        |
| ---------- | ------------------------------------------- |
| `Ctrl + H` | Apaga o caractere anterior (Backspace)      |
| `Ctrl + D` | Apaga o caractere sob o cursor              |
| `Ctrl + W` | Apaga a palavra anterior                    |
| `Alt + D`  | Apaga a próxima palavra                     |
| `Ctrl + U` | Apaga do cursor até o **início** da linha   |
| `Ctrl + K` | Apaga do cursor até o **fim** da linha      |
| `Ctrl + Y` | Cola (yank) o último texto apagado          |
| `Alt + Y`  | Alterna entre textos apagados anteriormente |

## Histórico

| Atalho     | Ação                               |
| ---------- | ---------------------------------- |
| `Ctrl + P` | Comando anterior                   |
| `Ctrl + N` | Próximo comando                    |
| `Ctrl + R` | Pesquisa reversa no histórico      |
| `Ctrl + S` | Pesquisa para frente no histórico* |
| `Ctrl + G` | Cancela a pesquisa do histórico    |
| `Alt + <`  | Primeiro comando do histórico      |
| `Alt + >`  | Último comando do histórico        |

## Controle do terminal/comando

| Atalho     | Ação                                        |
| ---------- | ------------------------------------------- |
| `Ctrl + C` | Interrompe o comando/processo atual         |
| `Ctrl + D` | EOF / sai do shell se a linha estiver vazia |
| `Ctrl + Z` | Suspende o processo atual                   |
| `Ctrl + L` | Limpa a tela                                |
| `Ctrl + S` | Pausa a saída do terminal                   |
| `Ctrl + Q` | Retoma a saída do terminal                  |
| `Ctrl + \` | Envia `SIGQUIT` ao processo                 |

## Manipulação do comando

| Atalho      | Ação                                          |
| ----------- | --------------------------------------------- |
| `Ctrl + T`  | Troca o caractere atual com o anterior        |
| `Alt + T`   | Troca a palavra atual com a anterior          |
| `Alt + U`   | Converte palavra para MAIÚSCULAS              |
| `Alt + L`   | Converte palavra para minúsculas              |
| `Alt + C`   | Capitaliza a palavra                          |
| `Ctrl + XX` | Alterna entre posição atual e início da linha |

## Os que mais valem decorar

Se você usa terminal bastante, eu priorizaria estes:

```text
Ctrl+A    início da linha
Ctrl+E    fim da linha

Alt+B     palavra para trás
Alt+F     palavra para frente

Ctrl+U    apaga até o início
Ctrl+K    apaga até o fim
Ctrl+W    apaga palavra anterior

Ctrl+Y    cola o que foi apagado

Ctrl+R    pesquisa no histórico
Ctrl+L    limpa a tela

Ctrl+C    interrompe comando
Ctrl+Z    suspende processo
Ctrl+D    EOF / sair
```

**Macete para memorizar:** `A` = **Ahead/início**, `E` = **End**, `B` = **Back**, `F` = **Forward**, `K` = **Kill até o fim**, `U` = **Kill para cima/início**.

* `Ctrl+←/→` depende do terminal/configuração; `Alt+B/F` é a forma mais tradicional do Readline.

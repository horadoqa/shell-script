Segue uma versão mais organizada, profissional e pronta para repositório (GitHub/GitLab):

---

# 📊 Monitor de Recursos Linux

Script em **Shell Script (Bash)** para monitoramento de recursos do servidor em tempo real via terminal.

Compatível com:

* Ubuntu 20.04+
* Ubuntu 22.04+
* Oracle Linux 7/8/9
* RHEL / CentOS / Rocky / Alma

---

## 🔎 Recursos Monitorados

O script coleta e exibe:

* 🧠 CPU (% idle)
* 💾 Memória disponível (% livre real - MemAvailable)
* 📈 Load Average (1 min)
* 🌐 Conexões TCP em uso
* 📝 Log detalhado em arquivo
* 📊 Cálculo automático de médias ao final da execução

---

## 🐧 Verificando a Versão do Linux

Antes de executar, confirme sua distribuição:

```bash
cat /etc/os-release
```

Exemplo (Ubuntu 22.04):

```
PRETTY_NAME="Ubuntu 22.04.5 LTS"
VERSION="22.04.5 LTS (Jammy Jellyfish)"
ID=ubuntu
```

---

## 🚀 Tornando o Script Executável

Para Ubuntu:

```bash
chmod +x ubuntu.sh
```

Para Oracle Linux:

```bash
chmod +x oracle.sh
```

---

## ▶️ Executando

Sintaxe:

```bash
./ubuntu.sh <tempo_total_segundos> <intervalo_coleta_segundos>
```

Exemplo:

```bash
./ubuntu.sh 30 3
```

Isso significa:

* Executar por 30 segundos
* Coletar métricas a cada 3 segundos

---

## 🖥 Exemplo de Saída

```
==================== SYSTEM MONITOR ====================
Timestamp           |  CPU idle% |  Mem free% |    LoadAvg |    TCP
--------------------------------------------------------------------
2026/02/14 08:55:45 |         95 |         21 |       0.43 |     27

Tempo decorrido: 24 / 30 segundos
Arquivo log: /tmp/resultado_DESKTOP-059018K_20260214_085518.txt

==================== MÉDIAS ====================
CPU idle média : 95.57 %
Mem free média : 21.00 %
LoadAvg média  : 0.44
TCP média      : 27
===============================================
```

---

## 📁 Arquivo de Log Gerado

Durante a execução, um arquivo é criado em `/tmp` contendo os dados brutos em formato CSV:

```bash
cat /tmp/resultado_DESKTOP-059018K_20260214_085518.txt
```

Exemplo:

```
2026/02/14 08:55:19,97,21,0.35,27
2026/02/14 08:55:23,98,21,0.35,27
2026/02/14 08:55:27,99,21,0.56,27
2026/02/14 08:55:31,95,21,0.51,27
2026/02/14 08:55:35,90,21,0.47,27
2026/02/14 08:55:39,95,21,0.43,27
2026/02/14 08:55:45,95,21,0.43,27
```

Formato:

```
timestamp,cpu_idle,mem_free,loadavg,tcp
```

Esse arquivo pode ser importado em:

* Excel
* LibreOffice Calc
* Grafana
* Scripts Python
* Ferramentas de análise

---

## 🎨 Recursos Visuais

* Atualização em tempo real
* Colunas alinhadas
* Cores indicativas:

  * 🟢 Verde = Normal
  * 🟡 Amarelo = Atenção
  * 🔴 Vermelho = Crítico
* Exibição do kernel em execução
* Dashboard estilo NOC

---

## 🛠 Dependências

O script utiliza apenas ferramentas padrão do Linux:

* bash
* awk
* grep
* /proc filesystem

Nenhuma instalação adicional é necessária na maioria das distribuições.

---

## 📌 Observações

* A memória é calculada usando `MemAvailable` (métrica real disponível).
* CPU é calculada via `/proc/stat`.
* Compatível com kernels padrão e UEK (Oracle Linux).

---

## 📄 Licença

Uso livre para ambientes de estudo, laboratório e produção interna.

---

Próximos passos:

* 📦 Versão com instalador (`install.sh`)
* 🐳 Versão Docker
* 📊 Versão exportando para Prometheus
* 🏢 Versão corporativa com mais métricas (swap, disco, I/O, processos top)

Quer evoluir o projeto? 😎

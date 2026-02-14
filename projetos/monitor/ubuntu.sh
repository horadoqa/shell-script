#!/bin/bash

###################################
## MONITOR DASHBOARD MODE UBUNTU ##
###################################

if [ $# -ne 2 ]; then
  echo "Uso: ./ubuntu.sh <tempo_total_segundos> <intervalo_segundos>"
  exit 1
fi

total_time=$1
interval=$2

start_time=$(date +%s)

# Arquivos
result=/tmp/resultado_"$HOSTNAME"_$(date +%Y%m%d_%H%M%S).txt

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

while true
do
    now=$(date +%s)
    elapsed=$((now - start_time))

    if [ $elapsed -ge $total_time ]; then
        break
    fi

    # Coletas
    vms=$(vmstat 1 2 | tail -n 1)
    idlecpu=$(echo $vms | awk '{print $15}')
    memory=$(awk '/MemTotal/ {t=$2} /MemAvailable/ {a=$2} END {printf("%.0f", a*100/t)}' /proc/meminfo)
    loadavg=$(awk '{printf("%.2f", $1)}' /proc/loadavg)
    tcpinuse=$(awk '/TCP:/ {print $3}' /proc/net/sockstat)
    timestamp=$(date +"%Y/%m/%d %T")

    echo "$timestamp,$idlecpu,$memory,$loadavg,$tcpinuse" >> $result

    # Definir cores dinâmicas
    cpu_color=$GREEN
    mem_color=$GREEN

    if [ "$idlecpu" -lt 20 ]; then cpu_color=$RED; fi
    if [ "$idlecpu" -lt 40 ]; then cpu_color=$YELLOW; fi

    if [ "$memory" -lt 20 ]; then mem_color=$RED; fi
    if [ "$memory" -lt 40 ]; then mem_color=$YELLOW; fi

    clear

    echo -e "${CYAN}========================== SYSTEM MONITOR ==========================${NC}"
    printf "%-19s | %10s | %10s | %10s | %6s\n" "Timestamp" "CPU idle%" "Mem free%" "LoadAvg" "TCP"
    echo "--------------------------------------------------------------------"

    printf "%-19s | ${cpu_color}%10s${NC} | ${mem_color}%10s${NC} | %10s | %6s\n" \
    "$timestamp" "$idlecpu" "$memory" "$loadavg" "$tcpinuse"

    echo
    echo "Tempo decorrido: $elapsed / $total_time segundos"
    echo "Arquivo log: $result"

    sleep $interval
done

# MÉDIAS
avg_cpu=$(awk -F, '{s+=$2} END {printf("%.2f", s/NR)}' $result)
avg_mem=$(awk -F, '{s+=$3} END {printf("%.2f", s/NR)}' $result)
avg_load=$(awk -F, '{s+=$4} END {printf("%.2f", s/NR)}' $result)
avg_tcp=$(awk -F, '{s+=$5} END {printf("%.0f", s/NR)}' $result)

echo
echo "==================== MÉDIAS ===================="
echo "CPU idle média : $avg_cpu %"
echo "Mem free média : $avg_mem %"
echo "LoadAvg média  : $avg_load"
echo "TCP média      : $avg_tcp"
echo "==============================================="

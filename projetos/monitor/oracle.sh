#!/bin/bash

###################################
## ORACLE LINUX MONITOR DASHBOARD
###################################

if [ $# -ne 2 ]; then
  echo "Uso: ./oracle_monitor.sh <tempo_total_segundos> <intervalo_segundos>"
  exit 1
fi

total_time=$1
interval=$2
start_time=$(date +%s)

result=/tmp/resultado_"$HOSTNAME"_$(date +%Y%m%d_%H%M%S).txt

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

get_cpu_idle() {
    awk -v RS="" '
    { 
      idle1=$5; total1=0;
      for(i=2;i<=8;i++) total1+=$i;
      getline;
      idle2=$5; total2=0;
      for(i=2;i<=8;i++) total2+=$i;
      printf("%.0f", (idle2-idle1)*100/(total2-total1))
    }' <(grep "^cpu " /proc/stat; sleep 1; grep "^cpu " /proc/stat)
}

while true
do
    now=$(date +%s)
    elapsed=$((now - start_time))
    [ $elapsed -ge $total_time ] && break

    idlecpu=$(get_cpu_idle)
    memory=$(awk '/MemTotal/ {t=$2} /MemAvailable/ {a=$2} END {printf("%.0f", a*100/t)}' /proc/meminfo)
    loadavg=$(awk '{printf("%.2f", $1)}' /proc/loadavg)
    tcpinuse=$(awk '/TCP:/ {print $3}' /proc/net/sockstat 2>/dev/null)
    timestamp=$(date +"%Y/%m/%d %T")

    echo "$timestamp,$idlecpu,$memory,$loadavg,$tcpinuse" >> $result

    cpu_color=$GREEN
    mem_color=$GREEN

    [ "$idlecpu" -lt 40 ] && cpu_color=$YELLOW
    [ "$idlecpu" -lt 20 ] && cpu_color=$RED

    [ "$memory" -lt 40 ] && mem_color=$YELLOW
    [ "$memory" -lt 20 ] && mem_color=$RED

    clear
    echo -e "${CYAN}=========== ORACLE LINUX SYSTEM MONITOR ===========${NC}"
    printf "%-19s | %10s | %10s | %10s | %6s\n" "Timestamp" "CPU idle%" "Mem free%" "LoadAvg" "TCP"
    echo "----------------------------------------------------------------"

    printf "%-19s | ${cpu_color}%10s${NC} | ${mem_color}%10s${NC} | %10s | %6s\n" \
    "$timestamp" "$idlecpu" "$memory" "$loadavg" "${tcpinuse:-0}"

    echo
    echo "Tempo: $elapsed / $total_time segundos"
    echo "Kernel: $(uname -r)"
    echo "Log: $result"

    sleep $interval
done

# MÉDIAS
avg_cpu=$(awk -F, '{s+=$2} END {printf("%.2f", s/NR)}' $result)
avg_mem=$(awk -F, '{s+=$3} END {printf("%.2f", s/NR)}' $result)
avg_load=$(awk -F, '{s+=$4} END {printf("%.2f", s/NR)}' $result)
avg_tcp=$(awk -F, '{s+=$5} END {printf("%.0f", s/NR)}' $result)

echo
echo "================ MÉDIAS ================="
echo "CPU idle média : $avg_cpu %"
echo "Mem free média : $avg_mem %"
echo "LoadAvg média  : $avg_load"
echo "TCP média      : $avg_tcp"
echo "========================================="

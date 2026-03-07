while true; do
  TOTAL=$(curl -s https://serverest.dev/usuarios | jq -r '.quantidade')
  echo "$(date '+%Y-%m-%d %H:%M:%S') - Total: $TOTAL" | tee -a usuarios.log
  sleep 60
done
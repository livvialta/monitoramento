#!binbash

# Nome do arquivo de log
LOG_FILE=system_monitor.log

# Função para obter a data e hora atual
get_timestamp() {
  date +%Y-%m-%d %T
}

# Função para obter as informações do sistema
get_system_info() {
  echo Data e Hora $(get_timestamp)
  echo Uso da CPU $(top -bn1  grep 'Cpu(s)'  awk '{print $2 + $4}')%
  echo Uso da Memória $(free -m  awk 'Mem {print $3}')MB  $(free -m  awk 'Mem {print $2}')MB
  echo Uso de Disco $(df -h   awk ' {print $5}') usado
  echo 
}

# Loop de monitoramento
while true; do
  get_system_info  $LOG_FILE
  sleep 300  # Espera 5 minutos antes de coletar novamente as informações
done

#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/../lib/collector.sh"

echo "----System parameters----"
echo "Hostname: $(get_hostname)"
echo "IP Address: $(get_ip)"
echo "CPU: $(get_cpu)"
echo "RAM: $(get_ram)"
echo "Uptime: $(get_uptime)"

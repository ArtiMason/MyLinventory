#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/../lib/collector.sh"
source "$SCRIPT_DIR/../lib/formatter.sh"

OUTPUT_FILE="$SCRIPT_DIR/../snapshots/inventory.json"
echo "{" > "$OUTPUT_FILE"
format_json "hostname" "$(get_hostname)" >> "$OUTPUT_FILE"
format_json "ip" "$(get_ip)" >> "$OUTPUT_FILE"
format_json "cpu" "$(get_cpu)" >> "$OUTPUT_FILE"
format_json "ram" "$(get_ram)" >> "$OUTPUT_FILE" 
sed -i '$ s/,$//' "$OUTPUT_FILE"
echo "}" >> "$OUTPUT_FILE"

echo "Inventory saved on $OUTPUT_FILE"
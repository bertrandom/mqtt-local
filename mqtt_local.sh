#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CONFIG_FILE="$(mktemp -t mosquitto.conf)"
trap 'rm -f "$CONFIG_FILE"' EXIT

cat > "$CONFIG_FILE" <<EOF
listener 1883
allow_anonymous false
password_file $SCRIPT_DIR/passwd
EOF

/opt/homebrew/sbin/mosquitto -c "$CONFIG_FILE"

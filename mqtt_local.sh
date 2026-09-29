#!/bin/bash
SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]:-$0}")")"

CONFIG_FILE="$(mktemp -t mosquitto.conf)"
trap 'rm -f "$CONFIG_FILE"' EXIT

cat > "$CONFIG_FILE" <<EOF
listener 1883
allow_anonymous false
password_file $SCRIPT_DIR/passwd
EOF

/opt/homebrew/sbin/mosquitto -c "$CONFIG_FILE"

#!/bin/bash
SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]:-$0}")")"

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    cat <<EOF
Usage: $(basename "$0") [username] [password]

Generate the mosquitto passwd file at $SCRIPT_DIR/passwd
with a single user. Any existing passwd file is replaced.

Arguments:
  username    MQTT username (default: mqtt)
  password    MQTT password (default: mqtt)

Options:
  -h, --help  Show this help and exit
EOF
    exit 0
fi

USERNAME="${1:-mqtt}"
PASSWORD="${2:-mqtt}"

rm -f "$SCRIPT_DIR/passwd"
/opt/homebrew/bin/mosquitto_passwd -c -b "$SCRIPT_DIR/passwd" "$USERNAME" "$PASSWORD"

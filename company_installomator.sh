#!/bin/bash

ALLOWED_LABELS=(
  "microsoftoffice365"
  "zoom"
  "gotoconnect"
  "appcleaner"
  "onyx"
  "vlc"
  "spotify"
  "theunarchiver"
  "whatsapp"
  "firefox"
  "googlechrome"
  "adobereaderdc"
  "anydesk"
)

label="$1"

if [[ -z "$label" ]]; then
  echo "ERROR: No label provided."
  exit 1
fi

if [[ ! " ${ALLOWED_LABELS[@]} " =~ " ${label} " ]]; then
  echo "ERROR: Label '$label' is not approved for this company."
  exit 2
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

bash "$SCRIPT_DIR/Installomator.sh" "$label"

#!/bin/bash

echo "=== DEBUG: Starting QMK setup ==="
echo "=== DEBUG: QMK_DIR = $QMK_DIR ==="
echo "=== DEBUG: Current user = $(whoami) ==="
echo "=== DEBUG: Current directory = $(pwd) ==="
echo "=== DEBUG: Checking if QMK_DIR exists ==="

if [ ! -d "$QMK_DIR" ] || [ ! -f "$QMK_DIR/Makefile" ]; then
  git config --global --add safe.directory /qmk
  echo '=== DEBUG: QMK directory does not exist or incomplete, setting up with QMK CLI... ==='
  echo 'Setting up QMK firmware using QMK CLI...'
  echo "=== DEBUG: Attempting to remove $QMK_DIR ==="
  echo "=== DEBUG: Removed $QMK_DIR, now configuring QMK CLI ==="
  echo "=== DEBUG: QMK CLI configured, running setup ==="
  qmk setup -H $QMK_DIR --yes
  echo "=== DEBUG: QMK setup completed ==="
else
  echo '=== DEBUG: QMK firmware directory already exists ==='
  echo 'QMK firmware directory already exists'
fi

echo "=== DEBUG: Attempting to cd to $QMK_DIR ==="
echo 'QMK setup completed'
echo "=== DEBUG: Setup script finished ==="


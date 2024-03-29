#!/bin/zsh

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title add antenna
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Raycast Scripts
# @raycast.argument1 { "type": "text", "placeholder": "WebSite URL" }

source ~/.zshrc
python3 ./add_antenna.py ${1}
python3 ../get_antenna/get_antenna.py

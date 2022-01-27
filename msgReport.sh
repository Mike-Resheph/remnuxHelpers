#!/bin/sh
# Script that runs common tools on MSG files.
# Michael Andersen 2022
if [ $# -eq 0 ]
  then
    echo "[!] No arguments were supplied"
    echo "[*]"
    echo "[*] Usage: msgReport.sh <file>"
    echo "[*] Ex: $ msgReport.sh file.msg"
    exit 1
fi

echo "[*] Running ExifTool..."
exiftool $1
echo "[*] Running Oledump..."
# See an overview of known data only, quietly because this may give a lot of output
oledump.py -q -p plugin_msg --pluginoptions "-k" $1
oledump.py -p plugin_msg_summary $1
# Search for generic information
oledump.py -p plugin_msg $1 | grep Date
oledump.py -p plugin_msg $1 | grep From
oledump.py -p plugin_msg $1 | grep To
oledump.py -p plugin_msg $1 | grep Reply-To
oledump.py -p plugin_msg $1 | grep Subject
oledump.py -p plugin_msg $1 | grep Content
# Search for attachment long and short name
oledump.py -p plugin_msg $1 | grep attach | grep filename
# Search for URLs
oledump.py -p plugin_msg $1 | grep http
echo "[*] Done."



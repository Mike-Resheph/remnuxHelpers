#!/bin/sh
# Script that runs common tools on PE files.
# Michael Andersen 2022
if [ $# -eq 0 ]
  then
    echo "[!] No arguments were supplied"
    echo "[*]"
    echo "[*] Usage: peReport.sh file>"
    echo "[*] Ex: $ peReport.sh file.exe|dll"
    exit 1
fi

echo "[*] Running ExifTool..."
exiftool $1
echo "[*] Running Manalyze..."
manalyze --pe $1 --hashes
manalyze --pe $1 -d resources
echo "[*] Running PEFrame..."
peframe $1
echo "[*] Running PE Dump..."
pedump -E -I --packer $1
echo "[*] Running capa..."
capa $1
echo "[*] Done."


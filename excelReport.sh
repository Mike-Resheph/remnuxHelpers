#!/bin/sh
# Script that runs common tools on excel files.
# Michael Andersen 2022
if [ $# -eq 0 ]
  then
    echo "[!] No arguments were supplied"
    echo "[*]"
    echo "[*] Usage: excelReport.sh <excel file>"
    echo "[*] Ex: $ wordReport.sh file.xls"
    exit 1
fi


echo "[*] Running ExifTool..."
exiftool $1
echo "[*] Running OleVBA..."
olevba $1
echo "[*] Running OleDump..."
# Run oledump with size of the compressed compiled code and the compressed VBA
oledump.py -i $1
# Run oledump, select all streams containing macros and decompress them
oledump.py -s a -v $1
# Run oledump with a VBA summary with the streams that contains VBA code
oledump.py -p plugin_vba_summary $1
# Run oledump to find links etc
oledump.py -p plugin_http_heuristics --pluginoptions "-e" $1
oledump.py -p plugin_biff --pluginoptions "-x" $1
echo "[*] Running P-Code dump...."
pcodedmp $1
echo "[*] Running XLM Deobfuscator..."
xlmdeobfuscator -n -f $1
echo "[*] Running mraptor..."
mraptor $1
echo "[*] Done."


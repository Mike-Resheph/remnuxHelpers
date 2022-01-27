#!/bin/sh
# Script that runs common tools on ZIP files.
# Michael Andersen 2022
if [ $# -eq 0 ]
  then
    echo "[!] No arguments were supplied"
    echo "[*]"
    echo "[*] Usage: zipReport.sh file>"
    echo "[*] Ex: $ zipReport.sh file.zip"
    exit 1
fi


echo "[*] Running ExifTool..."
exiftool $1
echo "[*] Running Zipdump..."
# Show content of file and include hash values of each file in archive.
zipdump.py -e -i $1
# Show if this is actually 2 concatinated zip files.
# Some tools would only see content of the first zip file and some would tools would only see the second zip file.
# Tools such as zip, rar, 7z, Python zip library etc.
zipdump.py -f list $1
echo "[*] Done."


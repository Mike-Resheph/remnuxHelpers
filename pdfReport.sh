#!/bin/sh
# Script that runs common tools on pdf files.
# Michael Andersen 2022
if [ $# -eq 0 ]
  then
    echo "[!] No arguments were supplied"
    echo "[*]"
    echo "[*] Usage: pdfReport.sh <file>"
    echo "[*] Ex: $ wordReport.sh file.pdf"
    exit 1
fi


echo "[*] Running ExifTool..."
exiftool $1
echo "[*] Running PDF Cop..."
pdfcop $1
echo "[*] Running PDFID..."
pdfid.py -n $1
echo "[*] Running PDF Parser..."
# Show statistics including the content of Object streams
pdf-parser.py -a -O $1
# Search for http/https with filter
pdf-parser.py -s http -O -f $1
pdf-parser.py -s javascript -O -f $1
# Show interesting objects
pdf-parser.py -k /URI -O $1
pdf-parser.py -k /JS -O $1
pdf-parser.py -k /AcroForm -O $1
echo "[*] Running peepdf..."
peepdf -l -f $1
echo "[*] Running PDF Tool..."
# Examine if this document contains Incremental Updates
pdftool.py iu $1
echo "[*] Done."


root@one:/var/www/html/remnux# cat emlReport.sh
#!/bin/sh
# Script that runs common tools on eml files.
# Michael Andersen 2022
if [ $# -eq 0 ]
  then
    echo "[!] No arguments were supplied"
    echo "[*]"
    echo "[*] Usage: emlReport.sh <file>"
    echo "[*] Ex: $ emlReport.sh file.msg"
    exit 1
fi

echo "[*] Running ExifTool..."
exiftool $1
echo "[*] Running emldump..."
emldump.py $1
echo "[*] Done."


#!/bin/bash
# This is a script to loop over a directory and generate hashes from all the files within it
# By Michael Andersen 2022

# Check for arguments
if [ $# -eq 0 ]
  then
    echo "[!] No arguments were supplied"
    echo "[*]"
    echo "[*] Usage: generateHashesFromFileDir.sh <directory> <filetype>"
    echo "[*]"
    echo "[*] Ex: $ generateHashesFromFileDir.sh ~/files/ .dll"
    exit 1
fi

# Loop over files
for filename in $(ls $1/*.$2)
do
    sha256sum $filename
done



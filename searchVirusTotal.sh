#!/bin/bash
# Script that verifies a hash on VirusTotal
# Michael Andersen 2022
# NOTE: Create a free account on Virus Total and get your own API key.

# Check for arguments
if [ $# -eq 0 ]
  then
    echo "[!] No arguments were supplied"
    echo "[*]"
    echo "[*] Usage: searchVirusTotal.sh <hash>"
    echo "[*]"
    echo "[*] This requires an Internet connection which Remnux does not have by default."
    exit 1
fi

curl -s --request GET --url https://www.virustotal.com/api/v3/files/{$1} --header 'x-apikey: <api key>' | grep -A 3 code


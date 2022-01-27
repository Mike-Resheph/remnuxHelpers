#!/bin/sh
# Script that runs common tools on pcap files.
# Michael Andersen 2022
if [ $# -eq 0 ]
  then
    echo "[!] No arguments were supplied"
    echo "[*]"
    echo "[*] Usage: pcapReport.sh file>"
    echo "[*] Ex: $ pcapReport.sh file.pcap"
    exit 1
fi


echo "[*] Running ExifTool..."
exiftool $1
echo "[*] Running Wireshark captype..."
captype $1
echo "[*] Running Wireshark capinfos..."
capinfos $1
echo "[*] Done."
echo "Consider using networkminer for further investigation. it is capable of showing captured Kerberos credentials, save captured files, show images and more."
echo "The free version does not support pcapng files but pcapng files can be opened with Wireshark and saved as pcap files."
echo "If you just need to dump files captured, the tcpxtract tool works very well. - And of course there is Wireshark."



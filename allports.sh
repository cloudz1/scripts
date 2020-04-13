#!/bin/bash
ap='_allports'
depth='_scan'
echo "Enter an IP address (eg 10.10.10.10)";
read userinput
hping3 --scan 1-65535 -S $userinput > placeholder.txt;
cat placeholder.txt | grep -v "(" > $userinput$ap.txt;
rm placeholder.txt;
list=$( cat $userinput$ap.txt | awk '{ print $1 }' | tr '\n' ',' | sed 's/.$//' )
nmap -sC -Pn -sV $list $userinput -oA $userinput$depth;
echo "===================================================="
echo "Scan complete!"

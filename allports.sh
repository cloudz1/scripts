#!/bin/bash
ap='_allports'
depth='_scan'
udp='_udp'
echo "Enter an IP address (eg 10.10.10.10)";
read userinput
hping3 --scan 1-65535 -S $userinput > placeholder.txt;
cat placeholder.txt | grep -v "(" > $userinput$ap.txt;
rm placeholder.txt;
list=$( cat $userinput$ap.txt | awk '{ print $1 }' | tr '\n' ',' | sed 's/.$//' )
nmap -sC -Pn -sV $list $userinput -oA $userinput$depth;
nmap -n -Pn -sU -T4 --max-retries 1 $userinput -oG $userinput$udp; 
echo "===================================================="
echo "Scan complete!"

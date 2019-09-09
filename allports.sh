#!/bin/bash
echo "Enter an IP address (eg 10.10.10.10)";
read userinput
hping3 --scan 1-65535 -S $userinput > test.txt;
cat test.txt | grep -v "(" > portsout.txt;
rm test.txt;
list=$( cat portsout.txt | awk '{ print $1 }' | tr '\n' ',' | sed 's/.$//' )
nmap -Pn -sV $list $userinput -oA portscans;
echo "===================================================="
echo "Scan complete!"

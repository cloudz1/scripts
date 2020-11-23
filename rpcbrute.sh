#!/bin/bash
# for null session enumeration of other users via brutforce list
# make a user file or use one from kali (eg bob, www, admin, root, sara, Jamie, alice, tod)

echo "Enter an IP address (eg 10.10.10.10)";
read userip;
echo "Enter user file to use for checking (eg /opt/scripts/hosts.txt)";
read usersfile
for u in $(cat $usersfile);
  do rpcclient -U "" $userip -N --command="lookupnames" $u;
  done | grep "User:1"
echo "================================================================"
echo "Scan complete!"

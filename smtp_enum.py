#!/usr/bin/python
import socket
import sys

if len(sys.argv) !=2:
	print “Usage: smtp_enum.py <username>”
	sys.exit(0)

# Create a Socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

#connect to the server
connect = s.connect((’10.11.1.127’,25))

#receive the banner
banner = s.recv(1024)

print banner

# VRFY a user
s.send(‘VRFY ‘ + sys.argv[1] + ‘\r\n’)
result = s.recv(1024)

print result

#Close the socket
s.close()

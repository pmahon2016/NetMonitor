#!/bin/bash


apt -y update && apt -y install    # run the updates
apt -y install bind9 # install DNS
apt -y install isc-dhcp-server # Install DHCP
cp /root/NetMonitor/named* /etc/bind/ # Copy config files to etc dir
cp /root/NetMonitor/db.* /var/cache/bind/ # Copy zone files to DNS dir
cp /root/NetMonitor/dhcpcd.conf /etc/ # file to add static IP on the Raspberry PI
cp /root/NetMonitor/dhcpd.conf /etc/dhcp/ # DHCP Config files
cp /root/NetMonitor/isc-dhcp-server  /etc/default/ # Important** tells DHCP which interfac to run on
chmod u+x /root/NetMonitor/runpython.sh # Script to dump leases from DHCP for processing in Python
cp /root/NetMonitor/lease_renew.service /etc/systemd/system/ # The file used to create the service in LInux
systemctl daemon-reload # Loads the service in to the system
systemctl start bind9.service # start the dns app
rndc querylog on # turn on query logging and save file to /var/cache/bind/quearylog
rndc reload # reload to activate and get the querylog file


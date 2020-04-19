#!/bin/bash
# this file is called by Python the dhcp_monitor.py file to dump the current leases from the dhcp server into a file
# for processing

PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin

/usr/sbin/dhcp-lease-list --lease > /root/NetMonitor/dhcpIPHost.txt

/bin/sed -n '/192.168.1/ p' /root/NetMonitor/dhcpIPHost.txt | awk '{ print $2, $3}' > /root/NetMonitor/email_host_list.txt






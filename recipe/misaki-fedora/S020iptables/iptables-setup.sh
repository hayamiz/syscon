#!/bin/sh

# accept myself
iptables -A INPUT -j ACCEPT -i lo
iptables -A OUTPUT -j ACCEPT -o lo

# log and drop stealth scan
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j LOG --log-prefix "Stealth scan attempt "
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# accept already connected or related new connection
iptables -A INPUT -j ACCEPT -m state --state ESTABLISHED,RELATED

# allow incoming packets
iptables -A INPUT -j ACCEPT -p icmp # ping
iptables -A INPUT -j ACCEPT -p tcp --source 157.82.157.0/25 --dport 22 -m state --state NEW # ssh

# drop
iptables -P INPUT DROP
iptables -P FORWARD DROP

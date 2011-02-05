#!/bin/sh
#
# Basical Policy (All packet pass!)
#
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
#
# Formatting
#
iptables -F
iptables -Z
iptables -X


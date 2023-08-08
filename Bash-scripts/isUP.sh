  #!/bin/bash
if [ "$1" == "" ]; then
    echo "Enter an IP"
    echo "Syntax: ./isUP.sh 192.168.0 "
else
    for x in $(seq 1 254)
    do
         _ip_strg=$( ping -c 1  $1.$x | grep 64 | cut -d ' ' -f 4 | tr -d : )
        if [ "$_ip_strg" == "$1.$x" ]; then
            echo "$_ip_strg is up!!"
        fi
    done
fi
# This script discover live-host in a network with 'ping' 
        

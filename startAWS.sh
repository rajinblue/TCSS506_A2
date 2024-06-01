#!/bin/bash

# Set the .pem file 
pemfile=~/MyEC2SSH.pem

# If ~/current_ip exists, read the ip address from it
if [ -f ~/current_ip ]; then
    ipaddress=$(cat ~/current_ip)
fi

# If the .pem file does not exist, ask for it using a flag -p -use getopts
while getopts ":p:i:" opt; do
    case $opt in
        p)
            pemfile=$OPTARG
            ;;
        i)
            ipaddress=$OPTARG
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done
# Save the ip to a file ~/current_ip
echo $ipaddress > ~/current_ip

# ssh into the instance using user ubuntu, the .pem file, and the ip address
ssh -i $pemfile ubuntu@$ipaddress
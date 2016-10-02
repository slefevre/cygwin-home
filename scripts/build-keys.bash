#!/bin/bash

read -p "Please enter your email: " email
read -p "Please enter the host name of the target system: " system
read -sp "Please enter your new password: " pw1
echo
read -sp "Please re-enter your new password: " pw2
if [ "$pw1" != "$pw2" ]; then
  echo
  echo Passwords do not match.
  exit 1
fi

hosts=($(cut -d' ' -f1 <~/.ssh/known_hosts|cut -d',' -f1|cut -d':' -f1|tr -d "[]"))

for host in "${hosts[@]}"
do
   echo "$host"
   ssh-keygen -t ed25519 -C "$email" -P "$pw1" -f "$system_$email_$host.private.id_rsa"
   # or do whatever with individual element of the array
done

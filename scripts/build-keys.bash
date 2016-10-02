#!/bin/bash

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
   # or do whatever with individual element of the array
done

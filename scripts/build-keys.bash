#!/bin/bash

read -p "Please enter your email: " email
read -p "Please enter the host name of the target system: " system
read -sp "Please enter your new password: " pw1
echo
#TODO: re-prompt when passwords don't match
read -sp "Please confirm your new password: " pw2
if [ "$pw1" != "$pw2" ]; then
  echo
  echo Passwords do not match.
  exit 1
fi

#TODO: confirm creation with inputted email, hostname

hosts=($(cut -d' ' -f1 <~/.ssh/known_hosts|cut -d',' -f1|cut -d':' -f1|tr -d "[]"))

mkdir $(printf "%s_keys" "$system")

# TODO: Add quit option

for host in "${hosts[@]}"
do
  read -r -p "Create key for host $host? [y/n] " response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    keyfile=$(printf "%s_keys/%s_%s_%s.id_ed25519" "$system" "$system" "$email" "$host")
    ssh-keygen -t ed25519 -C $(printf "%s_%s" "$email" "$system") -P "$pw1" -f "$keyfile"
    read -r -p "ssh new key to host $host? [y/n] " response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
     ssh-copy-id -i $keyfile.pub "$host"
    fi
  fi
done

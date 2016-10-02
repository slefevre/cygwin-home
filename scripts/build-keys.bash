#!/bin/bash

read -sp "Please enter your new password: " pw1
echo
read -sp "Please re-enter your new password: " pw2
if [ "$pw1" != "$pw2" ]; then
  echo
  echo Passwords do not match.
  exit 1
fi

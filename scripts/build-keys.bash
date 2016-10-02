#!/bin/bash

echo Please enter your new password:
read pw1
echo Please re-enter your new password:
read pw2
if [ "$pw1" != "$pw2" ]; then
  echo Passwords do not match.
  exit 1
fi

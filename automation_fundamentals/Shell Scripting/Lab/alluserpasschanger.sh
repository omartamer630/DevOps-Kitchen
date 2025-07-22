#! /usr/bin/bash

password="trootent"

for user in "$@"
do
echo "$user:$password" | sudo chpasswd
echo "Password Changed for user ${user}"
done

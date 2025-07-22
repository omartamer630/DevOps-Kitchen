#! /usr/bin/bash

if [ -z $1 -o -z $2 ] #Checking if the file exists or there is no file
then 
echo "Usage: $0 <file1> <file2>"
exit 0
fi

file1=`md5sum $1`
file2=`md5sum $2`
IFS=' '

read -ra ADDR <<< "${file1}"
read -ra ADDR_2 <<< "${file2}"

echo "File One : ${file1}"
echo "File Two : ${file2}"


if [ ${ADDR[0]} = ${ADDR_2[0]} ]
then
echo "The files are identical."
else
echo "The files are different."
fi

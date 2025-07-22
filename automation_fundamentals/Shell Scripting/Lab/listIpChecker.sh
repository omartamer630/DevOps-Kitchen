#! /usr/bin/bash

SUCCESS=" 0% packet"

for i in {130..140}
do
  result=`ping 192.168.96.${i} -c 1 -w 1`
  if [[ ${result} == *${SUCCESS}* ]]; # el ( * ) de m3na ignore ay 7aga w 4of el 7aga eli 4bh (" 0% packet") 
  then
  echo "192.168.96.${i} is Existed"
  else
  echo "192.168.96.${i} is Not Existed"
  fi
done

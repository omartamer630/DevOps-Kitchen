#!/usr/bin/bash 

function add(){
  return $(( $1 + $2 ))
}

sum=$(add 1 2)
echo $sum

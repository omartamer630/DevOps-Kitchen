#!/usr/bin/bash

function add() {
  echo $(( $1 + $2 ))
}

sum=$(add 5 10)

echo "$sum"

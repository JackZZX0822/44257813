#!/bin/bash
# save as triplet-stop.sh
# splits a sequence into triplets
x=0
while [ -n "${1:$x:3}" ]; do
  seq=$seq${1:$x:3}" "
  x=$(expr $x + 3)
  if ((x>8));then
  if [ ${1:$x:3} == taa ]; then
    break
    fi
  fi
done
echo "$seq"


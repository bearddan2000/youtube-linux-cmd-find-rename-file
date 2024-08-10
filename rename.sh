#!/usr/bin/env bash

function rename(){
    local old=$1
    local new=$2

    find . -type f -name "*${old}" -execdir sh -c \
        'x={}; mv $x $(echo $x | sed 's/${old}/${new}/g')' \;
}

while getopts ":ud" opts; do
  case $opts in
    u)
      rename "java" "groovy" ;;
    d)
      rename "groovy" "java" ;;
  esac
done

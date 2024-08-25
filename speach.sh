#!/usr/bin/env bash

# espeak -v fr -s 32 -p 20 -f fr/00-notes

function speach(){
    local lang=$1
    local speed=0
    local pitch=0

    case $lang in
      de)
        speed=70
        pitch=40 ;;
      en)
        speed=90
        pitch=20 ;;
      es)
        speed=90
        pitch=40 ;;
      fr)
        speed=32
        pitch=20 ;;
    esac

    for a in `ls -l $PWD/$lang/*notes | awk '{print $NF;}'`; do
      espeak -v $lang -p $pitch -s $speed -f $a
      sleep 5
    done
}
speach $1
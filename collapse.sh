#!/usr/bin/env bash

function collapse(){
    local lang=$1
    local output="$PWD/${lang}-collapse"

    if [ -e $output ]; then
      rm -f $output
    fi

    for a in `ls -l $PWD/$lang/*notes | awk '{print $NF;}'`; do
      echo "== $a ==" >> $output #log where the source is
      cat $a >> $output
      echo "" >> $output
      echo "=====" >> $output #add a delimator
      echo "" >> $output
    done
}

function expand(){
    local lang=$1
    local input="$PWD/${lang}-collapse"
    local output=$PWD/${lang}
    local offset=`grep -c '=====' $input`
    
    if [ -d $output ]; then
      rm -Rf $output
    fi

    mkdir -p $output

    csplit $input --suffix-format='%02d-notes' --quiet /=====/ {*}

    for x in `find . -type f -name "xx*"`; do
      sed -i '/^==*/d' $x # del deliminator and source name
      sed -i '1d;$d' $x # del first and last line
      mv $x $(echo $x | sed 's/xx//g')
    done

    mv *notes $output

    # remove very last file
    rm -f $output/$offset-notes
}
d=$1
expand $d
# collapse $d
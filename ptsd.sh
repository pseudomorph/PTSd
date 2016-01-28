#!/bin/bash

OS_TYPE=$(uname -a | awk {'print $1'})

if [[ ${OS_TYPE} == "Darwin" ]]; then
	use_tty="/dev/ttys0[0-9]*"
else
	use_tty="/dev/pts/[0-9]*"
fi

while true
do
        PTS_ARRAY=( $(ls ${use_tty}) )
        for PTS in ${PTS_ARRAY[@]}
        do
                echo "" > ${PTS}
                sleep "$(((RANDOM%10)+1))"
        done
done

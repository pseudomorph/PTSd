#!/bin/bash

while true
do
        PTS_ARRAY=( $(ls /dev/pts/[0-9]*) )
        for PTS in ${PTS_ARRAY[@]}
        do
                perl << EOF
\$TIOCSTI = 0x5412; \$tty = "${PTS}"; \$char = "\n"; open(\$fh, ">", \$tty); ioctl(\$fh, \$TIOCSTI, \$char)
EOF
                sleep "$(((RANDOM%10)+1))"
        done
done

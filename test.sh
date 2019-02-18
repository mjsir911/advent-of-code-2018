#!/usr/bin/env bash

command=$1
filename=${2:-/dev/stdin}

readarray -d $'\0' REPLY < <(sed -E 's|^-+$|\x0|g' < $filename; echo -ne '\0')

REALOUT="$(echo -ne "${REPLY[0]}" | $command)"
EXPTOUT="$(echo -ne "${REPLY[1]}" | tail -c +2)"

DIFF=$(diff <(echo -ne "${REALOUT}\n") <(echo -ne "${EXPTOUT}\n"))
if [ $? -eq 0 ]; then
	exit 0
else
	[ -n "$2" ] && echo $2
	echo "$DIFF"
	exit 1
fi
echo

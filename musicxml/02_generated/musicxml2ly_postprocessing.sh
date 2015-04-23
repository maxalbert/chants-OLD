#!/bin/bash

for FILE in *.ly; do
    if grep '\\key c \\none' $FILE > /dev/null; then
	echo "Tweaking file ${FILE}: '\key c \none' -> '\key c \major'"
	sed -i -e 's#\\key c \\none#\\key c \\major#' $FILE
    fi
done

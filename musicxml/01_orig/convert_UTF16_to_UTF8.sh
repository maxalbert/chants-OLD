#!/bin/bash

set -e

FILENAME=$1

if [ -z "${FILENAME}" ]; then
    echo "Usage: convert_UTF16_to_UTF8 FILENAME"
    exit
fi

FILENAME_OUT=${FILENAME%.xml}_UTF8.xml

iconv -f UTF16LE -t UTF-8 ${FILENAME} -o ${FILENAME_OUT}
sed -i -e 's/UTF-16/UTF-8/' ${FILENAME_OUT}
dos2unix ${FILENAME_OUT}

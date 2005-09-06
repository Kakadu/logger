#!/bin/sh

if test $# = 0; then
    echo "usage: $0 <file prefix>"
    exit 1
fi
      
FILE=$1

if [ ! -x $FILE-log ]; then
    echo "File $FILE-log does not exist or not executable"
    exit -1
fi

if [ ! -x $FILE-nolog ]; then
    echo "File $FILE-nolog does not exist or not executable"
    exit -1
fi


./$FILE-log > $FILE.log
ERROR=0
if ! diff -u orig/$FILE.log $FILE.log > $FILE.diff; then
    echo "$FILE: FAILED (see $FILE.diff)"
    ERROR=$(($ERROR + 1))
else
    rm -f $FILE.diff
fi

if [ $ERROR -gt 0 ]; then
    exit $ERROR
fi

./$FILE-nolog > $FILE.nolog
ERROR=0
if ! diff -u orig/empty $FILE.nolog > $FILE.diff; then
    echo "$FILE: FAILED (see $FILE.diff)"
    ERROR=$(($ERROR + 1))
else
    rm -f $FILE.diff
fi

if [ $ERROR -eq 0 ]; then
    #echo "$FILE: passed"
    exit 0
else
    exit $ERROR
fi

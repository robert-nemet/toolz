#!/bin/sh

# All files that matches a PATTERN from behind are renamed to match pattern with SUFIX and POSTFIX, while PATTERN is removed.

PATTERN=$1
SUFIX=$2
POSTFIX=$3

declare -i cnt=0
for f in $(eval echo "*$PATTERN"); do
    mv "$f" "$SUFIX${f%$PATTERN}$POSTFIX"
    cnt=$cnt+1
done;

echo "renamed $cnt files."


#!/bin/sh

# Script name: rf.sh
# 
# Author: robert.nemet@gmail.com
#
# Description: Rename files that matches a PATTERN from behind to match pattern with SUFIX and POSTFIX, while PATTERN is removed:
# 
# Example: Files mathing *file.xyz are renamed to document-1.txt

PATTERN=$1
SUFIX=$2
POSTFIX=$3

declare -i cnt=0
for f in $(eval echo "*$PATTERN"); do
    mv "$f" "$SUFIX${f%$PATTERN}$POSTFIX"
    cnt=$cnt+1
done;

echo "renamed $cnt files."

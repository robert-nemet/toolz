#!/bin/sh

# Script name: rf.sh
# 
# Author: robert.nemet@gmail.com
#
# Description: Rename files that matches a PATTERN from behind to match pattern with SUFIX and POSTFIX, while PATTERN is removed.
# 
# Example: Files matching *file.xyz are renamed to document-*.txt
#         
#   rf.sh -t -file.xyz -s document- -p .txt

_help="
Rename files that matches a PATTERN from behind to match pattern with SUFIX and POSTFIX, while PATTERN is removed.

Syntax: rf [options]
options:
-h    Print this Help.
-s    Prefix value
-t    Pattern value
-p    Postfix value

"

display_help() {
   # Dispaly Help
   echo "$_help"
}

parse_options() {
    while getopts "t:p:s:h" option; do
        case $option in
            t)
                PATTERN="$OPTARG"
                ;;
            p)
                POSTFIX="$OPTARG"
                ;;
            s)
                SUFIX="$OPTARG"
                ;;
            h) # display Help
                display_help
                exit 2;;
            \?) # incorrect option
                echo "Error: Invalid option"
                display_help
                exit 1;;
        esac
    done
}

rename_files() {
    cnt=0
    for f in $(eval echo "*$PATTERN"); do
        mv "$f" "$SUFIX${f%$PATTERN}$POSTFIX"
        cnt=$((cnt + 1))
    done;

    echo "renamed $cnt files."
}

# main

PATTERN=""
POSTFIX=""
SUFIX=""

parse_options "$@"
if [ "$PATTERN" = "" ]; then
    echo "Nothing to match. See rf -h"
    exit 1
fi
rename_files






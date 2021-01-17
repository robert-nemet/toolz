#!/bin/sh

# Script name: rf.sh
# 
# Author: robert.nemet@gmail.com
#
# Description: Rename files that matches a PATTERN from behind to match pattern with SUFIX and POSTFIX, while PATTERN is removed.
# 
# Example: Files mathing *file.xyz are renamed to document-1.txt

display_help() {
   # Dispaly Help
   echo "Rename files that matches a PATTERN from behind to match pattern with SUFIX and POSTFIX, while PATTERN is removed."
   echo
   echo "Syntax: rf [options]"
   echo "options:"
   echo "-h    Print this Help."
   echo "-s    Prefix value"
   echo "-t    Pattern value"
   echo "-p    Postfix value"
   echo
}

parse_options() {
    while getopts "t:p:s:h" option; do
        case $option in
            t)
                PATTERN="$OPTARG"
                continue;;
            p)
                POSTFIX="$OPTARG"
                ;;
            s)
                SUFIX="$OPTARG"
                ;;
            h) # display Help
                echo "help"
                display_help
                exit;;
            \?) # incorrect option
                echo "Error: Invalid option"
                display_help
                exit;;
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
rename_files






# toolz

Just another set of cli toolz

## Working with files

Script: rf.sh

Rename files that matches a PATTERN from behind to match pattern with SUFIX and POSTFIX, while PATTERN is removed.
Example: For files matching end with 'file.xyz', remove 'file.xyz' add suffix 'document-' and postfix '.txt'

> rf.sh -t -file.xyz -s document- -p .txt

> 1-file.xyz => document-1.txt




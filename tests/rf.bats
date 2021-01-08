#!/usr/bin/env bats

setup() {
    mkdir "$BATS_TMPDIR/rf-tmp-$BATS_TEST_NUMBER"
    cd "$BATS_TMPDIR/rf-tmp-$BATS_TEST_NUMBER"
    for i in {1..10}; do 
        touch "$i-file.xyz";
    done
    PATH_TO_RF="${BATS_TEST_DIRNAME%/*}/scripts/rf.sh"

}

teardown() {
    rm -rf "$BATS_TMPDIR/rf-tmp-$BATS_TEST_NUMBER"
}

@test "rename files with pattern" {
    cd "$BATS_TMPDIR/rf-tmp-$BATS_TEST_NUMBER"
    run $PATH_TO_RF file.xyz document .txt
    declare -i cnt=0
    for f in *.txt; do
        cnt=$cnt+1
    done
    
    [ "$cnt" -eq 10 ]
    [ "$output" == "renamed 10 files." ]
}


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

@test "rename files with pattern, prefix and postfix" {
    cd "$BATS_TMPDIR/rf-tmp-$BATS_TEST_NUMBER"
    run bash -c "$PATH_TO_RF -t -file.xyz -s document- -p .txt"
    cnt=0
    for f in document-*.txt; do
        cnt=$((cnt+1))
    done

    [ "$cnt" -eq 10 ]
    [ "$output" == "renamed 10 files." ]
}

@test "rename files with pattern and postfix" {
    cd "$BATS_TMPDIR/rf-tmp-$BATS_TEST_NUMBER"
    run bash -c "$PATH_TO_RF -t -file.xyz -p .txt"
    cnt=0
    for f in *.txt; do
        cnt=$((cnt+1))
    done

    [ "$cnt" -eq 10 ]
    [ "$output" == "renamed 10 files." ]
}


@test "rename files with pattern and prefix" {
    cd "$BATS_TMPDIR/rf-tmp-$BATS_TEST_NUMBER"
    run bash -c "$PATH_TO_RF -t -file.xyz -s document-"
    cnt=0
    for f in document-*; do
        cnt=$((cnt+1))
    done

    [ "$cnt" -eq 10 ]
    [ "$output" == "renamed 10 files." ]
}

@test "print help with -h" {
    cd "$BATS_TMPDIR/rf-tmp-$BATS_TEST_NUMBER"
    run bash -c "$PATH_TO_RF -h"

    [ "$status" -eq 2 ]
}

@test "print help when no options" {
    cd "$BATS_TMPDIR/rf-tmp-$BATS_TEST_NUMBER"
    run bash -c "$PATH_TO_RF"

    [ "$status" -eq 1 ]
    [ "$output" == "Nothing to match. See rf -h" ]
}

@test "pattern is required" {
    cd "$BATS_TMPDIR/rf-tmp-$BATS_TEST_NUMBER"
    run bash -c "$PATH_TO_RF -s document- -p .txt"

    [ "$status" -eq 1 ]
    [ "$output" == "Nothing to match. See rf -h" ]
}


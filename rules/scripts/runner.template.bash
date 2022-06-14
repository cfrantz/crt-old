#!/usr/bin/env bash
set -euo pipefail

# EXCLUDE_EXTERNAL implies windows
if @EXCLUDE_EXTERNAL@; then
    rm -rf exclude_external
    mkdir exclude_external
    for f in *; do
        if [[ $f != "external" && $f != "exclude_external" ]]; then
            cp -al $f exclude_external/$f
        fi
    done
    (
        cd exclude_external
        rm -f _stdout.txt _stderr.txt _exit.txt
        BATCH=$(find . -name __test__.bat \! -path ./__test__.bat)
        if [[ ! -z "$BATCH" ]]; then
            ln -sf ${BATCH} __test__.bat
        fi
    )
fi

@EMULATOR@ @ARGS@
RC=$?

if @EXCLUDE_EXTERNAL@; then
    cd exclude_external
    [ -f _stdout.txt ] && cat _stdout.txt
    [ -f _stderr.txt ] && cat >&2 _stderr.txt
    # The _exit file may have some extra whitespace.
    [ -f _exit.txt ] && RC=$(cat _exit.txt)
    RC=${RC%% *}
fi
exit $RC

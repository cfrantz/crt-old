#!/usr/bin/env bash
set -euo pipefail

STDOUT=@STDOUT@
STDERR=@STDERR@
EXITCODE=@EXITCODE@

DISK_IMAGE_SNAPSHOT=@DISK_IMAGE_SNAPSHOT@
if [[ ! -z "$DISK_IMAGE_SNAPSHOT" ]]; then
    external/qemu/bin/qemu-img create \
        -b $(realpath @DISK_IMAGE@) -F qcow2 \
        -f qcow2 $DISK_IMAGE_SNAPSHOT
fi

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
        BATCH=$(find . -name __test__.bat \! -path ./__test__.bat)
        if [[ ! -z "$BATCH" ]]; then
            ln -sf ${BATCH} __test__.bat
        fi
    )
    # TODO(cfrantz): Do better at finding DLLs
    DLLS=$(find -L external -name "*.dll")
    for f in ${DLLS}; do
        dll=$(basename $f)
        cp -al $f exclude_external/$dll
    done
fi

if @QUICK_KILL@ && [[ ! -z "$EXITCODE" ]]; then
    touch "$EXITCODE"
    @EMULATOR@ @ARGS@ &
    PID=$!
    RUNNING=0
    while [[ $RUNNING == 0 && ! -s "$EXITCODE" ]]; do
        sleep 1
        ps $PID &>/dev/null
        RUNNING=$?
    done
    kill $PID
else
    @EMULATOR@ @ARGS@
    RC=$?
fi

[[ ! -z "$STDOUT" && -f "$STDOUT" ]] && cat "$STDOUT" && rm "$STDOUT"
[[ ! -z "$STDERR" && -f "$STDERR" ]] && cat >&2 "$STDERR" && rm "$STDERR"
# The _exit file may have some extra whitespace.
[[ ! -z "$EXITCODE" && -f "$EXITCODE" ]] && RC=$(cat "$EXITCODE" && rm "$EXITCODE")
RC=${RC%% *}

if [[ ! -z "$DISK_IMAGE_SNAPSHOT" ]]; then
    rm $DISK_IMAGE_SNAPSHOT
fi
exit $RC

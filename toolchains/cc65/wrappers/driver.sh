
#!/bin/bash --norc

PROG=$(basename "$0")
DRIVER_DIR=$(dirname "$0")
TOOLCHAIN="cc65_files"

ARGS=()
POSTARGS=()
case "${PROG}" in
    ar)
        PROG=ar65
        ;;
    cpp)
        PROG=cl65
        ;;
    gcc)
        PROG=cl65
        ;;
    ld)
        PROG=ld65
        ;;
    objdump)
        PROG=od65
        ;;
    *)
        echo "No equivalent program for $PROG" &>2
        exit 1
esac

exec "external/${TOOLCHAIN}/bin/${PROG}" \
    "${ARGS[@]}" \
    "$@"\
    "${POSTARGS[@]}"

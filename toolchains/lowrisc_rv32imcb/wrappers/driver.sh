
#!/bin/bash --norc

PROG=$(basename "$0")
DRIVER_DIR=$(dirname "$0")
TOOLCHAIN="lowrisc_rv32imcb_files"
PREFIX="riscv32-unknown-elf"

ARGS=()
POSTARGS=()
case "${PROG}" in
    gcc)
        ;;
esac

exec "external/${TOOLCHAIN}/bin/${PREFIX}-${PROG}" \
    "${ARGS[@]}" \
    "$@"\
    "${POSTARGS[@]}"

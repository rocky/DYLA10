# To use run program: bash trace.sh <program> <args>

trace_func() {
    echo "${BASH_SOURCE}:$1 ${FUNCNAME[0]}"
    echo "    $2"
}
set -o functrace
trap 'trace_func ${LINENO} "$BASH_COMMAND"  "$@"' DEBUG
. $*

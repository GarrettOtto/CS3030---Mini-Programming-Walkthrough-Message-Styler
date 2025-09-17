#!/usr/bin/env bash
# Name: Garrett | CS 3030 | Module 2 (Tutorial)

usage() {
  cat <<TXT
Usage: ${0##*/} [-h] [-n NAME]
Options:
  -h        Show this help message
  -n NAME   Greet NAME (default: stranger)

Examples:
  ${0##*/} -n Mackenzie
  ${0##*/} -h
TXT
}

# Task A
error() {
  echo "Error: $1"
  usage
  exit 2
}
# Task A

name="stranger"

# Task B
count=1
# Task B

# Task A & B)
while getopts ":hn:c:u" opt; do
  case "$opt" in
    h) usage; exit 0 ;;
    n) name="$OPTARG" ;;
    # Task B
    c) count="$OPTARG" ;;
    # Task C
    u) upper=true ;;
    \?) error "Unknown option: -$OPTARG" ;;
    :)  error "Missing argument for -$OPTARG" ;;
  esac
done
# Task A

# Task D
shift $((OPTIND-1))
custom="${1:-}"
msg="${custom:-Hello, $name!}"
# Task D

# Old check is no longer needed b/c getopts handles -h now
# if [[ "${1:-}" == "-h" ]]; then
#   usage
#   exit 0
# fi

# Task B
if ! [[ "$count" =~ ^[1-9][0-9]*$ ]]; then
error "COUNT must be a positive integer (>=1)."
fi

# Task C

for ((i=1; i<=count; i++)); do
   if [ "$upper" = true ]; then
       echo "$msg" | tr '[:lower:]' '[:upper:]'
   else
       echo "$msg"
   fi
done
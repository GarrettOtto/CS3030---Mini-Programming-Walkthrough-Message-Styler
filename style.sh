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

# Task A
while getopts ":hn:" opt; do
  case "$opt" in
    h) usage; exit 0 ;;
    n) name="$OPTARG" ;;
    \?) error "Unknown option: -$OPTARG" ;;
    :)  error "Missing argument for -$OPTARG" ;;
  esac
done
# Task A

if [[ "${1:-}" == "-h" ]]; then
  usage
  exit 0
fi

echo "Hello, $name!"

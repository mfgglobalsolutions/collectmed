#!/bin/bash
arg="$9"

usage(){
    echo "Usage: $0 1|2"
}

case $arg in
    1) $1 --host=$2 --port=$3 --user=$4 --password=$5 < $7;;
    2) $1 --host=$2 --port=$3 --user=$4 --password=$5 $6 < $8;;
    *) usage
esac
#!/bin/bash -e
function usage {
    echo "USAGE: $0 <file-dir> <var-name> <var_ip>"
    echo "  example: $0 /opt/chinacloud/hubble-broker/ {HUBBLE_BROKER_IP}  172.16.60.21 "
}

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    usage
    exit 1
fi

SRCDIR="$1"
VAR_NAME="$2"
HOST_IP="$3"

if [ ! -d $SRCDIR ]; then
    echo "ERROR: file directory does not exist:  $SRCDIR"
    exit 1
fi


 find  $SRCDIR  -type f |xargs sed  -i 's#'"$VAR_NAME"'#'"$HOST_IP"'#g'



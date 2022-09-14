#!/usr/bin/env bash
## ping -c 3 -t 9 192.168.1.3  | grep bytes | wc -l

## get location of this script
THISSCR=$(readlink -f $0)
THISDIR=$(dirname $THISSCR)


## ----------
function hping() {

    ## while getopts
    while getopts "h:s:" arg; do
        case $arg in
            h)
                HOST=${OPTARG}
            ;;
            *)
                break
            ;;
        esac
    done
    
    ## this should be quick enough
    OUT=$(ping -c 3 -t 5 ${HOST} | grep bytes | wc -l)

    if [ $OUT -gt 1 ] ; then
        echo "UP"
    else
        echo "DOWN"
    fi
}

HOST1=$(hping -h 192.168.1.1)
HOST2=$(hping -h 192.168.1.2)

if [ "$HOST1" == "DOWN" ] && [ "$HOST2" == "DOWN" ] ; then
    [ -x $THISDIR/disable-pldt-port-isolation.exp ] && exec $THISDIR/disable-pldt-port-isolation.exp
fi

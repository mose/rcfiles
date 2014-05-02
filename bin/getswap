#!/bin/bash
# Get current swap usage for all running processes
# must be run as root for /poc access

SUM=0
OVERALL=0
for DIR in `find /proc/ -maxdepth 1 -type d | egrep "^/proc/[0-9]"` ; do
  PID=`echo $DIR | cut -d / -f 3`
  PROGNAME=`ps -p $PID -o comm --no-headers`
  for SWAP in `grep Swap $DIR/smaps 2>/dev/null| awk '{ print $2 }'`
  do
    let SUM=$SUM+$SWAP
  done
  if [ $SUM != 0 ]; then
    echo "$SUM $PROGNAME $PID"
    let OVERALL=$OVERALL+$SUM
  fi
  SUM=0
done

echo "$OVERALL TOTAL"

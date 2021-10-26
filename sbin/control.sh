#!/bin/bash

d=`dirname "$0"` fullpath=`cd "$d"; pwd`/`basename "$0"`

run_server() {
  $d/../api.py &>> $d/../logs/log_api.log
}

run_api() {
  $d/../server.py
}

wait_and_fail_on_first() {
  local piderr=0 i
  while test $# -gt 0; do {
    dpid="$1"; shift
    wait $dpid || { piderr=$?; kill $@; return $piderr ;}
  } done
}

start() {

    touch $d/../logs/log_api.log
    touch $d/../logs/log_server.log
    touch $d/../tmp/start_sh.pid
    echo $$ >> $d/../tmp/start_sh.pid

    DATE_N=`date`
    echo "START SERVICE AT: "$DATE_N > $d/../logs/log_api.log
    echo "START SERVICE AT: "$DATE_N > $d/../logs/log_server.log
    echo $DATE_N" service is started"

    run_server & pid1=$!
    run_api & pid2=$!

    wait_and_fail_on_first $pid1 $pid2 || {
      echo "PID $dpid failed with code $?"
      echo "Other PIDs were killed"
    }

}

stop() {
    kill $(cat $d/../tmp/start_sh.pid) && echo "servicre is stopped" || echo "Process is not running."
    > $d/../tmp/start_sh.pid
    exit
}

case $1 in
  start|stop) "$1" ;;
esac

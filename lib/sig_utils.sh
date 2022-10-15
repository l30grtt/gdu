#!/bin/sh

kill_pid() {
    pid=$1
    [[ -z "$pid" ]] && echo "no pid provided" && return 1
    kill $pid || echo "could not kill $pid"
}

kill_pids() {
    pids_fetcher=$1
    program_name=$2
    pids_list=`$pids_fetcher`
    [[ -z "$pids_list" ]] && echo "no '$program_name' process currently running" && return 1
    for pid in $pids_list
    do :
        echo "killing '$program_name', pid=$pid"
        kill_pid $pid
    done
}

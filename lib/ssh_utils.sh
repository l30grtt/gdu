#!/bin/sh
# DIR_NAME=$(dirname -- "$0")
DIR_NAME=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
imports=( "sig_utils" )
for import in $imports
do :
    source "$DIR_NAME/$import.sh"
done

ssh_agent_start() {
    eval `ssh-agent -s`
}

ssh_agent_pids() {
    echo `ps -ef | grep ssh-agent | tr -s ''' ''' | cut -d''' ''' -f3`
}

ssh_agent_end() {
    kill_pids ssh_agent_pids 'ssh-agent'
}

ssh_agent_restart() {
    ssh_agent_end
    ssh_agent_start
}

ssh_agent_add_key() {
    ssh-add $1
}

ssh_handshake() {
    ssh -T $1
}

ssh_generate_keypair() {
    yes '' | ssh-keygen -t rsa -b 4096 -C $1 -f $2
}

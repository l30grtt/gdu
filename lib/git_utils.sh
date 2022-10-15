#!/bin/sh
imports=( "ssh_utils" )
DIR_NAME=$(dirname -- "$0")
for import in $imports
do :
    source "$DIR_NAME/$import.sh"
done

git_https_url() {
    provider="https://$1"
    repository="$2.git"
    echo "$provider/$repository"
}

git_ssh_url() {
    provider="git@$1"
    repository="$2.git"
    echo "$provider:$repository"
}

git_clone() {
    echo "Repository: $1"
    git clone $1 $2
    echo "Cloned $1 into $2"
}

git_clone_https() {
    git_clone `git_https_url $1 $2` $3
}

git_clone_ssh() {
    ssh_agent_restart
    ssh_agent_add_key $4
    ssh_handshake "git@$1"
    git_clone `git_ssh_url $1 $2` $3
    ssh_agent_end
}
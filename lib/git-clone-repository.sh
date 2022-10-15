#!/bin/sh
imports=( "git_utils" )
DIR_NAME=$(dirname -- "$0")
for import in $imports
do :
    source "$DIR_NAME/$import.sh"
done

GIT_PROVIDER=$1
GIT_REPOSITORY=$2
TARGET=$3
PROTOCOL=$4
[[ -z "$GIT_PROVIDER" ]]   && echo "Missing the 1st argument: git provider (e.g.: github.com)"         && exit
[[ -z "$GIT_REPOSITORY" ]] && echo "Missing the 2nd argument: git repository uri (e.g.: grtt0/grtt0)"  && exit
[[ -z "$TARGET" ]]         && echo "Missing the 3rd argument: repository target path (e.g.: ./temp)"   && exit
[[ -z "$PROTOCOL" ]]       && echo "Missing the 4th argument: communication protocol (i.e: https|ssh)" && exit

case $PROTOCOL in
    "https")
        git_clone_https \
                    $GIT_PROVIDER \
                    $GIT_REPOSITORY \
                    $TARGET
        ;;
    "ssh")
        SSH_KEY=$5
        [[ -z "$SSH_KEY" ]] && echo 'Missing the 5th argument: private key path (e.g.: $HOME/.ssh/id_rsa)' && exit
        git_clone_ssh \
                    $GIT_PROVIDER \
                    $GIT_REPOSITORY \
                    $TARGET \
                    $SSH_KEY
        ;;
    *)
        echo "invalid protocol: $PROTOCOL"
        ;;
esac

#!/bin/sh

GIT_PROVIDER="github.com"
GIT_REPOSITORY="l30grtt/gdu"
TARGET="$1/gdu_test"
PROTOCOL="https" # | "ssh"
# SSH_KEY="$HOME/.ssh/id_rsa"

./lib/git-clone-repository.sh \
    $GIT_PROVIDER \
    $GIT_REPOSITORY \
    $TARGET \
    $PROTOCOL # \
    # $SSH_KEY

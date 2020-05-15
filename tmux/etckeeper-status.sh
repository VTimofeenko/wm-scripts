#!/bin/sh
REPONAME="etc"
REPO_STATUS_COMMAND="etckeeper unclean"

if test "$(id -u)" -ne "0"; then
    # not a root, but that is fine
    exit 1
else
    if $REPO_STATUS_COMMAND ; then
        BG_COLOUR='colour9'
        STATUS='dirty'
    else
        BG_COLOUR='colour2'
        STATUS='clean'
    fi
fi

printf "#[fg=colour237, bg=%s] %s %s" "$BG_COLOUR" "$REPONAME" "$STATUS"

#!/bin/sh
REPONAME="config"
REPO_PATH="${HOME}/.config"
REPO_STATUS_COMMAND="git --work-tree=${REPO_PATH} --git-dir=${REPO_PATH}/.git diff-index --quiet HEAD --"

if ! git --work-tree="${REPO_PATH}" --git-dir="${REPO_PATH}"/.git diff-index --quiet HEAD --; then
	BG_COLOUR='colour9'
	STATUS='dirty'
else
	BG_COLOUR='colour2'
	STATUS='clean'
fi

printf "#[fg=colour237, bg=%s] %s %s" "$BG_COLOUR" "$REPONAME" "$STATUS"

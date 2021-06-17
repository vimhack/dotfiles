#!/bin/bash
# set_coderepo_localuser.sh
#
# To make a distinction between github user and gitlab user.
# Gitlab user will be use global user, and github user will be use local user by this script.
#
# Usage e.g.:
# ./set_coderepo_localuser.sh your_github_repo_dir_in_local

REPO_DIR=$1
USER_NAME=windvalley
USER_EMAIL=i@sre.im
SIGNING_KEY=320D1A307S7A4AEG

if [[ -z "$REPO_DIR" ]] || [[ ! -d "$REPO_DIR" ]]; then
    echo "Usage: $0 <repo_dir>"
    exit 1
fi

cd "$REPO_DIR" || exit 1

git config --local user.name "$USER_NAME"
git config --local user.email "$USER_EMAIL"
git config --local user.signingkey "$SIGNING_KEY"
git config --local commit.gpgsign true
git config --local -l

exit 0

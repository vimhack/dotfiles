#!/usr/bin/env bash
# change_github_commit_user.sh
#
# If your git repo have been committed with a wrong username and usermail,
# and have already been pushed to github.com, then just use this script to change that.
#
# e.g.:
#    Change OLD_ADDR/CORRECT_NAME/CORRECT_EMAIL variables to yours, then:
#    ./change_github_commit_user.sh your-reponame

#set -n
set -e
set -u

[[ -z "$1" ]] && {
    echo "Usage: $0 <repo_name>"
    exit 1
}

REPO_NAME="$1"
REPO_ADDR="git@github.com:windvalley/${REPO_NAME}.git"
OLD_EMAIL="xxx@xxx.com"
CORRECT_NAME="windvalley"
CORRECT_EMAIL="i@sre.im"

git clone --bare "$REPO_ADDR"

cd "${REPO_NAME}".git || exit 1

git filter-branch --env-filter "
if [[ \$GIT_COMMITTER_EMAIL = $OLD_EMAIL ]];then
    export GIT_COMMITTER_NAME=$CORRECT_NAME
    export GIT_COMMITTER_EMAIL=$CORRECT_EMAIL
fi

if [[ \$GIT_AUTHOR_EMAIL = $OLD_EMAIL ]];then
    export GIT_AUTHOR_NAME=$CORRECT_NAME
    export GIT_AUTHOR_EMAIL=$CORRECT_EMAIL
fi
" --tag-name-filter cat -- --branches --tags

git push --force --tags origin 'refs/heads/*'

cd ..
rm -rf "${REPO_NAME}".git

exit 0

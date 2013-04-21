export GHI_PAGER=less
export GIT_SANDBOX=~/projects/sandbox
export GIT_MERGE_AUTOEDIT=no

alias gci="git pull --rebase && rake && git push"

# Wrap git with hub
if [[ -f `command -v hub` ]] ; then alias git=hub ; fi

function g {
    if [[ $# > 0 ]]; then
        git "$@"
    else
        git status --short --branch
    fi
}

function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}

function sandbox() {
  cd $GIT_SANDBOX && git clone $1 && cd `last_modified`
}

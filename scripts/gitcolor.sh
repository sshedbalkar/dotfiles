#!/bin/bash

git_branch () {
    local GITDIR=$(git rev-parse --show-toplevel 2>/dev/null) # Get root directory of git repo
    if [[ "$GITDIR" != *'not a git repository'* ]]; then
        # Figure out the current branch, wrap in brackets and return it
        local BRANCH=`git branch 2>/dev/null | sed -n '/^\*/s/^\* //p'`
        if [ -n "$BRANCH" ]; then
            echo -e "$BRANCH"
        fi
    else
        echo -n "NotGitBranch"
    fi
}

parse_status () {
    local -n col=$2     # declare a nameref to the variable named by $2
    local -n bits=$3    # declare a nameref to the variable named by $3
    OLDIFS=$IFS
    local dirty deleted untracked newfile ahead renamed behind committed
    while IFS= read -r line ; do
        case "$line" in
            *modified:* | 'Changes not staged'*)
                dirty='*'
                col=$(tput setaf 1)
                ;;
            *deleted:*)
                deleted='x'
                col=$(tput setaf 1)
                ;;
            *'to be committed:'*)
                committed='!'
                col=$(tput setaf 6)
                ;;
            *'Untracked files:')
                untracked='?'
                col=$(tput setaf 6)
                ;;
            *'new file:'*)
                newfile='+'
                col=$(tput setaf 6)
                ;;
            *'Your branch is ahead of '*)
                ahead='^'
                col=$(tput setaf 6)
                ;;
            *'Your branch is behind of '*)
                behind='v'
                col=$(tput setaf 6)
                ;;
            *renamed:*)
                renamed='>'
                col=$(tput setaf 1)
                ;;
            *) ;;
        esac
    done < <(printf %s "$1")
    bits=$dirty$committed$deleted$untracked$newfile$ahead$renamed$behind
    if [[ -z "$bits" ]]; then
        col=$(tput setaf 2)
    else
        bits=" ${bits}"
    fi
    IFS=$OLDIFS
}

RESET=$(tput sgr0)
get_full_status() {
    git_status="$(git status 2>&1)"
    # printf '%s' "$git_status"
    if [[ "$git_status" != *'not a git repository'* ]]; then
        parse_status "$git_status" COLOR BITS
        printf '%s' " $COLOR($(git_branch)$BITS)$RESET"
    else
        printf '%s' ""
    fi
}
# echo -ne "$(get_full_status)" 



# unset dirty deleted untracked newfile ahead renamed
# git status --porcelain | while read -r status file; do
#   case "$status" in 
#     M) dirty='!' ; ;;
#     A) newfile='+' ; ;;
#     D) deleted='x' ; ;;
#     R) renamed='>' ; ;;
#     ??) untracked='?' ; ;; 
#   esac
# done
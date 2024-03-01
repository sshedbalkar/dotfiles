#!/usr/local/bin/bash

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
    local -n color=$2     # declare a nameref to the variable named by $2
    local -n bits=$3    # declare a nameref to the variable named by $3
    OLDIFS=$IFS
    local dirty deleted untracked newfile ahead renamed behind committed
    while IFS= read -r line ; do
        case "$line" in
            *modified:* | 'Changes not staged'*)  # RED
                dirty='*'
                color=$(tput setaf 1)
                # color=Tred
                ;;
            *deleted:*)  # RED
                deleted='x'
                color=$(tput setaf 1)
                # color=Tred
                ;;
            *'to be committed:'*)
                committed='!'
                color=$(tput setaf 190) # LIME YELLOW
                # color=Tpurple # PURPLE
                ;;
            *'Untracked files:') # CYAN
                untracked='?'
                color=$(tput setaf 6)
                # color=Tcyan
                ;;
            *'new file:'*) # YELLOW
                newfile='+'
                color=$(tput setaf 3)
                # color=Tyellow
                ;;
            *'Your branch is ahead of '*) # BLUE
                ahead='^'
                color=$(tput setaf 4)
                # color=Tblue
                ;;
            *'Your branch is behind '*) # MAGENTA
                behind='v'
                color=$(tput setaf 5)
                # color=Tmagenta
                ;;
            *renamed:*) # RED
                renamed='>'
                color=$(tput setaf 1)
                # color=Tred
                ;;
            *) ;;
        esac
    done < <(printf %s "$1")
    bits=$dirty$committed$deleted$untracked$newfile$ahead$renamed$behind
    if [[ -z "$bits" ]]; then # GREEN
        color=$(tput setaf 2)
        # color=Tgreen
    else
        bits="${bits}"
    fi
    IFS=$OLDIFS
}

RESET=$(tput sgr0)
get_full_status() {
    # local -n status_str=$1
    # Do this if not in Home directory
    if [[ ! "$PWD" -ef "$HOME" ]]; then
        git_status="$(git status 2>&1)"
        # printf '%s' "$git_status"
        if [[ "$git_status" != *'not a git repository'* ]]; then
            parse_status "$git_status" COLOR BITS
            # printf '%s' "$COLOR($(git_branch)$BITS)$RESET"
            # printf 'branch: %s, bits: %s' "$(git_branch)" "$BITS"
            # printf '%s' "$($COLOR \($(git_branch)$BITS\))"
            # printf '%s' "($(git_branch)$BITS)"
            plain_text='('$(git_branch)$BITS')'
            printf '%s' "$(Bblue $plain_text)"
            # printf '[\e[0;36m]'"($(git_branch)$BITS)"'[\e[m]'
            # printf "\[\e[0;36m\]($(git_branch)$BITS)\[\033[0m\]"
            # shopt -s checkwinsize
        else
            printf '%s' ""
        fi
    # else
        # echo "In home"
        # git_status=""
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

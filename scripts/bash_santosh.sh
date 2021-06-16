#!/usr/local/bin/bash

# echo "Sourcing bash_santosh.sh"
declare -a CONFIGFILES=(
    ~/dotfiles/scripts/persistentvars.sh 
    ~/.bash_aliases
    ~/dotfiles/scripts/bash_ptw.sh
    )

MYOS="$(uname)"
MYOSENV=$MYOS
case $MYOS in
  Linux)
	  _linOs="$(uname -r)"
        case $_linOs in
            *wsl* | *WSL*)
                # Linux in Windows WSL
                # export PATH=$PATH:/mnt/c/Windows/System32
                MYOSENV='WSL'
                ;;
            *) ;;
	    esac	  
	  ;;
  Darwin) alias vcpkg='/Volumes/Data/WorkWork/vcpkg/vcpkg'
        # ##### PYthon virtual env settings #####
        # We want to regularly go to our virtual environment directory
        export PYWORKON_HOME=/Volumes/Data/WorkWork/.virtualenvs/py
	    alias nano='/usr/local/bin/nano'
            alias vim='/usr/local/bin/vim'
	    alias bash='/usr/local/bin/bash'
	  ;;
  *) ;;
esac

# Start SSH Agent if it isn't running already
if [[ -z $SSH_AGENT_PID ]] || [ ! ps -p $SSH_AGENT_PID > /dev/null ]; then
    eval `ssh-agent -s` > /dev/null
fi

# Add SSH keys to the agent
# ssh-add ~/.ssh/sanoysyg_rsa.pem

# Load all config files
for file1 in ${CONFIGFILES[@]}; do
	if [ -r $file1 ]; then
        # Read the configfile if it's existing and readable
        source $file1
        # echo "sourced file: $file1"
	fi
done

# Automatic appending of Git status in Bash prompt
if [ "$GIT_STATUS_ADDED" -eq 0 ]; then
    if [ -f ~/dotfiles/scripts/gitcolor.sh ]; then
    source ~/dotfiles/scripts/gitcolor.sh
    PS1=$PS1'$(get_full_status)'
    elif [ -f /etc/bash_completion.d/git-promp ]; then
        source /etc/bash_completion.d/git-prompt
        export GIT_PS1_SHOWDIRTYSTATE=1
        PS1=$PS1'$(__git_ps1 "(%s)")'
    else
        parse_git_branch() {
            git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
        }
        PS1=$PS1'\[\033[32m\]$(parse_git_branch)\[\033[00m\]'
    fi
    GIT_STATUS_ADDED=1
fi

# Put this at the very end of PS1 to indicate the UID
PS1=$PS1'\$ '

case $MYOSENV in
    WSL)
        mntwsldrive () {
            if [ -z "$1" ]; then
                # display usage if no parameters given
                echo "Usage: mntwsldrive <Windows drive letter to mount>"
                return 1
            elif [ ${#1} -gt 1 ]; then
                echo "Invalid Windows drive letter"
                echo "Usage: mntwsldrive <Windows drive letter to mount>"
                return 1
            else
                local drive=$(tolower $1)
                if [ -d /mnt/$drive ]; then
                    echo "Drive $(toupper $drive): already mounted at /mnt/$drive/"
                    return 1
                else 
                    sudo mkdir /mnt/$drive
                    sudo mount -t drvfs $drive: /mnt/$drive
                    echo "Drive $(toupper $drive): mounted at /mnt/$drive/"
                fi
            fi
        }

        unmntwsldrive () {
            if [ -z "$1" ]; then
                # display usage if no parameters given
                echo "Usage: unmntwsldrive <Windows drive letter to unmount>"
                return 1
            elif [ ${#1} -gt 1 ]; then
                echo "Invalid Windows drive letter"
                echo "Usage: unmntwsldrive <Windows drive letter to unmount>"
                return 1
            else
                local drive=$(tolower $1)
                if [ -d /mnt/$drive ]; then
                    sudo umount /mnt/$drive
                    sudo rmdir /mnt/$drive
                    echo "Drive $(toupper $drive): successfully unmounted"
                else 
                    echo "Drive doesn't exist"
                fi
            fi
        }

        shopt -s cdable_vars
        export dirwinuser=/mnt/c/Users/santosh.shedbalkar

        ;;
esac

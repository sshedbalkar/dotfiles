#!/usr/local/bin/bash

alias freemem="free -mt"
alias mkdir="mkdir -pv"
alias wget="wget -c"
alias myip="curl https://ipecho.net/plain; echo"

extract () {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
        echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
        return 1
    else
        for n in $@
        do
        if [ -f "$n" ] ; then
            case "${n%,}" in
                *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                            tar xvf "$n"       ;;
                *.lzma)      unlzma ./"$n"      ;;
                *.bz2)       bunzip2 ./"$n"     ;;
                *.rar)       unrar x -ad ./"$n" ;;
                *.gz)        gunzip ./"$n"      ;;
                *.zip)       unzip ./"$n"       ;;
                *.z)         uncompress ./"$n"  ;;
                *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                            7z x ./"$n"        ;;
                *.xz)        unxz ./"$n"        ;;
                *.exe)       cabextract ./"$n"  ;;
                *)
                            echo "extract: '$n' - unknown archive method"
                            return 1
                            ;;
            esac
        else
            echo "'$n' - file does not exist"
            return 1
        fi
        done
    fi
}

# git () {
#     case $* in
#         status) shift 1; command git status -s ;;
#         *) command git "$@" ;;
#     esac
# }


tolower () {
    # sed -e 's/\(.*\)/\L\1/' <<< "$1"  # Doesn't work in MacOS
    tr '[:upper:]' '[:lower:]' <<< "$1"
}

toupper () {
    # sed -e 's/\(.*\)/\U\1/' <<< "$1"  # Doesn't work in MacOS
    tr '[:lower:]' '[:upper:]' <<< "$1"
}

addkey () {
    local identity_file
    if [ -z "$1" ]; then
        identity_file=~/.ssh/sanoysyg_rsa.pem
    else
        identity_file=$1
    fi
    # Check and add the identity file if it's not added already
    ssh-add -l |grep -q `ssh-keygen -lf $identity_file  | awk '{print $2}'` || ssh-add -q $identity_file
}

tproj () {
    ~/dotfiles/scripts/templproject.sh $@
}

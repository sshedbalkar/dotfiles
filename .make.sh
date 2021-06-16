#!/usr/local/bin/bash

############################
# .make.sh
# This script creates symlinks from the home directory to all files and directories in dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory

# List of files and directories not to create symlinks for
declare -a EXCLUDE_ARRAY=(".make.sh" ".git" ".DS_Store" ".gitignore" "README.md" ".config")

declare -A SPL_ARRAY=(["$dir/git"]="~/.config/git"
                    )
##########

FnCreateSymlink () {
    my_link=~/$1
    if [ -L ${my_link} ] ; then
       if [ -e ${my_link} ] ; then
          echo "Link exists: $my_link"
       else
          echo "Broken link, recreating: $my_link"
          rm $my_link
          ln -s $dir/$1 $my_link
       fi
    elif [ -e ${my_link} ] ; then
       echo "Not a link, recreating: $my_link"
       rm $my_link
       ln -s $dir/$1 $my_link
    else
       echo "Missing, creating new: $my_link"
       ln -s $dir/$1 $my_link
    fi
}

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

OLDIFS=$IFS
IFS=';'
for STR in "${EXCLUDE_ARRAY[@]}"; do
    read -ra ARR <<< "$STR"
    FILE=$(basename -- "${ARR[0]}")
    DIR_LOCAL=$(dirname -- "${ARR[0]}")
    DIR_REMOTE="${ARR[1]}"
    upload_file $FILE $DIR_LOCAL $DIR_REMOTE
done
IFS=$OLDIFS

for entry in * .[^.]*; do
    if [[ ! "${EXCLUDE_ARRAY[@]}" =~ "$entry" ]]; then
        if [[ -d $entry ]]; then
            # echo "Creating symlink for directory: $entry"
            # ln -s $dir/$entry ~/$entry
            FnCreateSymlink "$entry"
        elif [[ -f $entry ]]; then
            # echo "Creating symlink for file: $entry"
            # ln -s $dir/$entry ~/$entry
            FnCreateSymlink "$entry"
        else
            echo "$entry is invalid"
            exit 1
        fi
    fi
done

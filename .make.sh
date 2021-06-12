#!/usr/local/bin/bash

############################
# .make.sh
# This script creates symlinks from the home directory to all files and directories in dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory

# List of files and directories not to create symlinks for
array=(".make.sh" ".git" ".DS_Store" ".gitignore" "README.md")

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

for entry in * .[^.]*; do
    if [[ ! "${array[@]}" =~ "$entry" ]]; then
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

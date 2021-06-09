#!/bin/bash

############################
# .make.sh
# This script creates symlinks from the home directory to all files and directories in dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory

# List of files and directories not to create symlinks for
array=(".make.sh" ".git" ".DS_Store" ".gitignore" "README.md")

##########

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

for entry in * .[^.]*; do
    if [[ ! "${array[@]}" =~ "$entry" ]]; then
        if [[ -d $entry ]]; then
            echo "Creating symlink for directory: $entry"
            ln -s $dir/$entry ~/$entry
        elif [[ -f $entry ]]; then
            echo "Creating symlink for file: $entry"
            ln -s $dir/$entry ~/$entry
        else
            echo "$entry is invalid"
            exit 1
        fi
    fi
done
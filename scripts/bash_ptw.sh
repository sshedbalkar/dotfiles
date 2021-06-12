#!/bin/bash

ssh-add ~/.ssh/id_rsa_santosh.shedbalkar_ptw.pem

# RB Tools Bash Autocomplete
if [ -f ~/rbt_bash_autocomplete.sh ]; then
    source ~/rbt_bash_autocomplete.sh
fi

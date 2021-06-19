#!/usr/local/bin/bash

# Script to create a project from a project template on a remote repository

declare -A TEMPL_REPO=(
    [cpp]="https://github.com/sshedbalkar/np_cpp.git"
)

PROJ_NAME="_proj"
PROJ_TYPE=""

check_args() {
    if [ "$#" -eq 0 ]; then
        help_text
        exit 0
    else
        while test $# -gt 0; do
            case "$1" in
                -h|--help)
                    help_text
                    exit 0
                    ;;
                -t)
                    shift
                    if test $# -gt 0; then
                        PROJ_TYPE=$1
                        shift
                    fi
                    ;;
                --type*)
                    PROJ_TYPE=`echo $1 | sed -e 's/^[^=]*=//g'`
                    shift
                    ;;
                -n)
                    shift
                    if test $# -gt 0; then
                        PROJ_NAME=$1
                        shift
                    fi
                    ;;
                --name*)
                    PROJ_NAME=`echo $1 | sed -e 's/^[^=]*=//g'`
                    shift
                    ;;
                -d|--default)
                    PROJ_TYPE="cpp"
                    PROJ_NAME=$PROJ_TYPE$PROJ_NAME
                    break
                    ;;
                *)
                    break
                    ;;
            esac
        done
        PROJ_TYPE=$(tr '[:upper:]' '[:lower:]' <<< $PROJ_TYPE)
    fi
}

help_text() {
    PROJ_TYPE="cpp"
    echo "Script to create an instance of a project from a remote Git repo"
    echo ""
    echo "./$(basename $0) [options]"
    echo ""
    echo "options:"
    echo "-h, --help        Show brief help"
    echo "-t, --type=TYPE   Project type"
    echo "      (Supported types are: cpp)"
    echo "-n, --name        Name of the project"
    echo "-d, --default     Create a C++ project with the name: $PROJ_TYPE$PROJ_NAME"
}

clone_proj() {
    git clone ${TEMPL_REPO[$PROJ_TYPE]} .
    echo $?
    return $?
}

post_clone() {
    case $PROJ_TYPE in
        cpp)
            find . -type f -exec sed -i '' -e "s/np_cpp/$PROJ_NAME/g" {} \;
            ;;
        *)
            ;;
    esac
}
check_args "$@"

if [[ -v TEMPL_REPO[$PROJ_TYPE] ]]; then
    echo "Creating project: $PROJ_NAME of type: $PROJ_TYPE"
    mkdir $PROJ_NAME
    cd $PROJ_NAME
    if [ $(clone_proj) -eq 0 ]; then
        rm -rf ./.git
        post_clone
        echo "Success!"
    else
        echo "Failed!"
        cd ..
        rm -rf $PROJ_NAME
    fi
else
    echo "Error: Unsupported type: $PROJ_TYPE"
    exit 1
fi

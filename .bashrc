_myos="$(uname)"

case $_myos in
  Linux) alias ls='ls --color';;
  Darwin) alias ls='ls -G'
          alias ll='ls -alF'
          alias vcpkg='/Volumes/Data/WorkWork/vcpkg/vcpkg'

          # ##### PYthon virtual env settings #####
          # We want to regularly go to our virtual environment directory
          export PYWORKON_HOME=/Volumes/Data/WorkWork/.virtualenvs/py
          ;;
  *) ;;
esac

# RB Tools Bash Autocomplete
source ~/rbt_bash_autocomplete.sh

# function git() {
#   case $* in
#     -lg1 ) shift 1; command git log --all --decorate --oneline --graph ;;
#     -lg2 ) shift 1; command git log --graph --abbrev-commit --decorate --date=relative --all ;;
#     * ) command git "$@" ;;
#   esac
# }

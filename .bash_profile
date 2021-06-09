_myos="$(uname)"

case $_myos in
  Linux) alias ls='ls --color';;
  Darwin) alias ls='ls -G';;
  *) ;;
esac

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi

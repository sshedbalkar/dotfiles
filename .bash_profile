_myos="$(uname)"

case $_myos in
  Linux) alias ls='ls --color';;
  Darwin) alias ls='ls -G';;
  *) ;;
esac

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
   . "$HOME/.bashrc"
fi
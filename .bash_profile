alias fixsudo='sudo gsed -i "1s/^/auth sufficient pam_tid.so\n/" /etc/pam.d/sudo'
alias ls='ls --color=auto'
eval $(/opt/homebrew/opt/coreutils/libexec/gnubin/dircolors)
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

if [ -f $HOME/.bash_aliases ]
then
  . $HOME/.bash_aliases
fi

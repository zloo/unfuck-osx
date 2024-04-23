# Git branch in prompt.

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

alias fixsudo='sudo gsed -i "1s/^/auth sufficient pam_tid.so\n/" /etc/pam.d/sudo'
alias admin='open '\''jamfselfservice://content?entity=policy&id=32563&action=execute'\'
alias ls='ls --color=auto'
eval $(/opt/homebrew/opt/coreutils/libexec/gnubin/dircolors)
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH=/opt/homebrew/bin:$PATH

if [ -f $HOME/.bash_aliases ]
then
  . $HOME/.bash_aliases
fi

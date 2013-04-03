# terrible practice, but sure. why not?
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# prompt
export PS1="\u@\[\e[0;34m\]\h \[\e[0m\]\W$ "

# grep color-me-pretty
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# {pop,push}d shortened
alias p='pushd'
alias o='popd'

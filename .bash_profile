# terrible practice, but sure. why not?
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/bin/git-prompt.sh ]; then
    . ~/bin/git-prompt.sh
fi

if [ -f ~/bin/git-completion.bash ]; then
    . ~/bin/git-completion.bash
fi

export PATH=$PATH:~/bin

# prompt
export PS1="\u@\[\e[0;34m\]\h \[\e[0m\]\W\$(__git_ps1)$ "

# grep color-me-pretty
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# {pop,push}d shortened
alias p='pushd'
alias o='popd'

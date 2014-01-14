# gross
[ -f ~/.bashrc ] && source ~/.bashrc

# source 
[ -s ~/bin/git-prompt.sh ] && source ~/bin/git-prompt.sh
[ -s ~/bin/git-completion.bash ] && source ~/bin/git-completion.bash
[ -s ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm

# prompt
export PS1="\u@\[\e[0;34m\]\h \[\e[0m\]\W\$(__git_ps1)$ "

# grep color-me-pretty
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# {pop,push}d shortened
alias p='pushd'
alias o='popd'

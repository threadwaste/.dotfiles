# gross
[ -f ~/.bashrc ] && source ~/.bashrc

# source 
[ -s ~/bin/git-prompt.sh ] && source ~/bin/git-prompt.sh
[ -s ~/bin/git-completion.bash ] && source ~/bin/git-completion.bash

eval "$(rbenv init -)"

# prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export PROMPT_COMMAND='__git_ps1 "\u@\[\e[0;34m\]\h \[\e[0m\]\W" "\\\$ " " (⎇ %s)"'

# grep color-me-pretty
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# {pop,push}d shortened
alias p='pushd'
alias o='popd'

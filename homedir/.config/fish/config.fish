alias p pushd
alias o popd

alias grep 'grep --color=auto'
alias egrep 'egrep --color=auto'
alias fgrep 'fgrep --color=auto'

set fish_greeting

set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showcolorhints 1

set -g ___fish_git_prompt_char_upstream_prefix '   '
set -g ___fish_git_prompt_char_upstream_ahead '⇡'
set -g ___fish_git_prompt_char_upstream_behind '⇣'
set -g ___fish_git_prompt_char_upstream_diverged '⇅'
set -g ___fish_git_prompt_char_upstream_equal '✓'

set -g ___fish_git_prompt_char_stateseparator '   '
set -g ___fish_git_prompt_char_cleanstate '✓'
set -g ___fish_git_prompt_char_dirtystate '*'
set -g ___fish_git_prompt_char_invalidstate '✗'
set -g ___fish_git_prompt_char_stagedstate '+'
set -g ___fish_git_prompt_char_stashstate '$'
set -g ___fish_git_prompt_char_untrackedfiles '…'

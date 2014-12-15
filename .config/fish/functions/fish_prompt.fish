function fish_prompt
  # ~/workspace/project/src x fork   index-state   upstream-state
  # > zsh pure-style prompt

  if test $status -eq 0
    set c_status (set_color purple)
  else
    set c_status (set_color red)
  end

  set -l leader "❯ "

  echo (prompt_pwd) (__fish_git_prompt '⎇ %s')
  echo -ns $c_status $leader
end

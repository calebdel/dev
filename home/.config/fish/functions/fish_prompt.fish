function fish_prompt
  # set_color $fish_color_cwd
  set_color -o red
  echo -n (basename $PWD)
  echo -n " ➜ "
end

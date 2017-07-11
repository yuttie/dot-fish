function Nvim
  ~/dotfiles/launch-st -e nvim $argv >/dev/null 2>&1&
  disown
end

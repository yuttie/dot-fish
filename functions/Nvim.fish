function Nvim
  ~/.local/bin/term -e nvim $argv >/dev/null 2>&1 &
  disown
end

function Nvim
    ~/.local/bin/term start --cwd (pwd) nvim $argv >/dev/null 2>&1 &
    disown
end

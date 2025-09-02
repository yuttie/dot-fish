function open --wraps xdg-open
    command xdg-open $argv &> /dev/null & disown
end

function symmv --description 'Move a symlink by recreating it at destination and removing the original'
    if test (count $argv) -ne 2
        echo "Usage: symmv <symlink> <destination>"
        return 1
    end

    symcp $argv
    and rm -- "$argv[1]"
end

function symcp --description 'Recreate a relative symlink at destination pointing to the same target'
    if test (count $argv) -ne 2
        echo "Usage: symcp <symlink> <destination>"
        return 1
    end

    set src $argv[1]
    set dest $argv[2]

    if not test -L "$src"
        echo "Error: $src is not a symlink"
        return 1
    end

    set abs_target (realpath -- "$src")

    ln -srn -- "$abs_target" "$dest"
end

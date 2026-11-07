function ssh-terminfo --wraps ssh --description 'Install the local terminfo entry for $TERM on a remote host'
    if test (count $argv) -eq 0
        echo "usage: ssh-terminfo [ssh options] [user@]host" >&2
        return 1
    end

    infocmp -x $TERM | ssh $argv -- tic -x -
    set -l st $pipestatus

    if test $st[1] -ne 0
        echo "ssh-terminfo: no local terminfo entry for '$TERM'" >&2
        return $st[1]
    end
    return $st[2]
end

function rtma --argument-names remote session
    set -l hostname (hostname)
    ssh $remote -t "tmux new -d -s $session 2>/dev/null; tmux new -A -s $session/$hostname -t $session"
end

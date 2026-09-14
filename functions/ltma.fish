function ltma --argument-names session
    if test -z "$session"
	echo Session name must be specified.
        return 1
    end

    set -l args $argv[2..-1]

    # Create a main session if not exists
    if not tmux has-session -t "=$session"
        tmux new-session -d -s "$session" $args
        or return $status
    end

    # Client session
    set -l client_session "$session/client-$fish_pid-$(random)"
    tmux new-session -t "$session" -s "$client_session" $args
    set -l result $status

    # Kill the client session
    tmux kill-session -t "=$client_session"

    return $result
end

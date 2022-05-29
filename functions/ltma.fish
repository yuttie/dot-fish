function ltma --argument-names session
  if test -n "$session"
    tmux has-session -t="$session"
    and tmux attach-session -t="$session" $argv[2..-1]
    or tmux new-session -s $session $argv[2..-1]
  else
    echo Session name must be specified.
  end
end

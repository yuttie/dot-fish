function ltma --argument-names session
  tmux new -A -s $session $argv[2..-1]
end

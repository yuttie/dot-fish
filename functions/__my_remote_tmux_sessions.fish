function __my_remote_tmux_sessions --description 'available sessions' --argument-names remote
  ssh $remote 'tmux list-sessions -F "#S	#{session_windows} windows created: #{session_created_string} [#{session_width}x#{session_height}]#{session_attached}"' | sed 's/0$//;s/1$/ (attached)/' 2>/dev/null
end

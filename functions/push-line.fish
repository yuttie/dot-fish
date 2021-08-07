# Save this file to ~/.config/fish/functions/push-line.fish

# Bind the function by using this in ~/.config/fish/functions/fish_user_key_bindings.fish
# function fish_user_key_bindings
#   # For example alt+q
#   bind \eq push-line
# end

function push-line
  # Add an event handler for fish_postexec
  if test (count $fish_buffer_stack) -eq 0
    function _push-line_restore_line -e fish_postexec
      # Pop a commandline from the stack if possible
      if test (count $fish_buffer_stack) -gt 0
        commandline $fish_buffer_stack[-1]
        set -e fish_buffer_stack[-1]
      end
      # Unregister the event handler if nothing left in the stack
      if test (count $fish_buffer_stack) -eq 0
        functions -e _push-line_restore_line
      end
    end
  end

  # Push the current commandline
  set -g fish_buffer_stack $fish_buffer_stack (commandline | string collect)
  # Clear the command line
  commandline ''
  commandline -f repaint
end

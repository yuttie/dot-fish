complete -c rtma -x -n '__my_is_nth_token 1' -d 'hostname' -a "

(__fish_print_hostnames)

(
        #Prepend any username specified in the completion to the hostname
        echo (commandline -ct)|sed -ne 's/\(.*@\).*/\1/p'
)(__fish_print_hostnames)
"

complete -c rtma -x -n '__my_is_nth_token 2' -d 'target-session' -a '(__my_remote_tmux_sessions (__fish_print_cmd_args)[2])'

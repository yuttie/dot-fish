complete -x -c rtma -d Hostname -a "

(__fish_print_hostnames)

(
        #Prepend any username specified in the completion to the hostname
        echo (commandline -ct)|sed -ne 's/\(.*@\).*/\1/p'
)(__fish_print_hostnames)
"

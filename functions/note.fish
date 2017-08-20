function note
    switch (count $argv)
    case 0
        eval $EDITOR $NOTE_ROOT_DIR/(date +$NOTE_DEFAULT_DAILY_FILENAME)
    case 1
        set -l path $NOTE_ROOT_DIR/$argv[1]
        set -l fp NULL
        if test -d $path
            set fp $path/$NOTE_DEFAULT_FILENAME
        else if test -f $path
            set fp $path
        else if test -f $path$NOTE_DEFAULT_EXTENSION
            set fp $path$NOTE_DEFAULT_EXTENSION
        else
            # new file
            if echo -n $path | grep -q "\\$NOTE_DEFAULT_EXTENSION\$"
                set fp $path
            else
                set fp $path$NOTE_DEFAULT_EXTENSION
            end
        end
        eval $EDITOR $fp
    case '*'
        note (string join / $argv)
    end
end

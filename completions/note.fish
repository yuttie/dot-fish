complete -c note -x -d 'note' -a '(sh -c "cd $NOTE_ROOT_DIR; find . -regextype posix-extended -not -path \'*/\.*\' -iregex \'$NOTE_COMPLETION_REGEX\' | cut -c 3-")'

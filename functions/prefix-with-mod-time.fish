function prefix-with-mod-time -d "Prefix the name of a given file with its modification timestamp"
    set -l timestamp $(date --date=$(stat --format='%y' $argv[1]) '+%Y-%m-%d-%H%M%S')
    mv -v $argv[1] {$timestamp}-$argv[1]
end

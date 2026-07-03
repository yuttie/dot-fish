function apply_idle
    set -l pid $argv[1]
    chrt --pid --idle 0 $pid 2>/dev/null
    for child in $(pgrep --parent $pid)
        apply_idle $child
    end
end

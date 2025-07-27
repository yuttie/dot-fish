function freq-top
    watch -n1 'grep -h . /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq | sort -nr'
end


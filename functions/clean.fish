function clean
    if test (count $argv) -ne 1
	echo "Exactly one argument is required" 1>&2
	return 1
    end

    fd -HI -tf '^(.*~|nohup\.out|\.DS_Store|~\$.*|persp-auto-save.*|\.~\*#)$' -x rm -fv \; "$argv[1]"
end

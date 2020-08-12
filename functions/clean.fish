function clean
  if test (count $argv) -ne 1
    echo "Exactly one argument is required" 1>&2
    return 1
  end

  find "$argv[1]" -type f \( -name '*~' -o -name 'nohup.out' -o -name '.DS_Store' -o -name '~$*' -o -name 'persp-auto-save*' -o -name '.~*#' \) -exec rm -fv '{}' \;
end

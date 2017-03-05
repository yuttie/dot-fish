function __my_is_nth_token --description 'Test if just (N - 1) non-switch arguments have been specified' --argument-names n
  set -l num (count (__fish_print_cmd_args_without_options))
  test $n -eq $num
end

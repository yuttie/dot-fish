function __fzf_reverse_isearch_zsh
  set -l config_home $XDG_CONFIG_HOME
  test -z "$config_home"; and set -l config_home ~/.config

  python $config_home/fish/scripts/zsh_history.py | tac | __fzfcmd +s --tiebreak=index --toggle-sort=ctrl-r -q (commandline) $FZF_REVERSE_ISEARCH_OPTS | read -l select
  if not test -z $select
    commandline -rb (printf $select)
    commandline -f repaint
  end
end

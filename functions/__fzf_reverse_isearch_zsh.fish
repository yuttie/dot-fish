function __fzf_reverse_isearch_zsh
  set -l config_home $XDG_CONFIG_HOME
  test -z "$config_home"; and set config_home ~/.config

  set -l cache_home $XDG_CACHE_HOME
  test -z "$cache_home"; and set cache_home ~/.cache

  set -l fish_config $config_home/fish
  set -l fish_cache $cache_home/fish

  set -l timestamp (stat -c '%Y' ~/.zsh_history ^/dev/null     # for GNU's stat
                    or stat -f '%m' ~/.zsh_history ^/dev/null  # for FreeBSD's stat)

  # Update a cache file if necessary
  if not test -f $fish_cache/decoded_zsh_history-$timestamp
    echo -n "Updating cache..."

    for old_cache in $fish_cache/decoded_zsh_history-*
      rm -f $old_cache
    end
    python $fish_config/scripts/zsh_history.py >$fish_cache/decoded_zsh_history-$timestamp

    commandline -f repaint
  end

  tac $fish_cache/decoded_zsh_history-$timestamp | __fzfcmd +s --tiebreak=index --toggle-sort=ctrl-r -q (commandline) $FZF_REVERSE_ISEARCH_OPTS | read -l select
  if not test -z $select
    commandline -rb "$select"
    commandline -f repaint
  end
end

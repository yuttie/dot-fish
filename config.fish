set fish_greeting

# Set variables as global instead of universal because they have system-wide values
set -gx EDITOR nvim
set -gx LESS '--RAW-CONTROL-CHARS --ignore-case --chop-long-lines'
set -gx GPG_TTY (tty)

if type -q dircolors
  if test -f ~/.dir_colors
    eval (dircolors -c ~/.dir_colors)
  else
    eval (dircolors -c /etc/DIR_COLORS)
  end
end

if status --is-interactive
  # Theme
  set -g fish_prompt_pwd_dir_length 1
  set -g theme_display_user yes
  set -g default_user yuta
  set -g theme_color_scheme terminal2

  # Aliases
  alias vim="nvim"
  alias view="nvim -R"
  alias vimdiff="nvim -d"

  # Key bindings
  function fish_user_key_bindings
    bind \ct '__fzf_find_file'
    bind \cr '__fzf_reverse_isearch'
    bind \er '__fzf_reverse_isearch_zsh'
    bind \ex '__fzf_find_and_execute'
    bind \ed '__fzf_cd'
    bind \eD '__fzf_cd_with_hidden'

    if bind -M insert >/dev/null ^/dev/null
      bind -M insert \ct '__fzf_find_file'
      bind -M insert \cr '__fzf_reverse_isearch'
      bind -M insert \er '__fzf_reverse_isearch_zsh'
      bind -M insert \ex '__fzf_find_and_execute'
      bind -M insert \ed '__fzf_cd'
      bind -M insert \eD '__fzf_cd_with_hidden'
    end
  end
  fish_hybrid_key_bindings

  # Keychain
  # https://bugs.funtoo.org/browse/FL-2006
  keychain --eval --quiet --quick id_ed25519 id_rsa_4096 | source
end

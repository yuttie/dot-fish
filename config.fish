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
  set -g theme_color_scheme nord

  # Aliases
  alias vim="nvim"
  alias view="nvim -R"
  alias vimdiff="nvim -d"

  # Key bindings
  function fish_user_key_bindings
    bind \co '__fzf_find_file'
    bind \cr '__fzf_reverse_isearch'
    bind \er '__fzf_reverse_isearch_zsh'
    bind \ec '__fzf_cd'
    bind \eC '__fzf_cd --hidden'

    if bind -M insert >/dev/null 2>/dev/null
        bind -M insert \co '__fzf_find_file'
        bind -M insert \cr '__fzf_reverse_isearch'
        bind -M insert \er '__fzf_reverse_isearch_zsh'
        bind -M insert \ec '__fzf_cd'
        bind -M insert \eC '__fzf_cd --hidden'
    end
  end
  fish_hybrid_key_bindings

  # Keychain
  # https://bugs.funtoo.org/browse/FL-2006
  keychain --eval --quiet --quick id_ed25519 id_rsa_4096 | string replace 'set -x -U' 'set -x -g' | source
end

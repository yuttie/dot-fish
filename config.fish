set fish_greeting
set -g fish_prompt_pwd_dir_length 0
set -g theme_color_scheme terminal2

# Set variables as global instead of universal because they have system-wide values
set -gx EDITOR nvim
set -gx LESS '--RAW-CONTROL-CHARS --ignore-case --chop-long-lines'
set -gx GPG_TTY (tty)

if test -f ~/.dir_colors
  eval (dircolors -c ~/.dir_colors)
else
  eval (dircolors -c /etc/DIR_COLORS)
end

# Key bindings
function fish_user_key_bindings
  bind \ex '__fzf_find_and_execute'
  bind \ed '__fzf_cd'
  bind \eD '__fzf_cd_with_hidden'
end

# https://bugs.funtoo.org/browse/FL-2006
if status --is-interactive
  keychain --eval --quiet --quick id_ed25519 id_rsa_4096 | source
end

# OPAM configuration
source /home/yuta/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

set fish_greeting
set -g fish_prompt_pwd_dir_length 0
set -g theme_color_scheme terminal2

if status --is-login
  set PATH $PATH /usr/bin /sbin
end

# https://bugs.funtoo.org/browse/FL-2006
if status --is-interactive
  keychain --eval --quiet --quick id_ed25519 id_rsa_4096 | source
end

function eg
  set -q DISPLAY; or set DISPLAY :0
  emacs --display=$DISPLAY $argv&
end

function Nvim
  ~/dotfiles/launch-st -e nvim $argv&
end

# OPAM configuration
source /home/yuta/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

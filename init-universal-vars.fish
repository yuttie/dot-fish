for v in (set -U --names)
    set --erase -U "$v"
end

# Colors
set -U GROFF_NO_SGR 1

set -U LESS_TERMCAP_mb \e'[1;35m'       # begin blinking
set -U LESS_TERMCAP_md \e'[1;35m'       # begin bold
set -U LESS_TERMCAP_me \e'[0m'          # end mode
set -U LESS_TERMCAP_so \e'[7m'          # begin standout-mode - info box
set -U LESS_TERMCAP_se \e'[0m'          # end standout-mode
set -U LESS_TERMCAP_us \e'[4;32m'       # begin underline
set -U LESS_TERMCAP_ue \e'[0m'          # end underline


# Programming tools
set -U BC_ENV_ARGS "--mathlib $HOME/.bc"
set -U PYTHONSTARTUP "$HOME/.pythonstartup"
set -U PIPENV_SHELL_FANCY 1
set -U RUST_SRC_PATH "$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

# Node.js
set -l npm_packages "$HOME/.npm-packages"
set -U NODE_PATH "$npm_packages/lib/node_modules"
set -l additional_paths "$npm_packages/bin" $additional_paths

# Java
set -U _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=lcd'

# Paths
set -l prepend_paths \
    ~/.local/bin \
    ~/.poetry/bin \
    ~/.cargo/bin \
    ~/go/bin
set -l append_paths \
    (yarn global bin) \
    $npm_packages/bin

set -U fish_user_paths
for d in $prepend_paths[-1..1]
  if test -d $d
    set -U fish_user_paths "$d" $fish_user_paths
  end
end
for d in $append_paths
  if test -d $d
    set -U fish_user_paths $fish_user_paths "$d"
  end
end


# Plugins
set -U FZF_TMUX 1
set -U FZF_TMUX_OPTS '-p 80%'
set -U FZF_CTRL_T_OPTS '--exact'
set -U FZF_CTRL_R_OPTS '--exact'
set -U FZF_ALT_C_OPTS '--exact'
set -U __done_exclude 'git (?!push|pull|fetch)|^ '


# Others
set -U DICTIONARY 'en_US'
set -U FZF_DEFAULT_OPTS '--height=50% --reverse --color=fg:-1,bg:-1,fg+:15,bg+:-1,hl:12,hl+:10,prompt:10,pointer:9,info:13,marker:9,spinner:9,header:9'
set -U _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=lcd'


# Use default values
set -eU GREP_COLOR
set -eU GREP_COLORS

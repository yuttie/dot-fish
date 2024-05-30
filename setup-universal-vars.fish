for v in (set -U --names)
    set --erase -U "$v"
end

# Colors
set -Ux GROFF_NO_SGR 1

set -Ux LESS_TERMCAP_mb \e'[1;35m'       # begin blinking
set -Ux LESS_TERMCAP_md \e'[1;35m'       # begin bold
set -Ux LESS_TERMCAP_me \e'[0m'          # end mode
set -Ux LESS_TERMCAP_so \e'[7m'          # begin standout-mode - info box
set -Ux LESS_TERMCAP_se \e'[0m'          # end standout-mode
set -Ux LESS_TERMCAP_us \e'[4;32m'       # begin underline
set -Ux LESS_TERMCAP_ue \e'[0m'          # end underline


# Zip
set -Ux UNZIP "-O UTF-8"
set -Ux ZIPINFO "-O UTF-8"


# Programming tools
set -Ux BC_ENV_ARGS "--mathlib $HOME/.bc"
set -Ux PYTHONSTARTUP "$HOME/.pythonstartup"
set -Ux PIPENV_SHELL_FANCY 1
set -Ux RUST_SRC_PATH "$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

# Java
set -Ux _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=lcd'

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


# Universal variables for fish Plugins
set -U FZF_TMUX 1
set -U FZF_TMUX_OPTS '-p 80%'
set -U FZF_CTRL_T_OPTS '--exact'
set -U FZF_CTRL_R_OPTS '--exact'
set -U FZF_ALT_C_OPTS '--exact'
set -U __done_exclude 'git (?!push|pull|fetch)|^ '


# Others
set -Ux DICTIONARY 'en_US'
set -Ux FZF_DEFAULT_OPTS '--no-separator --reverse --color=fg:-1,bg:-1,fg+:15,bg+:8,hl:6,hl+:14,prompt:10,pointer:9,info:13,marker:9,spinner:9,header:9'


# Use default values
set -e GREP_COLOR
set -e GREP_COLORS

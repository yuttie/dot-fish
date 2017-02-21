# Paths
set -U fish_user_paths \
    ~/.gem/ruby/2.3.0/bin \
    ~/.cargo/bin \
    $NPM_PACKAGES/bin \
    ~/.local/bin


# Colors
set -Ux GROFF_NO_SGR 1

set -Ux LESS_TERMCAP_mb \e'[01;35m'      # begin blinking
set -Ux LESS_TERMCAP_md \e'[01;35m'      # begin bold
set -Ux LESS_TERMCAP_me \e'[0m'          # end mode
set -Ux LESS_TERMCAP_so \e'[01;46;37m'   # begin standout-mode - info box
set -Ux LESS_TERMCAP_se \e'[0m'          # end standout-mode
set -Ux LESS_TERMCAP_us \e'[01;32m'      # begin underline
set -Ux LESS_TERMCAP_ue \e'[0m'          # end underline


# Programming tools
set -Ux BC_ENV_ARGS "--mathlib $HOME/.bc"
set -Ux PYTHONSTARTUP "$HOME/.pythonstartup"
set -Ux RUST_SRC_PATH "$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
# Node.js
begin
  set -U NPM_PACKAGES "$HOME/.npm-packages"

  test -d "$NPM_PACKAGES"; or mkdir -p "$NPM_PACKAGES"
  grep 'prefix = ' ~/.npmrc >/dev/null; or echo 'prefix = ${HOME}/.npm-packages' >>~/.npmrc

  set -U fish_user_paths "$NPM_PACKAGES/bin" $fish_user_paths
end


# Others
set -Ux DICTIONARY 'en_US'
set -Ux FZF_DEFAULT_OPTS '--color=dark,fg:-1,bg:-1,hl:161,fg+:-1,bg+:7,hl+:161'


# Use default values
set -eU GREP_COLOR
set -eU GREP_COLORS

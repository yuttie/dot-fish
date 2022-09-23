curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Colors
set -Ux GROFF_NO_SGR 1

set -Ux LESS_TERMCAP_mb \e'[1;35m'       # begin blinking
set -Ux LESS_TERMCAP_md \e'[1;35m'       # begin bold
set -Ux LESS_TERMCAP_me \e'[0m'          # end mode
set -Ux LESS_TERMCAP_so \e'[7m'          # begin standout-mode - info box
set -Ux LESS_TERMCAP_se \e'[0m'          # end standout-mode
set -Ux LESS_TERMCAP_us \e'[4;32m'       # begin underline
set -Ux LESS_TERMCAP_ue \e'[0m'          # end underline


# Programming tools
set -Ux BC_ENV_ARGS "--mathlib $HOME/.bc"
set -Ux PYTHONSTARTUP "$HOME/.pythonstartup"
set -Ux PIPENV_SHELL_FANCY 1
set -Ux RUST_SRC_PATH "$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

# Node.js
set -l npm_packages "$HOME/.npm-packages"
set -Ux NODE_PATH "$npm_packages/lib/node_modules"
test -d "$npm_packages"; or mkdir -p "$npm_packages"
grep 'prefix = ' ~/.npmrc >/dev/null; or echo 'prefix = ~/.npm-packages' >>~/.npmrc
set -l additional_paths "$npm_packages/bin" $additional_paths

# Java
set -Ux _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=lcd'

# Paths
set -l prepend_paths \
    ~/.local/bin \
    ~/.poetry/bin \
    ~/.cargo/bin \
    ~/go/bin \
    /usr/local/texlive/2021/bin/x86_64-linux
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
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_DISABLE_KEYBINDINGS 1
set -U FZF_FIND_FILE_COMMAND "fd --type f . \$dir"
set -U FZF_FIND_FILE_OPTS '--exact'
set -U FZF_REVERSE_ISEARCH_OPTS '--exact'

set -U __done_exclude 'git (?!push|pull|fetch)|^ '


# Others
set -Ux DICTIONARY 'en_US'
set -Ux FZF_DEFAULT_OPTS '--height=50% --reverse --color=fg:-1,bg:-1,fg+:15,bg+:-1,hl:12,hl+:10,prompt:10,pointer:9,info:13,marker:9,spinner:9,header:9'
set -Ux _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=lcd'


# Use default values
set -eU GREP_COLOR
set -eU GREP_COLORS


# Install plugins
fisher install (cat ~/.config/fish/fish_plugins)


# Generate completions from man pages
fish_update_completions
rustup completions fish > ~/.config/fish/completions/rustup.fish

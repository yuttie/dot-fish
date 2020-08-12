curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

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
set -l additional_paths
set -l additional_paths ~/.local/bin $additional_paths
set -l additional_paths ~/.poetry/bin $additional_paths
set -l additional_paths ~/.cargo/bin $additional_paths
set -l additional_paths ~/go/bin $additional_paths
set -l additional_paths ~/.yarn/bin $additional_paths
set -l additional_paths $npm_packages/bin $additional_paths
set -l additional_paths ~/.gem/ruby/*/bin $additional_paths
set -l additional_paths /usr/local/texlive/2020/bin/x86_64-linux $additional_paths

set -U fish_user_paths
for d in $additional_paths
  if test -d $d
    set -U fish_user_paths "$d" $fish_user_paths
  end
end


# Plugins
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_DISABLE_KEYBINDINGS 1
set -U FZF_FIND_FILE_COMMAND "fd --type f . \$dir"
set -U FZF_FIND_FILE_OPTS '--exact'
set -U FZF_REVERSE_ISEARCH_OPTS '--exact'


# Others
set -Ux DICTIONARY 'en_US'
set -Ux FZF_DEFAULT_OPTS '--height=50% --reverse --color=dark,fg:8,bg:-1,hl:9,fg+:7,bg+:8,hl+:1,info:3,prompt:4,pointer:1,marker:5,spinner:3,header:4'
set -Ux _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=lcd'


# Use default values
set -eU GREP_COLOR
set -eU GREP_COLORS


# Install plugins
fisher


# Generate completions from man pages
fish_update_completions
rustup completions fish > ~/.config/fish/completions/rustup.fish

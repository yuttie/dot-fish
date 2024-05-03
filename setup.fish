curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Node.js
test -d "$npm_packages"; or mkdir -p "$npm_packages"
grep 'prefix = ' ~/.npmrc >/dev/null; or echo 'prefix = ~/.npm-packages' >>~/.npmrc

# Install plugins
fisher install (cat ~/.config/fish/fish_plugins)

# Generate completions from man pages
fish_update_completions
rustup completions fish > ~/.config/fish/completions/rustup.fish

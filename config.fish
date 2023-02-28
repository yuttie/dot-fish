set fish_greeting

# Homebrew
if test -d /opt/homebrew
  eval (/opt/homebrew/bin/brew shellenv)
end

# Set variables as global instead of universal because they have system-wide values
set -gx EDITOR nvim
set -gx LESS '--RAW-CONTROL-CHARS --ignore-case --chop-long-lines --no-lessopen'
set -gx GPG_TTY (tty)

if type -q dircolors
  if test -f ~/.dir_colors
    eval (dircolors -c ~/.dir_colors)
  else
    eval (dircolors -c /etc/DIR_COLORS)
  end
end

# Paths
# NOTE See /etc/env.d/99my-texlive for path settings for TeX Live

if status --is-interactive
  # Theme
  set -g fish_prompt_pwd_dir_length 1
  set -g theme_display_user yes
  set -g default_user yuta
  set -g theme_color_scheme nord

  # Aliases: Neovim
  alias nview="nvim -R"
  alias nvimdiff="nvim -d"
  alias nvimlite="nvim --clean --noplugin -n --cmd 'syntax off' --cmd 'set redrawtime=1' --cmd 'set nowrap' --cmd 'set eventignore+=FileType'"

  # Aliases: Color output
  alias ip="ip -color=auto"

  # Aliases: Misc.
  alias ls="exa"
  alias ll="exa -al"
  alias llt="exa -al --sort modified"
  alias lls="exa -al --sort size"
  alias xd="od -x"

  # Key bindings
  function fish_user_key_bindings
    # fzf
    source /usr/share/fzf/key-bindings.fish
    fzf_key_bindings

    # My own bindings
    bind \et 'commandline -i "(date +%Y-%m-%d-%H%M%S)"'
    bind \eq 'push-line'
    if bind -M insert >/dev/null 2>/dev/null
      bind -M insert \et 'commandline -i "(date +%Y-%m-%d-%H%M%S)"'
      bind -M insert \eq 'push-line'
    end
  end
  fish_hybrid_key_bindings

  # Keychain
  # https://bugs.funtoo.org/browse/FL-2006
  keychain --eval --quiet --quick id_ed25519 | string replace 'set -x -U' 'set -x -g' | source
end

starship init fish | source

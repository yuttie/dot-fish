set fish_greeting

# Homebrew
if test -d /opt/homebrew
    eval (/opt/homebrew/bin/brew shellenv)
end

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
    alias ls="eza"
    alias ll="eza -al"
    alias llt="eza -al --sort modified"
    alias lls="eza -al --sort size"
    alias xd="od -x"

    # Key bindings
    function fish_user_key_bindings
        # fzf
        if test -f /usr/share/fzf/key-bindings.fish
            source /usr/share/fzf/key-bindings.fish
        else if test -f /opt/homebrew/opt/fzf/shell/key-bindings.fish
            source /opt/homebrew/opt/fzf/shell/key-bindings.fish
        end
        fzf_key_bindings

        # My own bindings
        bind \et 'commandline -i "\$(date +%Y-%m-%d-%H%M%S)"'
        bind \eT 'commandline -i "$(date +%Y-%m-%d-%H%M%S)"'
        bind \eq 'push-line'
        if bind -M insert >/dev/null 2>/dev/null
            bind -M insert \et 'commandline -i "\$(date +%Y-%m-%d-%H%M%S)"'
            bind -M insert \eT 'commandline -i "$(date +%Y-%m-%d-%H%M%S)"'
            bind -M insert \eq 'push-line'
        end

        # https://github.com/fish-shell/fish-shell/issues/7203#issuecomment-660063522
        function forget
            set -l cmd (commandline | string collect)
            history delete --exact --case-sensitive -- $cmd
        end
        bind \cg forget
        if bind -M insert >/dev/null 2>/dev/null
            bind -M insert \cg forget
        end
    end
    fish_hybrid_key_bindings

    # Starship
    starship init fish | source

    # Keychain
    # https://bugs.funtoo.org/browse/FL-2006
    keychain --eval --quiet --quick id_ed25519 | string replace 'set -x -U' 'set -x -g' | source

    # Jumping between prompts (in collaboration with supported terminal, e.g. foot)
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end

    # Piping last command's output (in collaboration with supported terminal, e.g. foot)
    function foot_cmd_start --on-event fish_preexec
        echo -en "\e]133;C\e\\"
    end

    function foot_cmd_end --on-event fish_postexec
        echo -en "\e]133;D\e\\"
    end
end

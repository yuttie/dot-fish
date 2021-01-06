function cbcopy
    # Mostly copied from https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_clipboard_copy.fish
    if type -q pbcopy
        pbcopy
    else if set -q WAYLAND_DISPLAY; and type -q wl-copy
        wl-copy
    else if type -q xsel
        # Silence error so no error message shows up
        # if e.g. X isn't running.
        xsel --clipboard 2>/dev/null
    else if type -q xclip
        xclip -selection clipboard 2>/dev/null
    else if type -q clip.exe
        clip.exe
    end
end


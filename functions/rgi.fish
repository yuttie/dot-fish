function rgi
    # Derived from https://github.com/junegunn/fzf/blob/0476a65fca287a1cd17ae3cbdfd8155eb0fb40ad/ADVANCED.md?plain=1#L343
    # 1. Search for text in files using Ripgrep
    # 2. Interactively restart Ripgrep with reload action
    # 3. Open the file in Neovim
    set -l RG_PREFIX "rg --column --line-number --no-heading --color=always --smart-case "
    set -l INITIAL_QUERY $(string join ' ' -- $argv)
    fzf --ansi --disabled --query "$INITIAL_QUERY" \
        --bind "start:reload:$RG_PREFIX {q}" \
        --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
        --delimiter : \
        --preview 'bat --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
        --bind 'enter:become(nvim {1} +{2})'
end

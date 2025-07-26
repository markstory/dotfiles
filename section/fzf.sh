# Use the_silver_searcher for fzf
# this makes fzf faster, and exclude git guts and pyc.
export FZF_DEFAULT_COMMAND='ag --hidden --ignore "*.pyc" --ignore ".git" -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_gen_fzf_default_opts() {
    # tokyonight day theme.
    #local color00='#e9e9ed'
    #local color01='#d4d6e4'
    #local color02='#587539'
    #local color03='#8c6c3e'
    #local color04='#2e7de9'
    #local color05='#9854f1'
    #local color06='#007197'
    #local color07='#6172b0'
    #local color08='#a1a6c5'
    #local color09='#f52a65'
    #local color0A='#587539'
    #local color0B='#8c6c3e'
    #local color0C='#2e7de9'
    #local color0D='#9854f1'
    #local color0E='#007197'
    #local color0F='#3760bf'
    # local colorbg=$color01
    # local colorbgp=$color00
    # local spinner=$color0C
    # local hl=$color0D
    # local fg=$color04
    # local header=$color0D
    # local info=$color0A
    # local pointer=$color0C
    # local marker=$color0C
    # local fgp=$color06
    # local prompt=$color0A
    # local hlp=$color0D

    # Edge light
    local bg='#fafafa'
    local bgp='#fafafa'
    local spinner='#d05858'
    local prompt='#d05858'
    local hl='#5079be'
    local hlp='#3a8b84'
    local fg='#4b505b'
    local fgp='#4b505b'
    local header='#3a8b84'
    local info='#88909f'
    local pointer='#b05ccc'
    local marker='#608e32'

    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$bgp,bg:$bg,spinner:$spinner,hl:$hl"\
" --color=fg:$fg,header:$header,info:$info,pointer:$pointer"\
" --color=marker:$marker,fg+:$fgp,prompt:$prompt,hl+:$hlp"
}

_gen_fzf_default_opts

# Set fzf preview window theme (provided by bat) to match terminal and vim.
export BAT_THEME="ansi"

if [[ "$OS_NAME" = "Darwin" ]]; then
    # Add autocompletion for fzf
    [[ $- == *i* ]] && source "$BREW_PREFIX/opt/fzf/shell/completion.zsh" 2> /dev/null

    # Key bindings
    # ------------
    source "$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
fi

if [[ "$OS_NAME" = "Linux" ]]; then
    source <(fzf --zsh)
fi

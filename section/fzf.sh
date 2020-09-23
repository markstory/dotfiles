# Use the_silver_searcher for fzf
# this makes fzf faster, and exclude git guts and pyc.
export FZF_DEFAULT_COMMAND='ag --hidden --ignore "*.pyc" --ignore ".git" -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_gen_fzf_default_opts() {

local color00='#fafafa'
local color01='#f0f0f1'
local color02='#e5e5e6'
local color03='#a0a1a7'
local color04='#696c77'
local color05='#383a42'
local color06='#202227'
local color07='#090a0b'
local color08='#ca1243'
local color09='#d75f00'
local color0A='#c18401'
local color0B='#50a14f'
local color0C='#0184bc'
local color0D='#4078f2'
local color0E='#a626a4'
local color0F='#986801'

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

}

_gen_fzf_default_opts

# Set fzf preview window theme (provided by bat) to match terminal and vim.
export BAT_THEME="OneHalfLight"

if [[ "$OS_NAME" = "Darwin" ]]; then
    # Add autocompletion for fzf
    [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

    # Key bindings
    # ------------
    source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi

if [[ "$OS_NAME" = "Linux" ]]; then
    # Add autocompletion for fzf
    [[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

    # Key bindings
    # ------------
    source "$HOME/.fzf/shell/key-bindings.zsh"
fi

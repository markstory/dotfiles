# Use the_silver_searcher for fzf
# this makes fzf faster, and exclude git guts and pyc.
export FZF_DEFAULT_COMMAND='ag --hidden --ignore "*.pyc" --ignore ".git" -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
  --color=bg:#ffffff,bg+:#dadada,fg:#444444,fg+:#444444
  --color=hl:#af5f00,hl+:#af5f00,info:#008787
  --color=border:#dadada,prompt:#005faf,pointer:#005faf,header:#808080
'

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

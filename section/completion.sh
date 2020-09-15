# Completion confiugration
autoload -Uz compinit && compinit

# partial completion suggestions
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix 
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

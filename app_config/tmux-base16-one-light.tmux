#!/usr/bin/env bash

# Base16 One Light theme (personal fork)

# pane border and background
set -g pane-border-style fg='#e5e5e6'
set -g pane-active-border-style fg=2
set -g window-style 'fg=colour0,bg=#fafafa'
set -g window-active-style 'fg=colour0,bg=colour7'

# Message text
set -g message-style fg='#696c77',bg='#fafafa'

# Status bar
set -g status-style fg='#696c77',bg='#f0f0f1'

# Status left
# are we controlling tmux or the content of the panes?
set -g status-left "#[bg=#e5e5e6]#[fg=#696c77]#{?client_prefix,#[bg=2]#[fg=#ffffff],}   "

# Zoomed into a single pane?
set -ga status-left '#[bg=#f0f0f1]#[fg=7]#{?window_zoomed_flag, ↕ , }'

# window status formatting
#
# status left
set-window-option -g window-status-format "#[fg=#696c77,bg=default] #I #W "
set-window-option -g window-status-current-format "#[fg=colour4,bg=#f0f0f1]#[fg=7,bg=colour4]#I #W#[fg=colour4,bg=#f0f0f1]"

# status right
set -g status-right "#[fg=#e5e5e6,bg=#f0f0f1]#[fg=#696c77,bg=#e5e5e6] %a %H:%M %Y-%m-%d "

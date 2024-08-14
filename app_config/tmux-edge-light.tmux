#!/usr/bin/env bash

# Edge Light colors for Tmux

set -g mode-style "fg=#4b505b,bg=#eef1f4"

set -g message-style "fg=#4b505b,bg=#eef1f4"
set -g message-command-style "fg=#4b505b,bg=#eef1f4"

# Use border highlight on active pane
set -g pane-border-style "fg=#dde2e7"
set -g pane-active-border-style "fg=#b05ccc"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#4b505b,bg=#eef1f4"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#e9e9ed,nobold,nounderscore,noitalics]#[bg=#eef1f4]#{?client_prefix,#[fg=#b05ccc],#[fg=#bcc5cf]}󰻂 "

set -g status-right "#[fg=#2e7de9,bg=#eef1f4] #{prefix_highlight} #[fg=#dde2e7,bg=#eef1f4,nobold,nounderscore,noitalics]#[fg=#8790a0,bg=#dde2e7] %Y-%m-%d %I:%M %p #[fg=#608e32,nobold] #h "

# Make inactive panes darker so the active one is easier to find
set -g window-style "bg=#f5f5f5"
set -g window-active-style "bg=#fafafa"

setw -g window-status-activity-style "underscore,fg=#6172b0,bg=#d4d6e4"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#8790a0,bg=#eef1f4"
setw -g window-status-format "#[fg=#8790a0,bg=#eef1f4,nobold,nounderscore,noitalics] #[default]#I  #W#[fg=#8790a0,bg=#eef1f4,nobold,nounderscore,noitalics]  "

setw -g window-status-current-format "#[bg=#eef1f4,fg=#608e32,nobold,nounderscore,noitalics]#[fg=#fafafa,bg=#608e32]#I#[bg=#eef1f4,fg=#608e32,nobold,nounderscore,noitalics]#[fg=#b05ccc,bg=#fafafa,nobold,nounderscore,noitalics] #W  "


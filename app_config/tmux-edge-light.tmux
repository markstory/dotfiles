#!/usr/bin/env bash

# Edge Light colors for Tmux

set -g mode-style "fg=#4b505b,bg=#eef1f4"

set -g message-style "fg=#4b505b,bg=#eef1f4"
set -g message-command-style "fg=#4b505b,bg=#eef1f4"

set -g pane-border-style "fg=#dde2e7"
set -g pane-active-border-style "fg=#3a8b84"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#4b505b,bg=#eef1f4"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#e9e9ed,nobold,nounderscore,noitalics]#[bg=#eef1f4]#{?client_prefix,#[fg=#608e32],#[fg=#5079be]} "

set -g status-right "#[fg=#2e7de9,bg=#eef1f4] #{prefix_highlight} #[fg=#dde2e7,bg=#eef1f4,nobold,nounderscore,noitalics]#[fg=#8790a0,bg=#dde2e7] %Y-%m-%d %I:%M %p #[fg=#5079be,nobold] #h "

setw -g window-status-activity-style "underscore,fg=#6172b0,bg=#d4d6e4"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#8790a0,bg=#eef1f4"
setw -g window-status-format "#[fg=#8790a0,bg=#eef1f4,nobold,nounderscore,noitalics]#[default] #I #W #[fg=#8790a0,bg=#eef1f4,nobold,nounderscore,noitalics] "

setw -g window-status-current-format "#[bg=#eef1f4,fg=#b05ccc,nobold,nounderscore,noitalics]#[fg=#fafafa,bg=#b05ccc]#I #W#[fg=#b05ccc,bg=#eef1f4,nobold,nounderscore,noitalics]"
  

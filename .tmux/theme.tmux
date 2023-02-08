# ==============================================
# === THEME                                  ===
# ==============================================
# Pane border
set -g pane-border-style bg=default,fg=default

# Active pane border
set -g pane-active-border-style bg=green,fg=green

# Pane number indicator
set -g display-panes-colour red
set -g display-panes-active-colour red

# Clock mode
set -g clock-mode-colour red
set -g clock-mode-style 24

# Message
set -g message-style bg=default,fg=default

# Command message
set -g message-command-style bg=default,fg=default

# Mode
set -g mode-style bg=red,fg=default


# ==============================================
# === STATUS BAR                             ===
# ==============================================
set-option -g status-position top

set -g status-bg black
set -g status-fg cyan

#
# LEFT
#
set -g status-left-style bg=black,fg=green
set -g status-left-length 40
set -g status-left "#[fg=black,bg=green]  #S #[fg=green,bg=#3a3a3a]#[fg=yellow,bg=#3a3a3a] #I #[fg=cyan]#P #[fg=#3a3a3a,bg=black]"

#
# WINDOWS
#
set -g window-status-format " #I:#W#F "
set -g window-status-current-format "#[fg=black,bg=#3a3a3a]#[fg=green] #I:#W#F #[fg=#3a3a3a,bg=black]"
set -g window-status-separator ""
set -g status-justify centre

#
# RIGHT
#
set -g status-right-style bg=black,fg=cyan
set -g status-right-length 80
set -g status-right "#[fg=#3a3a3a,bg=black]#[fg=cyan,bg=#3a3a3a] ⚡︎#{battery_percentage} #[fg=green,bg=#3a3a3a]#[fg=black,bg=green] %H:%M:%S #[fg=#3a3a3a]%d-%b-%y "

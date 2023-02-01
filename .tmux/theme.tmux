# ==============================================
# === THEME                                  ===
# ==============================================
# Basic status bar colors
set -g status-bg black
set -g status-fg cyan

# Left side of status bar
set -g status-left-style bg=black,fg=green

# Right side of status bar
set -g status-right-style bg=black,fg=cyan

# Window status
set -g window-status-format " #I:#W#F "
set -g window-status-current-format " #I:#W#F "

# Current window status
set -g window-status-current-style bg=red,fg=black

# Window with activity status
set -g window-status-activity-style bg=yellow,fg=black

# Window separator
set -g window-status-separator ""

# Window status alignment
set -g status-justify centre

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
set -g status-left-length 40
set -g status-left "#S #[fg=white]» #[fg=yellow]#I #[fg=cyan]#P"
set -g status-right-length 80
set -g status-right "⚡︎#{battery_percentage} #[fg=white]« #[fg=default]#H #[fg=white]« #[fg=yellow]%H:%M:%S #[fg=green]%d-%b-%y"


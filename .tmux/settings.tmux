# ==============================================
# === CONFIGURATION                          ===
# ==============================================
set-option -g set-titles on
set-window-option -g mode-keys vi
set -g status-interval 1

# Colours
set -g allow-passthrough 1 # passthrough colour escape sequences
set-option -ga terminal-overrides ",xterm-256color:Tc"
set -g default-terminal "tmux-256color"


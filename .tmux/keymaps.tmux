# ==============================================
# === GENERAL BINDINGS                       ===
# ==============================================
# Reload source file
unbind r
bind r source-file ~/.tmux.conf

# Ensure split-windows nd new windows retain current path
bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
bind c new-window -c "#{pane_current_path}"

# Swap windows
bind-key -n C-S-Left swap-window -t -1
bind-key -n C-S-Right swap-window -t +1

source-file ~/.tmux/theme.tmux


# ==============================================
# === SSH NESTING                            ===
# ==============================================
# Source: https://raw.githubusercontent.com/samoshkin/tmux-config/master/tmux/tmux.conf
# We want to have single prefix key usable both for local and remote session
# Idea is to turn off all key bindings and prefix handling on local session,
# so that all keystrokes are passed to inner/remote session
# see: toggle on/off all keybindings · Issue #237 · tmux/tmux - https://github.com/tmux/tmux/issues/237
bind -T root F12 \
  set prefix None \;\
  set key-table off \;\
  set status-left '☞  Bound to Remote' \;\
  if -F '#{pane_in_mode}' 'send-keys -X cancel' \;\
  refresh-client -S \;\

bind -T off F12 \
  set -u prefix \;\
  set -u key-table \;\
  set -u status-left \;\
  refresh-client -S

# ==============================================
# === PLUGINS                                ===
# ==============================================
set -g @plugin 'tmux-plugins/tpm'

# Tools
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin '27medkamal/tmux-session-wizard'

# Usage and navigation
set -g @plugin 'fcsonline/tmux-thumbs'
set -g @plugin 'tmux-plugins/tmux-copycat'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'jaclu/tmux-menus'
set -g @plugin 'tmux-plugins/tmux-sessionist'

# Themes and status bar
set -g @plugin 'tmux-plugins/tmux-battery'

# ==============================================
# === PLUGIN SETTINGS                        ===
# ==============================================
# continuum
set -g @continuum-restore 'on'

# Copy cat - remap to similar to vim
set -g @copycat_next 't'
set -g @copycat_prev 'g'

# session-wizard
set -g @session-wizard 's'

# tmux-sessionist - unbind some keys
unbind g

# tmux-thumbs
set -g @thumbs-regexp-1 '[a-zA-Z0-9]+[\.a-zA-Z0-9]*@[a-z]+[\.a-zA-Z0-9]*' # Match emails

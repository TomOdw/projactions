#!/usr/bin/env bash

# Set path of script
PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

tmux bind-key C-e run-shell "$PLUGIN_DIR/projactions.sh Environment"
tmux bind-key C-i run-shell "$PLUGIN_DIR/projactions.sh Init"
tmux bind-key C-b run-shell "$PLUGIN_DIR/projactions.sh Build"
tmux bind-key C-f run-shell "$PLUGIN_DIR/projactions.sh Flash"
tmux bind-key C-m run-shell "$PLUGIN_DIR/projactions.sh Monitor"
tmux bind-key C-r run-shell "$PLUGIN_DIR/projactions.sh Run"
tmux bind-key C-d run-shell "$PLUGIN_DIR/projactions.sh Debug"
tmux bind-key C-c run-shell "$PLUGIN_DIR/projactions.sh Clean"

#!/usr/bin/env bash


# Check if one argument is passed
if ["$#" -ne 1]; then
   echo "projactions.sh: no argument passed."
fi

ACTION=$1

# Ensure we are running inside tmux
if [ -z "$TMUX" ]; then
    echo "projactions.sh: Error, this script must be run inside tmux."
    exit 1
fi

# Get the current active pane's command (e.g. bash, zsh, etc.)
CURRENT_CMD=$(tmux display-message -p '#{pane_current_command}')

# Get the current active pane's path
ACTIVE_PANE_PATH=$(tmux display-message -p "#{pane_current_path}")

# Get The active pane's id
ACTIVE_PANE_ID=$(tmux display-message -p "#{pane_id}")

# Get The active pane's title 
ACTIVE_PANE_TITLE=$(tmux display-message -p -t $ACTIVE_PANE_ID "#{pane_title}")

# List of commands that represent an idle shell
idle_shells=("bash" "zsh" "sh" "fish" "ksh" "tcsh")

# Check if CURRENT_CMD matches one of the idle shells
idle=false
for shell in "${idle_shells[@]}"; do
    if [[ "$CURRENT_CMD" == "$shell" ]]; then
        idle=true
        break
    fi
done

if [ "$idle" = true ]; then
   # Check if the target script exists and is executable
      if [ ! -f "$ACTIVE_PANE_PATH/.projactions/$ACTION" ]; then
       tmux display-message "projactions: Error: Actionscript not found, make sure you are in your project's root directory and the .projactions folder exists."
       exit 0
   fi

   # if [ ! -x "$ACTIVE_PANE_PATH/.projactions/$ACTION" ]; then
   #   tmux display-message "projactions: Error: Actionscript not executable. Try: chmod +x .projactions/$ACTION"
   #   exit 0
   # fi
    # Send the command to execute the action script in the current pane.
    # 'C-m' simulates pressing the Enter key.
    tmux send-keys -t $ACTIVE_PANE_ID ". .projactions/$ACTION" C-m
else
    tmux display-message "projactions: Error: Current pane is not idle (running '$CURRENT_CMD'). Aborting execution."
fi


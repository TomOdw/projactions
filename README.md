# projactions
## Project Actions

🚧 **Work in Progress** 🚧

`projactions` (Project Actions) is a tmux plugin that allows for project individual 
keybindings (e.g. Build/Run/Debug).

## Overview
`projactions` defines tmux keybindings, e.g. for performing a Build/ Run or Debug 
individual to a project.

- After plugin installation, `projactions` can be set up within any of your 
projects.
- Wihtin your project a `.projactions` folder must exist and must contain the 
shell scripts that should executed when pressing the keybind.
- The plugin is only executed if the active tmux pane is an idle terminal, it checks if 
no program is currently executed (e.g. nvim).

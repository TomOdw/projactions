# projactions
## Project Actions

🚧 **Work in Progress** 🚧

`projactions` (Project Actions) is a tmux plugin that enables project-specific 
keybindings (e.g. Build/Run/Debug).

## Overview
`projactions` defines tmux keybindings to perform project-specific actions such as 
building, running, or debugging your project.

- After installing the plugin, you can set up `projactions` within any of your projects.
- In your project directory, a `.projactions` folder must exist containing the shell 
scripts to be executed when a keybinding is pressed.
- The plugin executes an action only if the active tmux pane is an idle terminal. 
It checks to ensure that no program (e.g. nvim) is currently running in the pane.

## Prerequisites
- tmux

## Plugin Installation
1. **Clone the repository** into your tmux plugin folder (for example, `~/.config/tmux/plugins/`):
    ```sh
    git clone https://github.com/TomOdw/projactions.git ~/.config/tmux/plugins/projactions
    ```

2. **Add the plugin to your tmux configuration** by including the following line in your `tmux.conf`:
    ```sh
    run '~/.config/tmux/plugins/projactions/projactions.tmux'
    ```

3. **Reload your tmux configuration**:

    ```sh
    tmux source-file ~/.config/tmux/tmux.conf
    ```

## Project setup
1. **Copy one of the provided templates** to the root of your project:
    ```sh
    cd ~/myProject
    cp -r ~/.config/tmux/plugins/projactions/templates/default/.projactions .
    ```

2. **Edit the scripts** inside the `.projactions` folder to suit your project-specific needs.

## Usage
Make sure that:
- A terminal is open.
- The current directory is your project’s root.

Keybindings:
- `<prefix>C-e`: executes `.projactions/Environment`
- `<prefix>C-i`: executes `.projactions/Init`
- `<prefix>C-b`: executes `.projactions/Build`
- `<prefix>C-f`: executes `.projactions/Flash`
- `<prefix>C-m`: executes `.projactions/Monitor`
- `<prefix>C-r`: executes `.projactions/Run`
- `<prefix>C-d`: executes `.projactions/Debug`
- `<prefix>C-c`: executes `.projactions/Clean`

## Custom actions
You can add custom actions as follows:
1. Open the `projactions.tmux` file in an editor and add a new binding, for example:
    ```sh
    tmux bind-key <CUSTOM_KEY> run-shell "$PLUGIN_DIR/projactions.sh Custom"
    ```
2. Re-source your `tmux.conf` file.
3. In your project root, add the file `.projactions/Custom`.
4. Make it executable and add your custom commands to the file.

## Templates
Here is a brief description of the delivered templates:
### default
The default template provides empty actions that simply echo a message indicating nothing is implemented.
### dodenv-esp-idf
Uses my [.dodenv](https://github.com/TomOdw/.dodenv.git) repository, for setting up a 
development environment with dodenv ESP-IDF. The `Environment` action runs dodenv, with
an attatched device (`/dev/ttyUSB0`). The other actions are then perfomed within the opened
docker container (`Build`/`Flash`/`Monitor` etc. using the idf.py program). The key principle here is, 
that `dodenv` installs tmux and `projactions` within the docker container. You then trigger the 
plugin with double-pressing the tmux `<prefix>`

## Possible Issues
- **Pane running idle terminal session is not detected:** Currently the follwing terminals are supported: 
"bash" "zsh" "sh" "fish" "ksh" "tcsh", you can add your terminal program here, feel free to contact me, 
if a now commonly used terminal emulator is not listed, so that I can add it.

---

For contributions, issues, or feature requests, feel free to open an issue or submit a pull request. 🚀


# Dotfiles

This repository contains my personal configuration files (dotfiles) to customize and optimize my development environment.

## Tools and Technologies

- **i3wm**: Tiling window manager
- **Kitty**: Terminal emulator
- **Neovim**: Text editor
- **nvim-cmp**: Autocompletion plugin for Neovim
- **Tmux**: Terminal multiplexer for session management
- **NixOS**
## Included Configurations

- **i3wm**: Layout settings, keyboard shortcuts, and appearance.
- **Kitty**: Theme settings, fonts, and shortcuts.
- **Neovim**: Plugins, mappings, and general settings.
- **Fish**: Aliases, functions, and custom prompt.
- **Tmux**: Keybindings, themes, and CPU plugin.


### Extensions Firefox


```shell
cp extensions.json ~/.mozilla/firefox/$(ls -1 ~/.mozilla/firefox/ | grep -E '^[a-z0-9]+\.default(-release)?$' | head -n 1)
```

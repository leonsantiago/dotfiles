# dotfiles

My personal configuration files for Linux (Pop!_OS).  
This repository manages my setup using **GNU Stow** for easy symlink management and portability across machines.

## 🖥️ Overview

The setup includes:

- **Window managers**: i3, sway  
- **Status bars**: polybar, waybar  
- **Terminal emulator**: WezTerm  
- **Editor**: Neovim (LazyVim as a base)  
- **Compositor**: picom  
- **Launcher**: rofi  
- **Custom scripts**: stored in `~/bin`  

## ⚡ Requirements

- Linux (tested on **Pop!_OS 22.04**)  
- [GNU Stow](https://www.gnu.org/software/stow/)  
- [Neovim](https://neovim.io/) >= 0.9  
- [WezTerm](https://wezfurlong.org/wezterm/)  
- [Polybar](https://polybar.github.io/) / [Waybar](https://github.com/Alexays/Waybar)  
- [i3](https://i3wm.org/) / [sway](https://swaywm.org/)  
- [rofi](https://github.com/davatorium/rofi)  
- [picom](https://github.com/yshui/picom)  
- Fonts: JetBrainsMono Nerd Font, FiraCode Nerd Font  

## 🚀 Installation

Clone the repo into `~/dotfiles`:

```bash
git clone https://github.com/leonsantiago/dotfiles.git ~/dotfiles
cd ~/dotfiles

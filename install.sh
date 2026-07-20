#!/bin/bash

# dotfiles-cachyos automatic symlink installer

set -e

# Setup colors
NC='\033*0m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'

echo -e "${PURPLE}Lain Wired Edition - dotfiles installation script${NC}"
echo -e "--------------------------------------------------------"

# Function to safely create backup and symlink
safe_symlink() {
    local src="$1"
    local dest="$2"
    
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo -e "${YELLOW}Warning: $dest already exists.${NC}"
        echo -e "Backing up existing config to ${dest}.bak..."
        rm -rf "${dest}.bak"
        mv "$dest" "${dest}.bak"
    fi
    
    echo -e "${GREEN}Creating symlink: ${dest} -> ${src}${NC}"
    mkdir -p "$(dirname "$dest")"
    ln -sf "$src" "$dest"
}

# Get current script directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Kitty configuration
safe_symlink "${DOTFILES_DIR}/kitty" "${HOME}/.config/kitty"

# 2. Fish configuration
safe_symlink "${DOTFILES_DIR}/fish" "${HOME}/.config/fish"

# 3. VS Code settings
safe_symlink "${DOTFILES_DIR}/vscode/settings.json" "${HOME}/.config/Code/User/settings.json"

# 4. Alacritty config
safe_symlink "${DOTFILES_DIR}/alacritty" "${HOME}/.config/alacritty"

# 5. Fastfetch config
safe_symlink "${DOTFILES_DIR}/fastfetch" "${HOME}/.config/fastfetch"

# 6. Micro settings
safe_symlink "${DOTFILES_DIR}/micro" "${HOME}/.config/micro"

echo -e "--------------------------------------------------------"
echo -e "${GREEN}Installation successful!${NC}"
echo -e "System reboot bootloader and hotkeys require manual actions:"
echo -e "${CYAN}Keyd configuration:${NC} sudo cp ${DOTFILES_DIR}/keyd/default.conf /etc/keyd/default.conf && sudo systemctl restart keyd"
echo -e "${CYAN}Limine Bootloader:${NC} sudo cp ${DOTFILES_DIR}/limine/limine.conf /boot/limine.conf"

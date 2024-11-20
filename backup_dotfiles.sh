#!/bin/bash

# Destination directory for dotfiles
DEST_DIR="$HOME/git/dotfiles"

# Ensure the destination directory exists
mkdir -p "$DEST_DIR"

# List of individual dotfiles to copy
DOTFILES=(.tmux.conf .zshrc)

# Copy each individual dotfile
for file in "${DOTFILES[@]}"; do
    if [ -f "$HOME/$file" ]; then
        cp "$HOME/$file" "$DEST_DIR"
        echo "Copied $file to $DEST_DIR"
    else
        echo "Warning: $file not found"
    fi
done

# Directories to copy
DIRECTORIES=(.config/lvim .config/alacritty)

# Copy each directory
for dir in "${DIRECTORIES[@]}"; do
    if [ -d "$HOME/$dir" ]; then
        cp -R "$HOME/$dir" "$DEST_DIR"
        echo "Copied directory $dir to $DEST_DIR"
    else
        echo "Warning: Directory $dir not found"
    fi
done

echo "Dotfiles and directories copied to $DEST_DIR"

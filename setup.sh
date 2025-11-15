#!/bin/bash

echo "Setuping up dotfiles....."

echo "Setuping custom bashrc and profile....."
# setup custom bashrc
if ! grep -q "source ~/dotfiles/.bashrc_custom" ~/.bashrc; then
    echo "" >> ~/.bashrc
    echo "# Source custom configurations" >> ~/.bashrc
    echo "if [ -f ~/dotfiles/.bashrc_custom ]; then" >> ~/.bashrc
    echo "    source ~/dotfiles/.bashrc_custom" >> ~/.bashrc
    echo "fi" >> ~/.bashrc
    echo "✓ Added custom config to .bashrc"
else
    echo "✓ Custom config already in .bashrc"
fi

# setup custom profile
if ! grep -q "~/dotfiles/.profile_custom" ~/.profile; then
    echo "" >> ~/.profile
    echo "# Source custom profile" >> ~/.profile
    echo "if [ -f ~/dotfiles/.profile_custom ]; then" >> ~/.profile
    echo "    . ~/dotfiles/.profile_custom" >> ~/.profile
    echo "fi" >> ~/.profile
    echo "✓ Added custom config to .profile"
else
    echo "✓ Custom config already in .profile"
fi

source ~/.bashrc
source ~/.profile

echo "Setuping git config....."
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
echo "Finished setup of git config....."

echo "Reload the terminal....."

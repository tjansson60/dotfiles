#!/usr/bin/env sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install bash git git htop btop vim 
brew install stats # Menubar CPU stats
brew install z # cd extension for bash
brew install ripgrep  # cd extension for bash

# brew install flameshot # Fantastic screenshot tool

# Enable iTerm2 shell integration
# https://iterm2.com/documentation-shell-integration.html
curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash

# Set default shell to bash
BREW_BASH=/opt/homebrew/bin/bash
chsh -s "$BREW_BASH"
# chsh -s /bin/bash # builtin is outdated
echo 'export BASH_SILENCE_DEPRECATION_WARNING=1' >> ~/.bash_profile

# Ensure macOS Terminal automatically loads ~/.bashrc on startup
echo 'if [ -f ~/.bashrc ]; then source ~/.bashrc; fi' >> ~/.bash_profile

# Add Homebrew's modern Bash to allowed shells and switch to it

# Core dotfiles (.bashrc, .gitconfig, .screenrc, .vimrc)
ln -sf ~/code/dotfiles/.bashrc ~/.bashrc
ln -sf ~/code/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/code/dotfiles/.screenrc ~/.screenrc
ln -sf ~/code/dotfiles/.vimrc ~/.vimrc

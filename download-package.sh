#!/bin/bash

# Remember to give it root permission.
apt-get install -y vim
apt-get install -y git
apt-get install -y tmux
apt-get install -y tree
apt-get install -y gcc g++
apt-get install -y make
apt-get install -y cmake
apt-get install -y net-tools
apt-get install -y zsh

# Follow the setup guide in PacketCloud to configure `apt`
# before `sudo apt-get install git-lfs`

# oh-my-zsh installer, include several core plugins
# 1. installer
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# 2. plugin: zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#
# 3. plugin: zsh-syntax-highlighting (MacOS)
# brew install zsh-syntax-highlighting
#
# 4. theme: PowerLevel10K
# brew install powerlevel10k
# echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

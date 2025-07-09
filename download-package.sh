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
chsh -s $(which zsh)

# Optional packages
# apt-get install -y nvtop

# Follow the setup guide in PacketCloud to configure `apt`
# before `sudo apt-get install git-lfs`

# zsh plugins
# 1. oh-my-zsh installer
cd ~/Downloads; sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; popd

# 2. plugins (autosuggestions, autocomplete, syntax-highlighting)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete

# 3. theme: PowerLevel10K
# brew install powerlevel10k
# echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
#
# Manually (Change ZSH_THEME="powerlevel10k/powerlevel10k" in .zshrc)
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

#!/bin/bash

apt-get install vim -y
apt-get install git -y
apt-get install tmux -y
apt-get install tree -y
apt-get install gcc g++ -y
apt-get install make -y
apt-get install cmake -y

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

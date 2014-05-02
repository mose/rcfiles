#!/bin/bash

command -v curl &> /dev/null || sudo apt-get -y install curl
command -v git &> /dev/null || sudo apt-get -y install git

# install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
sed -i 's/# DISABLE_AUTO_UPDATE="true"/DISABLE_AUTO_UPDATE="true"/' $HOME/.zshrc
sed -i '/ZSH_THEME=/iPOWERLINE_SHOW_GIT_ON_RIGHT=1\nPOWERLINE_RIGHT_A=mixed' $HOME/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="mosepower"/' $HOME/.zshrc

# setup email forward
echo -n "What email should we forward to ? "
read email
echo "$email" > $HOME/.forward

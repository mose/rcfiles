#!/bin/bash

command -v curl &> /dev/null || sudo apt-get -y install curl
command -v git &> /dev/null || sudo apt-get -y install git

# install oh-my-zsh and custom themes
# https://github.com/robbyrussell/oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
curl -o $HOME/.oh-my-zsh/themes/mose.zsh-theme \
  https://raw.githubusercontent.com/mose/config/master/zsh/themes/mose.zsh-theme
curl -o $HOME/.oh-my-zsh/themes/mosepower.zsh-theme \
  https://raw.githubusercontent.com/mose/config/master/zsh/themes/mosepower.zsh-theme
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
sed -i 's/# DISABLE_AUTO_UPDATE="true"/DISABLE_AUTO_UPDATE="true"/' $HOME/.zshrc
sed -i '/ZSH_THEME=/iPOWERLINE_SHOW_GIT_ON_RIGHT=1\nPOWERLINE_RIGHT_A=mixed' $HOME/.zshrc
sed -i 's/ZSH_THEME="[^"]*"/ZSH_THEME="mose"/' $HOME/.zshrc

# custom zsh things
echo "
# Fix the oh-my-zsh ESC-. annoyance
bindkey '\e.' insert-last-word

export PATH=.:./bin:\$HOME/bin:\$PATH
export EDITOR=vim
export TERM=xterm-256color
export LANG=en_US.UTF-8
" >> .zshrc
(crontab -l; echo "0 0 * * 0 cd $HOME/.oh-my-zsh && git pull --rebase origin master &> /dev/null") | crontab

# change default shell for me
sudo usermod -s /bin/zsh $USER

# eddie vim
# https://github.com/kaochenlong/eddie-vim
sudo apt-get -y install exuberant-ctags
git clone git://github.com/kaochenlong/eddie-vim.git .vim
cd .vim
# fix https://github.com/kaochenlong/eddie-vim/issues/9
sed -i "s~git@github.com:~git://github.com/~" .gitmodules
# fix https://github.com/kaochenlong/eddie-vim/pull/7
git submodule add git://github.com/MarcWeber/vim-addon-mw-utils.git bundle/vim-addon-mw-utils
./update.sh
cd $HOME
ln -s .vim/easy-vimrc $HOME/.vimrc
(crontab -l; echo "05 0 * * 0 cd $HOME/.vim && ./update.sh &> /dev/null") | crontab

# setup email forward
echo -n "What email should we forward to ? "
read email
echo "$email" > $HOME/.forward

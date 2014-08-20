#!/bin/bash

TERM=xterm-256color
BG="187"
FG="black"

ask_color() {
  echo "What color do you want for the prompt on this machine ?"
  echo "(type 'h' for the list, fg.bg when ready where fg is foreground and bg background.)"
  read col

  if [[ "$col" == 'h' ]]; then
    for fgbg in 38 48 ; do
      for color in {0..256} ; do
        echo -en "\e[${fgbg};5;${color}m ${color}\t\e[0m"
        if [ $((($color + 1) % 10)) == 0 ] ; then
          echo
        fi
      done
      echo
    done
    ask_color
  else
    if [[ "$col" == '' ]]; then
      col='237.187'
    fi
    FG=${col%%.*}
    BG=${col#*.}
  fi
}

command -v curl &> /dev/null || sudo apt-get -y install curl
command -v git &> /dev/null || sudo apt-get -y install git

# install oh-my-zsh and custom themes
# https://github.com/robbyrussell/oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
curl -o $HOME/.oh-my-zsh/themes/mose.zsh-theme https://raw.githubusercontent.com/mose/rcfiles/master/zsh/themes/mose.zsh-theme
curl -o $HOME/.oh-my-zsh/themes/mosepower.zsh-theme https://raw.githubusercontent.com/mose/rcfiles/master/zsh/themes/mosepower.zsh-theme
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
sed -i 's/# DISABLE_AUTO_UPDATE="true"/DISABLE_AUTO_UPDATE="true"/' $HOME/.zshrc
ask_color
sed -i "/ZSH_THEME=/i POWERLINE_SHOW_GIT_ON_RIGHT=1\nPOWERLINE_RIGHT_A=mixed\nPOWERLINE_FG=${FG}\nPOWERLINE_BG=${BG}" $HOME/.zshrc
sed -i 's/ZSH_THEME="[^"]*"/ZSH_THEME="mosepower"/' $HOME/.zshrc

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

sudo apt-get -y install exuberant-ctags


# some bin/ utils
if [ ! -d bin ]; then
  mkdir bin
fi
if [ ! -f $HOME/bin/getswap ]; then
  curl -o $HOME/bin/getswap https://raw.githubusercontent.com/mose/rcfiles/master/bin/getswap
  chmod +x $HOME/bin/getswap
fi
if [ ! -f $HOME/bin/ps_mem ]; then
  curl -o $HOME/bin/ps_mem https://raw.githubusercontent.com/mose/rcfiles/master/bin/ps_mem
  chmod +x $HOME/bin/ps_mem
fi
if [ ! -f $HOME/bin/ps_mem.py ]; then
  curl -o $HOME/bin/ps_mem.py https://raw.githubusercontent.com/pixelb/ps_mem/master/ps_mem.py
  chmod +x $HOME/bin/ps_mem.py
fi

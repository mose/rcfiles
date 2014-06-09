rcfiles
======

Ok, mose, I know you lose your memory all the time, so I made yourself a small trick to live well with it. So when you get on a new server and supposing you get sudo you can just setup you shit all together with:

    bash <(curl https://raw.githubusercontent.com/mose/rcfiles/master/install.sh)

This will install

- oh-my-zsh with your custom themes
- eddie-vim with some whatever fixes it needs
- some binscripts that you always have to scp wherever you go
  - ps_mem give the real numbers about ram
  - getswap details what's up on swap usage

Local system
===

## Fish
sudo apt-add-repository ppa:fish-shell/release-2 && sudo apt-get update && sudo apt-get install fish
### oh-my-fish
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish
vim .config/fish/config.fish:
````
...

### Theme
set fish_theme ocean
...
````

## Terminator
sudo apt-get install terminator
### Color scheme
1. https://github.com/mbadolato/iTerm2-Color-Schemes (Solarized Darcula)
2. vim .config/terminator/config

##vim
###Vundle
1. https://github.com/gmarik/Vundle.vim
2. https://github.com/gmarik/Vundle.vim/wiki#faq4 -- non-posix shell

### vimawesome.com
1. http://vimawesome.com/plugin/vim-colors-solarized-sparks-fly
2. http://vimawesome.com/plugin/solarized

##Ruby
1. https://rvm.io/
 - https://rvm.io/integration/fish
2. http://bundler.io/

## Dnsmasq (never write /etc/hosts)
1. http://www.thekelleys.org.uk/dnsmasq/doc.html


-----
One love. One color scheme.
http://ethanschoonover.com/solarized

#Local:

## fish (friendly interactive shell)
````bash
sudo apt-add-repository ppa:fish-shell/release-2 && sudo apt-get update && sudo apt-get install fish
````
### oh-my-fish
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish
vim .config/fish/config.fish:
````fish
...

### Theme
set fish_theme ocean
...
````

## Terminator
````bash
sudo apt-get install terminator
````
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

## Atom (atom.io: A hackable text editor for the 21st Century)
````fish
wget https://atom.io/download/deb -o atom.deb; and sudo dpkg -i atom.deb

apm install vim-mode atom-terminal git-plus language-fish-shell markdown-writer php-twig solarized-dark-ui language-nginx
````
##Oracle Java
````fish
add-apt-repository ppa:webupd8team/java; and apt-get update; and apt-get install oracle-java8-installer; and java -version
````
-----
One love. One color scheme.
http://ethanschoonover.com/solarized

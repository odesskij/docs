#Local:

````bash
apt-get install git curl vim
````

## fish (friendly interactive shell)
````bash
sudo apt-add-repository ppa:fish-shell/release-2 && sudo apt-get update && sudo apt-get install fish
````
### oh-my-fish
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish

vim .config/fish/config.fish:
````fish
...
Theme 'ocean'
...
````

## Terminator
````bash
sudo apt-get install terminator
````
### Color scheme
1. https://github.com/mbadolato/iTerm2-Color-Schemes (Solarized Darcula)
2. vim .config/terminator/config

.config/terminator/config: 
````
[global_config]
  title_transmit_bg_color = "#4070b2"
  inactive_color_offset = 0.84
[keybindings]
[profiles]
  [[default]]
    palette = "#25292a:#f24840:#629655:#b68800:#2075c7:#797fd4:#15968d:#d2d8d9:#25292a:#f24840:#629655:#b68800:#2075c7:#797fd4:#15968d:#d2d8d9"
    background_darkness = 0.9
    background_type = transparent
    background_image = None
    cursor_color = "#708284"
    foreground_color = "#d2d8d9"
    background_color = "#3d3f41"
    scrollback_infinite = True
[layouts]
  [[default]]
    [[[child1]]]
      type = Terminal
      parent = window0
    [[[window0]]]
      type = Window
      parent = ""
[plugins]

````

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
https://atom.io/ -> download .deb
````fish
apm install vim-mode atom-terminal git-plus language-fish-shell markdown-writer php-twig solarized-dark-ui language-nginx
````
##Oracle Java
````fish
add-apt-repository ppa:webupd8team/java; and apt-get update; and apt-get install oracle-java8-installer; and java -version
````
-----
One love. One color scheme.
http://ethanschoonover.com/solarized

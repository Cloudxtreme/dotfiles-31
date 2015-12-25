# utility
alias reload="source ~/.zshrc"
alias ez="vim ~/.zshrc && reload" # Edit default zsh config file and reload
alias ea="vim ~/.oh-my-zsh/custom/aliases.zsh && reload" # edit custom aliases and functions config and reload
alias eg="vim ~/.oh-my-zsh/custom/gitaliases.zsh && reload" # edit custom git aliases and functions config and reload
alias et="vim ~/.tmux.conf" # edit tmux configuration
alias vimrc="vim ~/.vimrc" # Edit vimrc
alias coda='open -a "Coda 2"' # open in coda 2
alias tree1='tree -L 1' # show directory structure one level
alias tree2='tree -L 2' # show directory structure two level
alias tree3='tree -L 3' # show directory sturcture 3 level
alias tree4='tree -L 4'
alias :q="exit"
alias rub="./rub"
alias mongobrew="mongod --config /usr/local/etc/mongod.conf"
# CDPATH
CDPATH=:/Volumes/Data/Download/:/Volumes/Data/Documents/elearningfriendly/:/Volumes/Data/coding/

# Finder aliases
alias ll="ls -lhFA"
alias l="ls -lhF"
alias l.="ls -dl .[^.]*"

alias dl="cd /Volumes/Data/Download/"
alias dc="cd /Volumes/Data/Documents/"
alias sb="cd ~/Documents/sandbox"
alias cdd="cd -"
alias c="clear"
alias cl="clear; l"
alias h="history"

# NPM
alias npmlsg="npm list -g --depth=0"
alias npmls="npm list --depth=0"

# Functions
function cdl() {
    cd $1; l
} # enter a directory and list its contents

function ag() {
    alias | grep "$1"
} # grep related alias

function fd() {
    find . -iname "$1" $2
}

alias shutdown="sudo shutdown -h now"
alias reboot="sudo shutdown -r now"
alias e="exit"
alias o="open ."
alias md="mkdir -p"
alias rm="rm -i"

# Functions
function take() {
    mkdir $1
    cd $1
} # create a new directory and cd into that directory

alias tuts="cd /Volumes/MB3/tutorials/Tutsplus/; lg"
alias lynda="cd /Volumes/MB3/tutorials/Lynda.com/; lg"

# Site & Server
alias sites="cd ~/Sites/"
alias opensite="open http://localhost"

# Misc.
alias openelaine="open vnc://192.168.0.5:5900"

# Processes
alias tu="top -o cpu" # cpu
alias tm="top -o vsize" # memory
alias vhttpd="ps aux | grep httpd"
alias vmysql="ps aux | grep mysql"

function killnamed() {
    ps ax | grep $1 | cut -d ' ' -f 1 | xargs kill 
}

# Apache
alias restartapache="sudo apachectl restart"
alias stopapache="sudo apachectl stop"
alias startapache="sudo apachectl start"

# Google Chrome Download
function googledownload() {
    wget -O googlechrome-stable.dmg https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg 
    #wget -O GoogleChrome-beta64.dmg https://dl.google.com/chrome/mac/beta/GoogleChrome.dmg
    #wget -O GoogleChrome-canary.dmg https://storage.googleapis.com/chrome-canary/GoogleChromeCanary.dmg
}

# Misc.
function zipr() {
    zip -r $1.zip $*
}

function tarz() {
    tar -czvf $1.tgz $* 
}

function tarx() {
    tar -xzvf $1
}

function lg () {
    clear
    ll | grep -i "$1"
} # list the directories with the keyword

# New site based on my starter template
function newSite() {
if [ ! -d /Volumes/Data/Download/coding/$1 ]
  then
    mkdir /Volumes/Data/Download/coding/$1
  	git clone git@github.com:samumist/starter_stylus.git /Volumes/Data/Download/coding/$1
  	subl /Volumes/Data/Download/coding/$1
  else
  	echo "$1 is already in use, please choose another name."
fi
}

# update documentation site
function documentation() {
    cd /Volumes/Data/Documents/docs/documentation/
    php generate.php
    cp -r static ~/Sites/
    open http://localhost/static/

}

# copy .csv template to course json directory
function cpcsv() {
    cp /Volumes/Data/project/course/csveat/p101.csv .
}

function cpgitignore {
    cp ~/.gitignore_global ./.gitignore
}

# Pomodoro Daily log
function pomodorodaily {
  cd /Volumes/Data/Documents/docs/pomodoro/
  touch log.md
  vim log.md
}

# Create a new file and open it with Mvim
function new {
  touch $1
  mvim $1
}

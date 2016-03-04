### General Aliaes {{{1

# Dotfiles editing {{{2
alias reload="source ~/.zshrc"
alias ez="$EDITOR ~/.zshrc && reload" # Edit default zsh config file and reload
alias ea="$EDITOR ~/bin/dotfiles/custom/aliases.zsh && reload" # edit custom aliases and functions config and reload
alias eg="$EDITOR ~/bin/dotfiles/custom/gitaliases.zsh && reload" # edit custom git aliases and functions config and reload
alias et="$EDITOR ~/.tmux.conf" # edit tmux configuration
alias vimrc="$EDITOR ~/.vimrc" # Edit vimrc

# Finder aliases {{{2
alias ll="ls -lhFA"
alias l="ls -lhF"
alias l.="ls -dl .[^.]*"

alias dl="cd /Volumes/Data/Download/"
alias dc="cd /Volumes/Data/Documents/"
alias sb="cd ~/Documents/sandbox"
alias tuts="cd /Volumes/MB3/tutorials/Tutsplus/; lg" # list directories that contains the keyword in given direcectory. e.g. tuts $1
alias lynda="cd /Volumes/MB3/tutorials/Lynda.com/; lg"
alias treehouse="cd /Volumes/Data/Documents/tutorial/treehouse; lg"
alias cdd="cd -" # go to previious directory
alias tad="ta 0" # go to the default tmux session
alias ta1="ta sys" # go to the default tmux session
alias tk1="tkss sys" # go to the default tmux session
alias ta2="ta work" # go to the default tmux session
alias tk2="tkss work" # go to the default tmux session

# Terminal commands {{{2
alias c="clear"
alias clera="clear"
alias cl="clear; l"
# alias h="history" # use zsh plugin history instead

alias e="exit"
alias :q="exit"
alias ,q="exit"
alias qall="tkss work && tkss sys"
alias o="open ."
alias md="mkdir -p"
alias rm="rm -i"

alias t='tail -f'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L='| less'
alias -g M='| most'

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias p='ps -f'



alias ag='ag --path-to-agignore=~/.agignore' # global agignore file
alias mux="tmuxinator" # Important for auto completion for tmuxinator
# Tree Commands {{{2
alias tree='tree -C'
alias tree1='tree -L 1' # show directory structure one level
alias tree2='tree -L 2' # show directory structure two level
alias tree3='tree -L 3' # show directory sturcture 3 level
alias tree4='tree -L 4'

# System aliases {{{2
alias shutdown="sudo shutdown -h now"
alias reboot="sudo shutdown -r now"

alias tu="top -o cpu" # cpu
alias tm="top -o vsize" # memory
alias vhttpd="ps aux | grep httpd"
alias vmysql="ps aux | grep mysql"

# Misc. {{{2
alias openelaine="open vnc://192.168.0.5:5900"
alias plex="sudo ~/Applications/PlexConnect/PlexConnect.py" # Run PlexConnect

# MPV{{{2
alias m="mpv --no-audio-display"
alias ms="mpv --shuffle --no-audio-display *"
alias mp="mpv --no-audio-display --playlist=playlist.m3u"
alias msp="mpv --shuffle --no-audio-display --playlist=playlist.m3u"

# Youtube-DL
alias udl1080='proxychains4 youtube-dl -f 137'
alias udl='proxychains4 youtube-dl -f 22'
alias udl480='proxychains4 youtube-dl -f 135'
alias udl360='proxychains4 youtube-dl -f 18'
alias udlf='proxychains4 youtube-dl -F'

# Greg {{{2
alias greg='proxychains4 greg'
### Development aliases {{{1
alias rub="./rub"
alias mongobrew="mongod --config /usr/local/etc/mongod.conf"

# NPM {{{2
alias npmlsg="npm list -g --depth=0"
alias npmls="npm list --depth=0"

# Site & Server {{{2
alias sites="cd ~/Sites/"
alias opensite="open http://localhost"

# Apache {{{2
alias restartapache="sudo apachectl restart"
alias stopapache="sudo apachectl stop"
alias startapache="sudo apachectl start"

### Functions {{{1

## Directory {{{2
# Enter a directory and list its contents
function cdl() {
  cd $1
  clear
  l
}

# create a new directory and cd into that directory
function take() {
mkdir $1
cd $1
}

## Grep and Find {{{2
# grep related alias
function agrep() {
alias | grep "$1"
}

# Find string $1 in file $2
function fd() {
find . -iname "$1" $2
}

# list the directories with the keyword
function lg () {
clear
ll | grep -i "$1"
}

# Kill named process
function killnamed() {
ps ax | grep $1 | cut -d ' ' -f 1 | xargs kill
}

# grep named process
function psg() {
  ps aux | grep $1
}

## Archives {{{2
function zipr() {
zip -r $1.zip $*
}

function tarz() {
tar -czvf $1.tgz $*
}

function tarx() {
tar -xzvf $1
}

## Misc. {{{2

# Download google chrome browser
function googledownload() {
proxychains4 wget -O googlechrome-stable.dmg https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
}

# Download google canary browser
function canarydownload() {
proxychains4 wget -O GoogleChrome-canary.dmg https://storage.googleapis.com/chrome-canary/GoogleChromeCanary.dmg
}

# Create a playlist in the current directory
function plist() {
find . -type f \( -iname "*.$1" -or -iname "*.$2" -or -iname "*.$3" \) > playlist.m3u
}
## Workflow {{{2
# update documentation site
function documentation() {
cd /Volumes/Data/Documents/docs/documentation/
./generate
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

# Create a new file and open it with vim
function new {
touch $1
vim $1
}

# New site based on my starter template
# function newSite() {
# if [ ! -d /Volumes/Data/Download/coding/$1 ]
# then
#   mkdir /Volumes/Data/Download/coding/$1
#   git clone git@github.com:samumist/starter_stylus.git /Volumes/Data/Download/coding/$1
#   subl /Volumes/Data/Download/coding/$1
# else
#   echo "$1 is already in use, please choose another name."
# fi
# }


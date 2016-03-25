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
alias acache='apt-cache search --names-only'
alias td='tmux -f $HOME/.oh-my-zsh/custom/tmux.default.conf attach'
alias vimnilla='vim -u ~/.config/vanilla.vim'

# Shadowsocks {{{2
alias sslocal="sslocal -c ~/.config/shadowsocks/config.json"

# MPV{{{2
alias mpv="mpv --no-audio-display"
alias mpvs="mpv --shuffle --no-audio-display *"
alias mpvlist="mpv --no-audio-display --playlist=playlist.m3u"
alias mpvslist="mpv --shuffle --no-audio-display --playlist=playlist.m3u"

# Youtube-DL {{{2
alias udl1080='proxychains4 youtube-dl -f 137'
alias udl='proxychains4 youtube-dl -f 22'
alias udl480='proxychains4 youtube-dl -f 135'
alias udl360='proxychains4 youtube-dl -f 18'
alias udlf='proxychains4 youtube-dl -F'

# Mplayer {{{2
alias m='mplayer'
alias mp='mplayer -playlist'
alias ms='mplayer -shuffle'
alias msp='mplayer -shuffle -playlist'

# Greg {{{2
alias greg='proxychains4 greg'

# PodGrab.py Utuntu only {{{2
alias pod-dla="proxychains PodGrab.py -u"
alias pod-dl="PodGrab.py -d"
alias pod-list="PodGrab.py -l"
alias pod-add="PodGrab.py -s"

# Transmission {{{2
alias t-start='sudo service transmission-daemon start'
alias t-stop='sudo service transmission-daemon stop'
alias t-reload='sudo service transmission-daemon reload'
alias tr='transmission-remote -n 'transmission:transmission''
alias t-list='tr -l'
alias t-bs='tr -st'
alias t-fs='tr -si'

### Development aliases {{{1

# Adapt {{{{2
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

### Functions: Directory {{{1
# Enter a directory and list its contents {{{2
cdl() {
  cd $1
  clear
  l
}

# create a new directory and cd into that directory {{{2
take() {
  mkdir $1
  cd $1
}

### Functions: Grep {{{1
# grep string $1 in aliases {{{2
aga() {
  alias | grep "$1"
}

# list the directories with the keyword {{{2
lg () {
  clear
  ll | grep -i "$1"
}

# Kill named process {{{2
killnamed() {
  ps ax | grep $1 | cut -d ' ' -f 1 | xargs kill
}

# grep named process {{{2
psg() {
  ps aux | grep $1
}

## Functions: Find {{{1
# Move all files into a specified diretory {{{2
moveall() {
  find . -maxdepth $1 -type f -iname "$2" -print -exec mv {} $3 \;
}

# Show all specified files {{{2
showall() {
  find . -type f \( -iname "*.$1" -or -iname "*.$2" -or -iname "*.$3" -or -iname "*.$4" \) -print
}
# Trash all specified files {{{2
trashall() {
  find . -type f \( -iname "*.$1" -or -iname "*.$2" -or -iname "*.$3" -or -iname "*.$4" \) -exec trash {} \;
}
## Functions: Archives {{{1

# add a zip file {{{2
zir() {
  zip -r $1 $*
}

# add a tgz file {{{2
taz() {
  tar -czvf $1 $*
}

# extract a tgz file {{{2
tax() {
  tar -xzvf $1
}
# extract a special bundle of archives {{{2
unpack() {
  cd $1
  unzip -oq '*.zip' # unarchive zip package to current director
  unrar e -o+ *.rar # extract files without archive path in overwritten mode
}


# Chrome Download {{{1
# Download google chrome browser {{{2
chrome-dl() {
  proxychains4 wget -O googlechrome-stable.dmg https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
}

# Download google canary browser {{{2
canary-dl() {
  proxychains4 wget -O GoogleChrome-canary.dmg https://storage.googleapis.com/chrome-canary/GoogleChromeCanary.dmg
}

### Functions: Workflow {{{1
# update documentation site {{{2
documentation() {
  cd /Volumes/Data/Documents/docs/documentation/
  ./generate
  cp -r static ~/Sites/
  open http://localhost/static/
}
# Pomodoro Daily log {{{2
pd() {
  cd /Volumes/Data/Documents/docs/pomodoro/
  touch log.md
  vim log.md
}

# Create a new file and open it with vim {{{2
new() {
  touch $1
  vim $1
}

### Functions: not-in-active-use {{{1

# Open in the Google Chrome Browser {{{2
gopen() {
  open -a "/Applications/Google Chrome.app" $1
}

# copy .csv template to course json directory {{{2
cpcsv() {
  cp /Volumes/Data/project/course/csveat/p101.csv .
}

# copy gitignore {{{2
cpgitignore() {
  cp ~/.gitignore_global ./.gitignore
}

# New site based on my starter template {{{2
# newSite() {
  # if [ ! -d /Volumes/Data/Download/coding/$1 ]
  # then
  #   mkdir /Volumes/Data/Download/coding/$1
  #   git clone git@github.com:samumist/starter_stylus.git /Volumes/Data/Download/coding/$1
  #   subl /Volumes/Data/Download/coding/$1
  # else
  #   echo "$1 is already in use, please choose another name."
  # fi
# }

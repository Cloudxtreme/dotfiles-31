### General Aliaes {{{1
# Dotfiles editing {{{2
alias reload="source ~/.zshrc"
alias ez="$EDITOR ~/.zshrc && reload" # Edit default zsh config file and reload
alias ea="$EDITOR ~/bin/dotfiles/custom/aliases.zsh && reload" # edit custom aliases and functions config and reload
alias eg="$EDITOR ~/bin/dotfiles/custom/gitaliases.zsh && reload" # edit custom git aliases and functions config and reload
alias et="$EDITOR ~/.tmux.conf" # edit tmux configuration
alias vimrc="$EDITOR ~/.vimrc" # Edit vimrc
alias etd="$EDITOR ~/.oh-my-zsh/custom/tmux.default.conf" # Edit custom tmux configuration

# Finder aliases {{{2
alias ll="ls -lhFA"
alias l="ls -lhF"
alias l.="ls -dl .[^.]*"

alias dl="cd /Volumes/Data/Download/"
alias tts="cd /Volumes/Data/Download/tutorial"
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
alias t1='tree -L 1' # show directory structure one level
alias t2='tree -L 2' # show directory structure two level
alias t3='tree -L 3' # show directory sturcture 3 level
alias t4='tree -L 4'

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


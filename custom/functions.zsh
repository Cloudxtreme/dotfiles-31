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
# Open with firefox {{{2
function fopen() {
	open -a /Applications/Firefox.app $1
}
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

# Git Aliases
alias g='git status'
alias gaa='git add -A' # git add all

# Git Diff
alias gdm='git diff master'
alias gdc='git diff --color-words'
alias gds='git diff --staged'

# Git Commit
alias gcma='git commit -a -m'

# Git Branch
alias gbm='git branch --merged'
alias gbv='git branch -v' # check last commit on each branch
alias gbd='git branch -d' # delete branch

### Git Actions
alias glall="ls | xargs -P10 -I{} git -C {} pull"
alias gcmall="ls | xargs -P10 -I{} git -C {} checkout master"

### git clone
alias gcl="proxychains4 git clone"

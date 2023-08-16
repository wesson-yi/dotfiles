# Aliases in this file are bash and zsh compatible

# Don't change. The following determines where YADR is installed.
yadr=$HOME/.yadr

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# YADR support
alias yav='yadr vim-add-plugin'
alias ydv='yadr vim-delete-plugin'
alias ylv='yadr vim-list-plugin'
alias yup='yadr update-plugins'
alias yip='yadr init-plugins'

# Direction
alias web='cd ~/Web'
alias apps='cd ~/Web'
alias app='cd ~/Web'
alias .yadr='cd ~/.yadr'
alias cloud='cd /Users/wesson/Library/Mobile\ Documents/com~apple~CloudDocs/Documents'
alias rubyscript='cd ~/Web/workspace/ruby/script'


alias alo='cd ~/Web/alo7'
alias alo7='cd ~/Web/alo7'
alias vkl='cd ~/Web/vcooline'
alias vcl='cd ~/Web/vcooline'
alias mkj='cd ~/Web/maikeji'
alias work='cd ~/Web/workspace'
alias feedmob='cd ~/Web/feedmob'
alias feed='cd ~/Web/feedmob'
alias hearing='cd ~/Web/hearing'
alias sjx='cd ~/Web/sijixy'

alias stage='ssh root@$(basename `pwd`)'
alias gpp='git push origin $(git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //") -u'
alias gll='git pull'
alias gllr='git pull --rebase'
alias gllrp='git pull --rebase; git push'
alias g20='git log -20'

alias formats='git add .; git commit -m "FormatCode"'
alias fixs='git add .; git commit -m "FixBug"'
alias cleans='git add .; git commit -m "CleanCode"'
alias refactors='git add .; git commit -m "Refactor"'
alias amends='git add .; git commit --amend --no-edit'

alias format='git commit -m "FormatCode"'
alias fix='git commit -m "FixBug"'
alias clean='git commit -m "CleanCode"'
alias refactor='git commit -m "Refactor"'
alias amend='git commit --amend --no-edit'

alias coop='cd /Users/wesson/Web/sijixy/coop'
alias program='cd /Users/wesson/Program'

alias tmx='tmux attach -t'

alias togit='chrome-cli open https://github.com/hearing-music/$(basename `pwd`)'
alias toactions='chrome-cli open https://github.com/hearing-music/$(basename `pwd`)/actions'
alias topulls='chrome-cli open https://github.com/hearing-music/$(basename `pwd`)/pulls'
alias totime='chrome-cli open "https://time-off.feedmob.com/journals/new?date=$(date +%Y-%m-%d)"'

function tocode () { chrome-cli open "https://github.com/hearing-music/$(basename `pwd`)/blob/master/$1#L$2" }
function topull () { chrome-cli open "https://github.com/hearing-music/$(basename `pwd`)/pull/$1" }
function to () { chrome-cli open "https://github.com/hearing-music/$1" }
function feature () { git checkout -b feature/$1 }

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'
alias clt='clear;lt'
alias gsl='git stash list'
alias ut='uptime'

alias chrome='chrome-cli'
alias ch='chrome-cli'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
TRAPHUP() {
  source $yadr/zsh/aliases.zsh
}

alias ae='vim $yadr/zsh/aliases.zsh' #alias edit
alias ar='source $yadr/zsh/aliases.zsh'  #alias reload
alias gar="killall -HUP -u \"$USER\" zsh"  #global alias reload

# vim using
#mvim --version > /dev/null 2>&1
#MACVIM_INSTALLED=$?
#if [ $MACVIM_INSTALLED -eq 0 ]; then
#  alias vim="mvim -v"
#fi

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'

# Git Aliases
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
# alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias gap='git add -p'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gfa='git fetch --all'
alias gfap='git fetch --all --prune'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
# Staged and cached are the same thing
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gdmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias gcm='git co master'

# use https://github.com/seveas/git-spindle
glabm(){ noglob git lab merge-request "$(git-branch-current 2> /dev/null)":$1 }

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Zippin
alias gz='tar -zcvf'

# Ruby
alias c='rails c' # Rails 3
alias co='script/console' # Rails 2
alias cod='script/console --debugger'
alias rspec='bundle exec rspec'
alias cap='bundle exec cap'
alias rake='bundle exec rake'
alias brails='bundle exec rails'
alias cucumber='bundle exec cucumber'

alias ks='tmux kill-session -t $(tmux display-message -p "#S")'
alias km='tmux kill-session -t $(tmux display-message -p "#S")'
alias kss='tmux kill-session -t $(tmux display-message -p "#S"); exit'
alias kmm='tmux kill-session -t $(tmux display-message -p "#S"); exit'

#If you want your thin to listen on a port for local VM development
#export VM_IP=10.0.0.1 <-- your vm ip
alias ts='thin start -a ${VM_IP:-127.0.0.1}'
alias ms='mongrel_rails start'
alias tfdl='tail -f log/development.log'
alias tftl='tail -f log/test.log'

alias ka9='killall -9'
alias k9='kill -9'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# TODOS
# This uses NValt (NotationalVelocity alt fork) - http://brettterpstra.com/project/nvalt/
# to find the note called 'todo'
alias todo='open nvalt://find/todo'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

# Zeus
alias zs='zeus server'
alias zc='zeus console'
alias zr='zeus rspec'
alias zrc='zeus rails c'
alias zrs='zeus rails s'
alias zrdbm='zeus rake db:migrate'
alias zrdbtp='zeus rake db:test:prepare'
alias zzz='rm .zeus.sock; pkill zeus; zeus start'

# Rspec
alias rs='rspec spec'
alias sr='spring rspec'
alias src='spring rails c'
alias srgm='spring rails g migration'
alias srdm='spring rake db:migrate'
alias srdt='spring rake db:migrate'
alias srdmt='spring rake db:migrate db:test:prepare'


# Sprintly - https://github.com/nextbigsoundinc/Sprintly-GitHub
alias sp='sprintly'
# spb = sprintly branch - create a branch automatically based on the bug you're working on
alias spb="git checkout -b \`sp | tail -2 | grep '#' | sed 's/^ //' | sed 's/[^A-Za-z0-9 ]//g' | sed 's/ /-/g' | cut -d"-" -f1,2,3,4,5\`"

alias hpr='hub pull-request'
alias grb='git recent-branches'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias dbtp='spring rake db:test:prepare'
alias dbm='spring rake db:migrate'
alias dbmr='spring rake db:migrate:redo'
alias dbmd='spring rake db:migrate:down'
alias dbmu='spring rake db:migrate:up'

#ls tree view
alias lr='ls -R | grep ":$" | sed -e "s/:$//" -e "s/[^-][^\/]*\//--/g" -e "s/^/   /" -e "s/-/|/"'
#ls for hidden files
alias l.='ls -dl .*'
alias netlisteners='lsof -i -P | grep LISTEN'
alias internetip='curl ifconfig.me'
alias wotgobblemem='LC_ALL=C sudo ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
mcd() { mkdir -p "$1" && cd "$1" }
t() {tail -f $1 | perl -pe "s/$2/\e[1;31;43m$&\e[0m/g"}
sssh (){ ssh -t "$1" 'tmux attach -t leon || tmux new -s leon || screen -d -RR -S leon'}
authme() { ssh "$1" 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_rsa.pub }
servedir(){ python -m SimpleHTTPServer $1 }
workdone(){
    default="1"
    git log --committer=leon --pretty=format:"%Cgreen%ar (%h)%n%Creset> %s %b%n" --since="${1:-$default} day ago" --no-merges
}

# Homebrew
alias brewu='brew update  && brew upgrade && brew cleanup && brew prune && brew doctor'

# use GNU date
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias date='gdate'
fi

# Direction
alias web='cd ~/Web'
alias apps='cd ~/Web'
alias app='cd ~/Web'
alias .yadr='cd ~/.yadr'
alias cloud='cd /Users/wesson/Library/Mobile\ Documents/com~apple~CloudDocs/Documents'
alias rubyscript='cd ~/workspace/ruby/script'

alias cls='clear;ls'
alias la='ls -alGh'
alias clt='clear;lt'
alias ut='uptime'

alias work='cd ~/workspace'
alias study='cd ~/Study'

alias alo='cd ~/Web/alo7'
alias alo7='cd ~/Web/alo7'
alias vkl='cd ~/Web/vcooline'
alias vcl='cd ~/Web/vcooline'
alias mkj='cd ~/Web/maikeji'
alias feedmob='cd ~/Web/feedmob'
alias feed='cd ~/Web/feedmob'
alias hearing='cd ~/Web/hearing'
alias sjx='cd ~/Web/sijixy'
alias sijixy='cd ~/Web/sijixy'
alias sijixing='cd ~/Web/sijixy'

alias coop='cd ~/Web/sijixy/coop'
alias coop_local='cd ~/Web/sijixy/coop_local'
alias coop_fill_out='cd ~/Web/sijixy/coop_fill_out'

alias medical='cd ~/Web/sijixy/coop_medical'
alias coop_medical='cd ~/Web/sijixy/coop_medical'
alias coop_medical_backend='cd ~/Web/sijixy/coop_medical_backend'
alias backend='cd ~/Web/sijixy/coop_medical_backend'
alias big_data='cd ~/Web/sijixy/big_data'
alias program='cd ~/Program'

alias stage='ssh root@$(basename `pwd`)'
alias sy2='ssh -J wesson.yi@192.168.31.100 root@192.168.5.2'
alias sy3='ssh -J wesson.yi@192.168.31.100 root@192.168.5.3'

# alias sy2='ssh -J wesson.yi@192.168.64.25 root@192.168.5.2'
# alias sy3='ssh -J wesson.yi@192.168.64.25 root@192.168.5.3'

# Git
alias gpp='git push origin $(git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //") -u'
alias gll='git pull'
alias gllr='git pull --rebase'
alias gllrp='git pull --rebase; git push'
alias g20='git log -20'
alias gcm='git co master'
alias gc='git commit'
alias gsl='git stash list'

# Git add + commit
alias formats='git add .; git commit -m "FormatCode"'
alias fixs='git add .; git commit -m "FixBug"'
alias cleans='git add .; git commit -m "CleanCode"'
alias refactors='git add .; git commit -m "Refactor"'
alias amends='git add .; git commit --amend --no-edit'

alias sformats='git add .; SKIP=RuboCop git commit -m "FormatCode"'
alias sfixs='git add .; SKIP=RuboCop git commit -m "FixBug"'
alias sfix='SKIP=RuboCop git commit -m "FixBug"'
# alias scleans='git add .; git commit -m "CleanCode"'
# alias srefactors='git add .; git commit -m "Refactor"'
# alias samends='git add .; git commit --amend --no-edit'

# Git commit
alias format='git commit -m "FormatCode"'
alias fix='git commit -m "FixBug"'
alias clean='git commit -m "CleanCode"'
alias refactor='git commit -m "Refactor"'
alias amend='git commit --amend --no-edit'

# Git 新建 feature 分支
function feature () { git checkout -b feature/$1 }

# Rails
alias brails='bundle exec rails'
function drails() { docker exec -it coop-web-1 bash -c "cd /data/github/coop && bin/rails $*" }
function dpumactl() { docker exec -it coop-web-1 bash -c "cd /data/github/coop && /usr/local/ruby-2.2.2/bin/pumactl $*" }
function drake() { docker exec -it coop-web-1 bash -c "cd /data/github/coop && bin/rake $*" }

docker-compose() {
  if [ -f docker-compose.local.yml ]; then
    command docker-compose -f docker-compose.local.yml "$@"
  else
    command docker-compose "$@"
  fi
}


# rubocop() {
#   if git ls-files -m | grep -q '\.rb$'; then
#     git ls-files -m | grep '\.rb$' | xargs rubocop -a
#   else
#     command rubocop
#   fi
# }

# tail
alias tailf='tail -f'
alias reloadZsh='source ~/.zshrc'
alias editAlias='vim ~/.yadr/zsh/aliases-ysn.zsh'
alias reloadAlias='source ~/.zshrc'

# Tmux
alias tmx='tmux attach -t'
alias ks='tmux kill-session -t $(tmux display-message -p "#S")'
alias km='tmux kill-session -t $(tmux display-message -p "#S")'
alias kss='tmux kill-session -t $(tmux display-message -p "#S"); exit'
alias kmm='tmux kill-session -t $(tmux display-message -p "#S"); exit'

# Chrome-cli
alias chrome='chrome-cli'
alias ch='chrome-cli'

alias togit='chrome-cli open https://github.com/hearing-music/$(basename `pwd`)'
alias toactions='chrome-cli open https://github.com/hearing-music/$(basename `pwd`)/actions'
alias topulls='chrome-cli open https://github.com/hearing-music/$(basename `pwd`)/pulls'
alias totime='chrome-cli open "https://time-off.feedmob.com/journals/new?date=$(date +%Y-%m-%d)"'

function tocode () { chrome-cli open "https://github.com/hearing-music/$(basename `pwd`)/blob/master/$1#L$2" }
function topull () { chrome-cli open "https://github.com/hearing-music/$(basename `pwd`)/pull/$1" }
function to () { chrome-cli open "https://github.com/hearing-music/$1" }

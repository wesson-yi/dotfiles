# Direction
alias web='cd ~/Web'
alias apps='cd ~/Web'
alias app='cd ~/Web'
alias .yadr='cd ~/.yadr'
alias cloud='cd /Users/wesson/Library/Mobile\ Documents/com~apple~CloudDocs/Documents'
alias rubyscript='cd ~/Web/workspace/ruby/script'

alias cls='clear;ls'
alias la='ls -alGh'
alias clt='clear;lt'
alias ut='uptime'

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
alias coop='cd ~/Web/sijixy/coop'
alias program='cd ~/Program'

alias stage='ssh root@$(basename `pwd`)'
alias sy2='ssh -J wesson.yi@192.168.31.68 root@192.168.5.2'
alias sy3='ssh -J wesson.yi@192.168.31.68 root@192.168.5.3'

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

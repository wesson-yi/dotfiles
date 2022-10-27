#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file

PATH=$HOME/bin:$PATH:/usr/local/mysql/bin
export PATH
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i # is it necessary here?

export NVM_DIR=/Users/wesson/.nvm
  [ -s /usr/local/opt/nvm/nvm.sh ] && . /usr/local/opt/nvm/nvm.sh  # This loads nvm
  [ -s /usr/local/opt/nvm/etc/bash_completion.d/nvm ] && . /usr/local/opt/nvm/etc/bash_completion.d/nvm  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="/usr/local/opt/elasticsearch@6/bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=true

tmm () { tmux new-session -d\; new-window -d\; new-window -d\; attach\; select-window -t 2\; }
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

# Fix: rails c error:
# objc[20451]: +[__NSPlaceholderDictionary initialize] may have been in progress in another thread when fork() was called.
# objc[20451]: +[__NSPlac]
# url: https://stackoverflow.com/questions/52671926/rails-may-have-been-in-progress-in-another-thread-when-fork-was-called
export DISABLE_SPRING=true
export RUBY_YJIT_ENABLE=1
export PATH="/usr/local/opt/postgresql@13/bin:$PATH"

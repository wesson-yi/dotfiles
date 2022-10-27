#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

PROFILING_ZSH_START=false

profile_script_start() {
  if [ "$PROFILING_ZSH_START" = true ]; then
    date "+%T.%3N start $1"
  fi
}
profile_script_end() {
  if [ "$PROFILING_ZSH_START" = true ]; then
    date "+%T.%3N end $1"
  fi
}

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# put after prezto
profile_script_start "brew init"
# better performance than 'brew --prefix'
if [[ $(uname -m) == "arm64" ]]; then
  BREW_PREFIX="/opt/homebrew"
  fpath=($BREW_PREFIX/share/zsh/functions $BREW_PREFIX/share/zsh/site-functions  $fpath)
else
  BREW_PREFIX="/usr/local"
fi
[ -f $BREW_PREFIX/bin/brew ] && eval "$($BREW_PREFIX/bin/brew shellenv)"

profile_script_start "Prezto init"
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  profile_script_start "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

profile_script_start "customize init"
# Customize to your needs...
# Fix: rails c error:
# objc[20451]: +[__NSPlaceholderDictionary initialize] may have been in progress in another thread when fork() was called.
# objc[20451]: +[__NSPlac]
# url: https://stackoverflow.com/questions/52671926/rails-may-have-been-in-progress-in-another-thread-when-fork-was-called
export DISABLE_SPRING=true
export RUBY_YJIT_ENABLE=1
export PATH="/usr/local/opt/postgresql@13/bin:$PATH"
tmm () { tmux new-session -d\; new-window -d\; new-window -d\; attach\; select-window -t 2\; }

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

export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

for config_file ($HOME/.yadr/zsh/*.zsh) profile_script_start "$config_file" && source $config_file
profile_script_start "completion path"
fpath=(~/.zsh/completion $fpath)

source "${HOME}/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)
zstyle ':completion::complete:*' use-cache 1
profile_script_start "completion init"

autoload -Uz compinit && compinit

export PATH="$HOME/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

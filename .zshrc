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

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  profile_script_start "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# put after prezto
profile_script_start "brew init"
# better performance than 'brew --prefix'
if [[ $(uname -m) == "arm64" ]]; then
  HOMEBREW_PREFIX="/opt/homebrew"
else
  HOMEBREW_PREFIX="/usr/local"
fi
[ -f $HOMEBREW_PREFIX/bin/brew ] && eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

# Customize to your needs...
for config_file ($HOME/.yadr/zsh/*.zsh) profile_script_start "$config_file" && source $config_file
profile_script_start "completion path"
fpath=(~/.zsh/completion $fpath)
zstyle ':completion::complete:*' use-cache 1
profile_script_start "completion init"

autoload -Uz compinit && compinit

export PATH="$HOME/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

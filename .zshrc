#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

PROFILING_ZSH_START=false

profile_script_start() {
  if [ "$PROFILING_ZSH_START" = true ]; then
    gdate "+%T.%3N start $1"
  fi
}
profile_script_end() {
  if [ "$PROFILING_ZSH_START" = true ]; then
    gdate "+%T.%3N end $1"
  fi
}

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  profile_script_start "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
for config_file ($HOME/.yadr/zsh/*.zsh) profile_script_start "$config_file" && source $config_file
profile_script_start "completion path"
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i # is it necessary here?
zstyle ':completion::complete:*' use-cache 1
profile_script_start "completion init"


export PATH="$HOME/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

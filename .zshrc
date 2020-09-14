#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# Source Prezto.
profile_script_start() {
  #gdate "+%T.%3N start $1"
}
profile_script_end() {
  #gdate "+%T.%3N end $1"
}
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  profile_script_start "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# Customize to your needs...
for config_file ($HOME/.yadr/zsh/*.zsh) profile_script_start "$config_file" && source $config_file
PATH=$HOME/bin:$PATH
export PATH
profile_script_start "completion path"
fpath=(~/.zsh/completion $fpath)
profile_script_start "completion init"
autoload -Uz compinit && compinit -i # is it necessary here?

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

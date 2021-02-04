# you can disable this by exporting K8S_CONTEXT_NAMESPACE_ENV=disabled in .zshrc

# see zsh/prezto-themes/prompt_qianthinking_setup which
# ensure K8S_CONTEXT && K8S_NAMESPACE exists in SHELL PROMPT
if [ ! "$K8S_CONTEXT_NAMESPACE_ENV" = 'disabled' ]
then
  function kubectl() {
    if [ "$2" = '' ] || [ "$1" = 'krew' ]
    then
      # not support for context/namespace
      command kubectl $@
    else
      if [ -z "$K8S_CONTEXT" ]
      then
        echo "ENV Variable: K8S_CONTEXT required, see $HOME/.yadr/zsh/kubectl.zsh"
      else
        if [ -z "$K8S_NAMESPACE" ] || [[ "$*" == '-n'* ]] || [[ "$*" == '--namespace'* ]]
        then
          echo "\033[1;94mkubectl $1 --context $K8S_CONTEXT ${@:2}\033[0m"
          command kubectl $1 --context $K8S_CONTEXT ${@:2}
        else
          echo "\033[1;94mkubectl $1 --context $K8S_CONTEXT -n $K8S_NAMESPACE ${@:2}\033[0m"
          command kubectl $1 --context $K8S_CONTEXT -n $K8S_NAMESPACE ${@:2}
        fi
      fi
    fi
  }

  function kbc() {
    export K8S_CONTEXT=$1
  }

  function kbn() {
    export K8S_NAMESPACE=$1
  }

  function kbclear() {
    export K8S_CONTEXT=''
    export K8S_NAMESPACE=''
  }
fi

# you can disable this by exporting K8S_CONTEXT_NAMESPACE_ENV=disabled in .zshrc

# see zsh/prezto-themes/prompt_qianthinking_setup which
# ensure K8S_CONTEXT && K8S_NAMESPACE exists in SHELL PROMPT
if [ ! "$K8S_CONTEXT_NAMESPACE_ENV" = 'disabled' ]
then
  function kubectl() {
    if [ -z "$K8S_CONTEXT" ]
    then
      echo "ENV Variable: K8S_CONTEXT required, see $HOME/.yadr/zsh/kubectl.zsh"
    else
      if [[ -z "$K8S_NAMESPACE" ]] || [[ "$*" == *'-n'* ]] || [[ "$*" == *'--namespace'* ]]
      then
        command kubectl --context $K8S_CONTEXT $@
      else
        command kubectl --context $K8S_CONTEXT --namespace $K8S_NAMESPACE $@
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

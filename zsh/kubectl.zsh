# you can disable this by exporting K8S_CONTEXT_NAMESPACE_ENV=disabled in .zshrc

# see zsh/prezto-themes/prompt_qianthinking_setup which
# ensure K8S_CONTEXT && K8S_NAMESPACE exists in SHELL PROMPT
if [ ! "$K8S_CONTEXT_NAMESPACE_ENV" = 'disabled' ]
then
  function kubectl() {
    echo "$@" >> /tmp/kube
    if [ -z "$K8S_CONTEXT" ]; then
      command kubectl "$@"
    else
      if [ -z "$K8S_NAMESPACE" ] || [[ "$*" == '-n'* ]] || [[ "$*" == '--namespace'* ]]; then
        command kubectl --context $K8S_CONTEXT "$@"
      else
        command kubectl --context $K8S_CONTEXT -n $K8S_NAMESPACE "$@"
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


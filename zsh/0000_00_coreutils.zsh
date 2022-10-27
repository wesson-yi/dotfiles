GNU_PACKAGE_PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin"
if [ -d "$GNU_PACKAGE_PATH" ]
then
  export PATH="$GNU_PACKAGE_PATH:$PATH"
  alias ls='ls --color=auto'
fi

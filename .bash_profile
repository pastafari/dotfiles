# This assumes that setup is done via go.sh
source /usr/local/Cellar/trueline/trueline.sh

# Disable Last login message on Mac
touch ~/.hushlogin

# Setup secrets here!
source ~/.profile

# pyenv
eval "$(pyenv init -)"

PATH=$(pyenv root)/shims:$PATH

# direnv
eval "$(direnv hook bash)"

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Cowsay! Always last!
fortune | cowsay

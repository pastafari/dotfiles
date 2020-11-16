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

# Cowsay! Always last!
fortune | cowsay

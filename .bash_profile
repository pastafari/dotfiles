# This assumes that setup is done via go.sh
source /usr/local/Cellar/trueline/trueline.sh

# Disable Last login message on Mac
touch ~/.hushlogin

# Setup secrets here!
source ~/.profile

# Cowsay!
fortune | cowsay

alias zshconfig="nvim ~/.zshrc"
alias sshconfig="nvim ~/.ssh/config"
alias reload="source ~/.zshrc"
alias storm="phpstorm1 ."

# PHP Deployer
alias dep='vendor/bin/dep'

# Laravel artisan
alias composer="valet composer"
alias artisan="valet php artisan"

# Flush DNS
alias flushdns="sudo killall -HUP mDNSResponder && echo macOS DNS Cache Reset"

# Git
alias gc="git commit -m $1"
alias ga="git add"
alias gs="git status"
# alias go="git checkout"
alias gr="git restore --staged"
alias gp="git push"
alias lg="lazygit"

# Shopify Hydrogen alias to local projects
alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'

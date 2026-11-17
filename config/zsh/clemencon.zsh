# Utilities
alias ls="eza -lh"
alias utc="date -u"
alias speed="networkQuality"
alias cakelog="tail -F app/tmp/logs/error.log | bat --paging=never --style=plain --language=log"
alias copybranch="git branch --show-current | pbcopy"
alias flushdns="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias miseup='mise self-update && mise -C ~/Developer/dotfiles bootstrap --upgrade && nvim --headless "+Lazy! sync" +qa'
alias ai="opencode"
alias db="mycli -h 127.0.0.1 -P 3307 -u root -p root"
alias bat="bat --style=-numbers"

# Application aliases.
alias lgit="lazygit"
alias ldock="lazydocker"
alias vim="nvim"
alias phpstorm="open -a 'PhpStorm.app' --args nosplash dontReopenProjects ."
alias webstorm="open -a 'WebStorm.app' --args nosplash dontReopenProjects ."

# Open project directories.
alias cdd="cd ~/Developer/"
alias cdb="cd ~/Developer/main-repository/ova-generic-ba/"
alias cdh="cd ~/Developer/ova-jci/"
alias cdk="cd ~/Developer/katas"
alias cdm="cd ~/Developer/main-repository/"
alias cdn="cd ~/Developer/notes/"
alias cdt="cd ~/Developer/main-repository/be-approved/"
alias cdcf="cd ~/Developer/onyx-one-core-frontend/"
alias cdcb="cd ~/Developer/onyx-one-core-backend/"
alias cdce="cd ~/Developer/onyx-one-core-e2e/"

# Open projects in Vim.
alias vimb="cd ~/Developer/main-repository/ova-generic-ba/ && nvim"
alias vimh="cd ~/Developer/ova-jci/ && nvim"
alias vimm="cd ~/Developer/main-repository/ && nvim"
alias vimn="cd ~/Developer/notes/ && nvim"
alias vimt="cd ~/Developer/main-repository/be-approved/ && nvim"
alias vimcf="cd ~/Developer/onyx-one-core-frontend/ && nvim"
alias vimcb="cd ~/Developer/onyx-one-core-backend/ && nvim"

# Execute commands inside containers.
alias execb="docker exec main-repository-ova-generic-ba-1"
alias exech="docker exec ova-jci-hsse-1"
alias exect="docker exec main-repository-be-approved-1"

# Docker.
alias dockerkill='docker kill $(docker ps -aq)'
alias dockerdestroy='docker stop $(docker ps -aq) && docker rm -f $(docker ps -aq) && docker rmi $(docker images -q)'

# LocalStack.
alias awslocal="aws --endpoint-url=http://localhost:4566 --region eu-central-1"

# Network.
alias cleardns="dscacheutil -flushcache"
alias myip="curl https://ifconfig.me"

# Everything Vim
export EDITOR=nvim
export VISUAL=nvim

# Light terminal background for OpenCode and other apps
export COLORFGBG="0;15"

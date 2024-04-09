source ~/.asdf/asdf.fish

export JAVA_HOME=/home/carlos/.asdf/installs/java/openjdk-17.0.1
export PATH="$FLYCTL_INSTALL/bin:$PATH"
# ALIAS

### rails
alias bu="bundle install"
alias bu="bundle update"
### git 
alias gst="git status"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gpu="git pull"
alias gps="git push"
alias gcm="git commit"
alias glg="git lg"
### github
alias gh-repo="gh repo create --public --source=. --remote=upstrea"
###docker 
alias docked="docker exec -it" 

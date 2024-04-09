if status is-interactive
    # Commands to run in interactive sessions can go here
end
source ~/.asdf/asdf.fish

export JAVA_HOME=/home/carlos/.asdf/installs/java/openjdk-17.0.1
export JIRA_API_TOKEN="ATATT3xFfGF00DI76XguFYNYIJMFs_wGNL9j5KY3qE5ef27uCpMBz_Aj5K2btmuI21OI0nrpf3nveyhcYPPGH9d2V9j9XYsqGB1GuN_7Dn5RQLA2J33L1PkaVv4ljy_fySPHTkhp_47FKgQv7jWObwGDXqIt5lguUQLAbL0ogUJiuWeHV07pdm4=9E959492"
export FLYCTL_INSTALL="/home/carlos/.fly"
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

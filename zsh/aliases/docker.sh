# Alias to use with dockerctl tool
alias dka='docker kill $(docker ps -q)'
alias rma='docker rm $(docker ps -a -q)'
alias rmg='docker rmi $(docker images -a -q)'
alias ds='docker ps'
alias dss='docker stop $(docker ps -q)'

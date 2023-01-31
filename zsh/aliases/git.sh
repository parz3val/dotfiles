##########################################
##########################################
##############GIT ALIASES#################
##########################################
##########################################

## DOT FILES AUTO COMMIT
alias dgc='cd ~/dotfiles; git add . ; git commit -m " 🗒️: 🎉🎉🎉  Sync progress from local application to remote 🎉🎉 ";  git push;hhh'

# Kind of default empty commit to quickly sync the 
# changes to the main repo
alias egc='git add .; git commit -m " 🗒️: 🎉🎉🎉  Sync progress from local application to remote 🎉🎉 "; git push'
alias rgc='clr; git add .; git commit -m " 🗒️: 🎉🎉🎉  Sync progress from local application to remote 🎉🎉 "; git push'
alias tgc='rm -rf dist;rm -rf node_modules; git add .; git commit -m " 🗒️: 🎉🎉🎉  Sync progress from local application to remote 🎉🎉 "; git push'
alias gll='git log --oneline'
alias glb='git log'
alias rad='clr;g add .;'
alias gsa='git status';

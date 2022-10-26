 

#######################################################
#######################################################
################ Aliases for the tmux #################
#######################################################
#######################################################

# Creating named sessions for ease of use
alias tww='tmux new -s WORK'
alias thh='tmux new -s HOME'
alias thi='tmux new -s INSTALL'
alias tff='tmux new -s FUN'

# Connect easily to the sessions from
# new terminal
# Connect based on id
alias tt0='tmux attach-session -t 1'
alias tt1='tmux attach-session -t 1'

# Connect with names
alias tti='tmux attach-session -t INSTALL'
alias tth='tmux attach-session -t HOME'
alias ttf='tmux attach-session -t FUN'
alias ttw='tmux attach-session -t WORK'
alias tts='tmux list-sessions'
alias ta='tmux attach'
alias t='tmux new -s HOME'

# Aliases for the tmux control and stuff
alias twork='tmux attach-session -t work'
alias tf='tmux attach-session -t 0'
alias tk='tmux new -s work'


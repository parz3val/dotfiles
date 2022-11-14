source ~/dotfiles/zsh/aliases/linux/leftwm.sh
alias eel='lvim ~/dotfiles/zsh/aliases/linux/leftwm.sh'
# load linux config management shortcut and edit em
source ~/dotfiles/zsh/aliases/linux/config.sh
alias eec='nvim ~/dotfiles/zsh/aliases/linux/config.sh'


# Workflow specific
# Clean poetry virtual envs
# cleans poetry virtualenv on linux
alias ppr='echo "Cleaning the ~/.cache/pypoetry/virtulenvs; rm -rf ~/.cache/pypoetry/virtualenvs; mkdir ~/.cache/pypoetry/virtualenvs;'

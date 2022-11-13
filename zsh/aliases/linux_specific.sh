source ~/dotfiles/zsh/aliases/leftwm
alias eel='lvim ~/dotfiles/zsh/aliases/leftwm'
# load linux config management shortcut and edit em
source ~/dotfiles/zsh/aliases/linux_config_mgmt
alias eec='nvim ~/dotfiles/zsh/aliases/linux_config_mgmt'


# Workflow specific
# Clean poetry virtual envs
# cleans poetry virtualenv on linux
alias ppr='echo "Cleaning the ~/.cache/pypoetry/virtulenvs; rm -rf ~/.cache/pypoetry/virtualenvs; mkdir ~/.cache/pypoetry/virtualenvs;'

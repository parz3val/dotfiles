source ~/dotfiles/zsh/aliases/linux/leftwm.sh
alias eel='lvim ~/dotfiles/zsh/aliases/linux/leftwm.sh'
# load linux config management shortcut and edit em
source ~/dotfiles/zsh/aliases/linux/config.sh
alias eec='nvim ~/dotfiles/zsh/aliases/linux/config.sh'

# Load the i3 config into the nvim session
alias ee3='nvim ~/.config/i3/config;cd $HOME;cp -r ~/.config/i3 ~/dotfiles/;dgc;'


# Workflow specific
# Clean poetry virtual envs
# cleans poetry virtualenv on linux
alias ppr='echo "Cleaning the ~/.cache/pypoetry/virtulenvs; rm -rf ~/.cache/pypoetry/virtualenvs; mkdir ~/.cache/pypoetry/virtualenvs;'

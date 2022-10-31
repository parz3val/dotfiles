#######################################################
#######################################################
################ SHORTCUTS AND STUFF # ################
#######################################################
#######################################################



# Aliases for the my mac workflow
alias rrr="source ~/.zshrc" # reloads the zshrc/bashrc
alias eee="nvim ~/.zshrc" # loads zshrc in vi to edit
alias rrr="source ~/.zshrc"
alias hhh="cd ~"
alias h="cd ~"
alias eea="lvim ~/dotfiles/zsh/aliases/common.sh"
alias f='exa -GF'
alias ff='exa -aGF'
alias tt='exa -T'
alias jj='clear'
alias b='cd ..'
alias bb='b;b'
alias bbb='b;b;b;'
alias home='hhh;'
alias seehome='exa ~'
alias doc='home; Documents'




# alias lvim as nvim in case I use 
# Lunarvim somewhere,
# I can replace easily
alias lvim='nvim'

# Edit tmux config and 
# save the replace the file in 
# dotfiles directory
#
alias eet='lvim ~/.tmux.conf; cp ~/.tmux.conf ~/dotfiles/tmux/'

# Ease of use terminal comands to clear and exit
alias cls='clear'
alias eo='exit' # exit out
alias rr='clear'

#######################################################
#######################################################
################ LOAD ALIASES #########################
#######################################################
#######################################################

# Load the funny functions - and edit em
source ~/dotfiles/zsh/aliases/funny_alias.sh
alias eef='lvim ~/dotfiles/zsh/aliases/funny_alias.sh'


# load git aliases
source ~/dotfiles/zsh/aliases/git.sh
alias eeg='lvim ~/dotfiles/zsh/aliases/git.sh'


# load tmux aliases
source ~/dotfiles/zsh/aliases/tshorts.sh
alias ett='lvim ~/dotfiles/zsh/aliases/tmux.sh'
#######################################################
#######################################################
################ MORE TRIVIAL ALIASES #################
#######################################################
#######################################################

## Load docker aliases
alias eed="lvim ~/dotfiles/zsh/aliases/docker.sh"
source  ~/dotfiles/zsh/aliases/docker.sh

# fuzzy finder script to find file
fn(){ du -a  | awk '{print $2}' | fzf | xargs  nvim }


# go into the config folder and list
# with exa
alias cef='$HOME;cd .config;exa -GFa'

# Workkflow specific aliases
# Python
# Cleans poetry virtualenv folder on mac
alias mpr='rm -rf ~/Library/Caches/pypoetry/virtualenvs/ ; mkdir ~/Library/Caches/pypoetry/virtualenvs/'
# cleans poetry virtualenv on linux
alias apr='echo "Cleaning the ~/.cache/pypoetry/virtulenvs; rm -rf ~/.cache/pypoetry/virtualenvs; mkdir ~/.cache/pypoetry/virtualenvs;'

# Rust
# Clean the rust target and dist folder - pretty painful to do
alias clr='echo "Cleaning rust dist and target";rm -rf target dist'

# add the rust application without the
# dist and target folder
alias gar='clr;g add .'

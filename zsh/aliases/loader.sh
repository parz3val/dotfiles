
# load common aliases
source ~/dotfiles/zsh/aliases/common.sh

if [[ `uname` == "Linux" ]]
then
  source ~/dotfiles/zsh/aliases/linux_specific.sh
else
  source ~/dotfiles/zsh/aliases/mac_specific.sh
  source ~/dotfiles/zsh/aliases/mac_apps.sh
fi


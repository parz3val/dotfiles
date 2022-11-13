
# load common aliases
source ~/dotfiles/zsh/aliases/common.sh

if [[ `uname` == "Linux" ]]
then
  source ~/dotfiles/zsh/aliases/linux/linux_specific.sh
else
  source ~/dotfiles/zsh/aliases/mac/mac_specific.sh
  source ~/dotfiles/zsh/aliases/mac/mac_apps.sh
  source ~/dotfiles/zsh/aliases/mac/mac_alphabet.sh
fi


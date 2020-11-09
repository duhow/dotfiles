#!/bin/bash

# spacevim
sh -c "$(curl -sLf https://spacevim.org/install.sh)"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# python stuff
python_libs=(pycodestyle pylint pynvim)
pip3 install --user ${python_libs[*]}

cat /etc/*-release | grep -q debian
if [ $? -eq 0 ]; then
  sudo apt install fzf exuberant-ctags
fi

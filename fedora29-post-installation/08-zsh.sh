#!/usr/bin/env bash
set -e 

# zsh
if ! dnf list installed zsh ; then
  sudo dnf -y install zsh
fi

# oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# powerlevel9k
if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]; then
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

# change theme to powerlevel
sed -i 's|ZSH_THEME=.*|ZSH_THEME="powerlevel9k/powerlevel9k"|g' ~/.zshrc

if ! grep "POWERLEVEL" ~/.zshrc ; then
  cat <<- EOF >> ~/.zshrc
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv context dir vcs terraform)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
EOF
fi

zsh -c 'git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions'

if ! grep "^ *zsh-autosuggestions" ~/.zshrc ; then
  sed -i '/^plugins\=/a \ \ zsh-autosuggestions' ~/.zshrc
fi

if ! grep "^ *zsh-syntax-highlighting" ~/.zshrc ; then
  sed -i '/^plugins\=/a \ \ zsh-syntax-highlighting' ~/.zshrc
fi

# install font
if [ ! -d ~/.local/share/fonts/sauce-code-pro-nerd-font ]; then
  mkdir -p ~/.local/share/fonts/sauce-code-pro-nerd-font
  wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf -O ~/.local/share/fonts/sauce-code-pro-nerd-font/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf
  sudo fc-cache -v
fi

chsh -s $(which zsh)

echo 'abra o gnome tweak e defina Fontes > Texto monoespaçado para SauceCodePro Nerd Mono Regular e reinicie o login do usuário'

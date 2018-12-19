#!/usr/bin/env bash
set -e 

if ! grep "^ *terraform" ~/.zshrc ; then
  # add terraform plugin
  sed -i '/^plugins\=/a \ \ terraform' ~/.zshrc
fi

if ! grep "terraform" ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme ; then
  cat <<- EOF >> ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme
################################################################
# Add terraform workspace in prompt when needed 
prompt_terraform() {
  if [[ -d .terraform ]]; then
    local tf_workspace="\$(tf_prompt_info | sed "s/\[//g" | sed "s/\]//g")"
    "\$1_prompt_segment" "\$0" "\$2" "black" "red" "\$tf_workspace" "TERRAFORM_ICON"
  fi
}
EOF
fi


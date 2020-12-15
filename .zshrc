export ZSH="/Users/julius/.oh-my-zsh"

ZSH_THEME="vercel"

plugins=()

source $ZSH/oh-my-zsh.sh

alias please="sudo"
alias reload="source /Users/julius/.zshrc"
alias resetLaunchPad="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/Users/julius/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# SSH key generation function
genSSHKey() {
  ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/$1 -C $2
  cat ~/.ssh/$1
}

# Add SSH keys
eval `keychain --eval --quiet --agents ssh ~/.ssh/github`
eval `keychain --eval --quiet --agents ssh ~/.ssh/contabo`
eval `keychain --eval --quiet --agents ssh ~/.ssh/hetzner`

# JetBrains shellscripts
export PATH="/Users/julius/.shellscripts:$PATH"

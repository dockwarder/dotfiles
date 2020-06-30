#!/bin/bash

DIRECTORY="$(dirname "$0")"

printf "[Info] Updating package sources"
sudo apt update

printf "\n[Info] Installing dependencies\n\n"
. "$DIRECTORY/install-deps.sh"

printf "\n[Info] Installing oh-my-zsh\n\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

printf "\n[Info] Installing Vercel theme for oh-my-zsh\n\n"
curl https://raw.githubusercontent.com/vercel/zsh-theme/master/vercel.zsh-theme -Lo ~/.oh-my-zsh/custom/themes/vercel.zsh-theme

printf "\n[Info] Installing z"
curl https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/.z.sh
chmod +x ~/.z.sh

printf "\n[Info] Copying over config\n\n"
rm ~/.zshrc
cp "$DIRECTORY/zshrc.sample" ~

printf "\n[Info] It's done!\n\n"

printf "[Info] Installing Nodenv\n\n"
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
cd ~/.nodenv && src/configure && make -C src
~/.nodenv/bin/nodenv init
mkdir -p "$(nodenv root)"/plugins
git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build

printf "\n[Info] Creating directories"
mkdir ~/Code


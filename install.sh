#!/bin/bash

ln -s ~/Documents/dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/Documents/dotfiles/vimrc            ~/.vimrc
ln -s ~/Documents/dotfiles/gitconfig        ~/.gitconfig
ln -s ~/Documents/dotfiles/config           ~/.config
ln -s ~/Documents/dotfiles/qutebrowser      ~/.qutebrowser

mkdir ~/.tmp

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# plugins=(git git-prompt fzf)

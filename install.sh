#!/bin/bash

ln -s ~/Documents/dotfiles/bashrc           ~/.bashrc
ln -s ~/Documents/dotfiles/git.sh           ~/.git.sh
ln -s ~/Documents/dotfiles/git_template     ~/.git_template
ln -s ~/Documents/dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/Documents/dotfiles/vimrc            ~/.vimrc
ln -s ~/Documents/dotfiles/gitconfig        ~/.gitconfig
ln -s ~/Documents/dotfiles/config           ~/.config
ln -s ~/Documents/dotfiles/ideavimrc        ~/.ideavimrc
ln -s ~/Documents/dotfiles/qutebrowser      ~/.qutebrowser

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
mv git-completion.bash ~/.git-completion.bash
mv git-prompt.sh ~/.git-prompt.sh

mkdir ~/.tmp

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

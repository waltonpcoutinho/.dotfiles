#!/usr/bin/env bash
#clone Vundle from github
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#install nerdcommenter
curl -fLo ~/.vim/plugin/NERD_Commenter.vim --create-dirs \
  https://raw.githubusercontent.com/preservim/nerdcommenter/master/plugin/NERD_commenter.vim
curl -fLo ~/.vim/doc/NERD_Commenter.txt --create-dirs \
  https://raw.githubusercontent.com/preservim/nerdcommenter/master/doc/NERD_commenter.txt

#install ack search tool
sudo apt-get install ack

#install ctags neede by gutentags
sudo apt-get install ctags

#To install plugins from command line
vim +BundleInstall +qall


cp .vim/bundle/vim-afterglow/autoload/airline/themes/afterglow.vim .vim/colors/




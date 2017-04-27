#!/bin/sh
#
# author: Stephan Engelmann (stephan-engelmann@gmx.de) alias Secuvim
#
# A little setup script for automating usage on a new device. If you don't
# need all the features I included you should do a manual setup copying or
# linking each file separately.
#
##############################################################################

FILES=$(pwd)

rm -f $HOME/.bashrc
ln -s $FILES/bashrc $HOME/.bashrc

rm -f $HOME/.zshrc
ln -s $FILES/zshrc $HOME/.zshrc

rm -f $HOME/.tmux.conf
ln -s $FILES/tmux.conf $HOME/.tmux.conf

rm -rf $HOME/.sbin
ln -s $FILES/sbin $HOME/.sbin

rm -f $HOME/.Xresources
ln -s $FILES/Xresources $HOME/.Xresources

# vim
rm -f $HOME/.vimrc
ln -s $FILES/vimrc $HOME/.vimrc
rm -rf $HOME/.vim
mkdir -p $HOME/.vim/bundle
git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle > /dev/null

echo "Setup finished!\n* Please update vim Plugins and follow the manual steps for the youcompleteme plugin."

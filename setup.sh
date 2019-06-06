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

rm -rf $HOME/.bin
ln -s $FILES/bin $HOME/.bin

rm -rf $HOME/.conf/neofetch
ln -s $FILES/conf/neofetch $HOME/.conf/neofetch

rm -f $HOME/.conf/nvim/init.vim
ln -s $FILES/conf/nvim/init.vim $HOME/.conf/nvim/init.vim

rm -f $HOME/.local/share/applications/org.gnome.Terminal_light.desktop
ln -s $FILES/local/share/applications/org.gnome.Terminal_light.desktop \
  $HOME/.local/share/applications/org.gnome.Terminal_light.desktop

rm -f $HOME/.local/share/applications/spotifyHDPI.desktop
ln -s $FILES/local/share/applications/spotifyHDPI.desktop \
  $HOME/.local/share/applications/spotifyHDPI.desktop

rm -f $HOME/.local/share/applications/weechat.desktop
ln -s $FILES/local/share/applications/weechat.desktop \
  $HOME/.local/share/applications/weechat.desktop

rm -f $HOME/.tmux.conf
ln -s $FILES/tmux.conf $HOME/.tmux.conf

rm -f $HOME/.zpreztorc
ln -s $FILES/zpreztorc $HOME/.zpreztorc

rm -f $HOME/.zshrc
ln -s $FILES/zshrc $HOME/.zshrc

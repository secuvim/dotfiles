#!/bin/bash
#
# author: Stephan Engelmann (stephan-engelmann@gmx.de) alias Secuvim
#
# A little setup script for automating usage on a new device. If you don't
# need all the features I included you should do a manual setup coppying or
# linking each file seperately.
#
##############################################################################

rm $HOME/.bashrc
ln -s bashrc $HOME/.bashrc

rm $HOME/.tmux.conf
ln -s tmux.conf $HOME/.tmux.conf

rm -rf $HOME/.vim
ln -s vim $HOME/.vim

rm -rf $HOME/.sbin
ln -s sbin $HOME/.sbin

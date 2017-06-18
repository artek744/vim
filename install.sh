#!/bin/bash

CYAN="\033[0;96m"
GREEN="\033[1;32m"
NC="\033[0m"

function install_vim_gtk {
while true
do
	read -r -p 'Do you want to install vim-gtk? [y/n] ' choice
	case "$choice" in
		n|N) break;;
		y|Y)	echo -e $CYAN "\nUpdating repositories ..." $NC
				sudo apt-get update
				echo -e $CYAN "\nInstalling vim-gtk ..." $NC
				sudo apt-get install vim-gtk
	  		  break;;
		*) echo 'Response not valid';;
	esac
done
}

cp -r .vim ~/
cp -r .vimrc ~/

install_vim_gtk

echo -e $GREEN "\nVim config files have been instaled.\n" $NC



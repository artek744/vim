#!/bin/bash

CYAN="\033[0;96m"
CYAN_BOLD="\033[1;96m"
GREEN="\033[0;32m"
GREEN_BOLD="\033[1;32m"
YELLOW="\033[0;33m"
YELLOW_BOLD="\033[1;33m"
RED="\033[0;31m"
RED_BOLD="\033[1;31m"
RESET="\033[0m"

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

copy_configs()
{
	echo -e $CYAN "\nCopying configs ..." $RESET

	rm -r ~/.vim 2> /dev/null
	rm ~/.vimrc 2> /dev/null

	ln -sfn $SCRIPT_PATH/.vim ~/.vim
	ln -sfn $SCRIPT_PATH/.vimrc ~/.vimrc
}

install_submodules()
{
	echo -e $CYAN "\nInstalling submodules ..." $RESET
	git submodule update --init --recursive
}

install_dependencies()
{
	dependencies="vim vim-gtk vim-gnome exuberant-ctags"
	echo -e "\nDependencies: "$YELLOW_BOLD $dependencies $RESET

	while true
	do
		read -p "$(echo -e "Do you want to install dependencies? [y/n]: "$RESET)" choice
		case "$choice" in
			n|N) break;;
			y|Y)	echo -e $CYAN "\nUpdating repositories ..." $RESET
					sudo apt-get update
					echo -e $CYAN "\nInstalling dependencies ..." $RESET
					sudo apt-get install $dependencies
				  break;;
			*) echo -e '\nIncorrect response, please type '\''y'\'' or '\''n'\';;
		esac
	done
}

main()
{
	copy_configs
	install_dependencies
	install_submodules

	echo -e $GREEN_BOLD "\nVim config files have been instaled.\n" $RESET
}


main

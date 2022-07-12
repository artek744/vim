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
    git submodule update --remote --merge

    git config --global core.editor "vim"
}

main()
{
	copy_configs
	install_submodules

	echo -e $GREEN_BOLD "\nVim config files have been instaled.\n" $RESET
}


main

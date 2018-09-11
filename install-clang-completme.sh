CLANG_CONFIG_FILE="clang_complete_config.vim"
SCRIPT_PATH=$(dirname "$(readlink -f "$0")")

CYAN="\033[0;96m"
CYAN_BOLD="\033[1;96m"
GREEN="\033[0;32m"
GREEN_BOLD="\033[1;32m"
YELLOW="\033[0;33m"
YELLOW_BOLD="\033[1;33m"
RED="\033[0;31m"
RED_BOLD="\033[1;31m"
RESET="\033[0m"

instal_dependencies()
{
	echo -e "${CYAN}Updating repository... ${RESET}"
	sudo apt-get update
	echo -e "${CYAN}Installing dependencies... ${RESET}"
	sudo apt-get install clang libclang-dev
}

clone_repository()
{
	echo -e "${CYAN}Cloning repository...${RESET}"
	cd ~/.vim/bundle
	rm -rf clang_complete
	git clone https://github.com/rip-rip/clang_complete
}

install_clang_complete()
{
	echo -e "${CYAN}Installing clang_complete...${RESET}"
	cd clang_complete
	make install
}

create_clang_complete_config()
{
	echo -e "${CYAN}Creating clang_complete config...${RESET}"
	clang_lib_path=$(ldconfig -p | grep -o /.*libclang.*so.* | tail -n 1)

	echo "\" ----- CLANG COMPLETE CONFIG -----
	let g:clang_library_path=\"$clang_lib_path\"
	set conceallevel=2
	set concealcursor=vin
	let g:clang_snippets=1
	let g:clang_conceal_snippets=1

	let g:clang_complete_auto=0

	\" The single one that works with clang_complete
	let g:clang_snippets_engine='clang_complete'

	let g:clang_complete_patterns=1

	\" Complete options (disable preview scratch window, longest removed to aways
	\" show menu)
	set completeopt=menu,menuone

	\" Limit popup menu height
	set pumheight=20
	" > $SCRIPT_PATH/.vim/$CLANG_CONFIG_FILE
}

main()
{
	instal_dependencies
	clone_repository
	install_clang_complete
	create_clang_complete_config
	echo -e "${GREEN_BOLD}\n   Done. ${GREEN} The clang_complete has been installed sucessfully. ${RESET}\n"
}

main "@"

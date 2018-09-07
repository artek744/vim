main()
{
	rm -fr .vim/bundle/youcompleteme
	git clone https://github.com/Valloric/YouCompleteMe .vim/bundle/youcompleteme --recursive
	cd .vim/bundle/youcompleteme
	./install.py --clang-completer --system-libclang
}

main "$@"

" ----- SWITCH SOURCE <-> HEADER FILE -----
map <F4> :call SwitchSourceHeaderFile()<CR>

if exists('*SwitchSourceHeaderFile')
    finish
endif

function! SwitchSourceHeaderFile()
	if(expand('%:e') == "cpp")
		silent! exec("tag ".expand("%:t:r").".h")
	else
		silent! exec("tag ".expand("%:t:r").".cpp")
	endif
endfunction

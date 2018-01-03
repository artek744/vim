" ----- SWITCH SOURCE <-> HEADER FILE -----
map <F4> :call SwitchSourceHeaderFile()<CR>

if exists('*SwitchSourceHeaderFile')
    finish
endif

function! SwitchSourceHeaderFile()
	if(expand('%:e') == "c")
		silent! exec("tag ".expand("%:t:r").".h")
	else
		silent! exec("tag ".expand("%:t:r").".c")
	endif
endfunction

" Let Vim walk up directory hierarchy from CWD to root looking for tags file
set tags=tags;/
" Tell EasyTags to use the tags file found by Vim
let g:easytags_dynamic_files = 1

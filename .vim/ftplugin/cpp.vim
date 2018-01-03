" ----- SWITCH SOURCE <-> HEADER FILE -----
map <F4> :call SwitchSourceHeaderFile()<CR>

if exists('*SwitchSourceHeaderFile')
    finish
endif

function! SwitchSourceHeaderFile()
	let filename = ""
	if(expand('%:e') == "cpp")
		let filename = expand("%:t:r").".h"
	else
		let filename = expand("%:t:r").".cpp"
	endif

	try
		exec("tag ".filename)
	catch
		echo "Probably the tags file has not been generated or ".filename." file doesn't exist"
	endtry
endfunction

" Let Vim walk up directory hierarchy from CWD to root looking for tags file
set tags=tags;/
" Tell EasyTags to use the tags file found by Vim
let g:easytags_dynamic_files = 1

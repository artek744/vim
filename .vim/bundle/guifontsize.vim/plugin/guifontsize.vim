let s:guifontpp_smaller_font_map = "<kMinus>"
let s:guifontpp_larger_font_map = "<kPlus>"

let s:decimalpat = '[1-9][0-9]*'
let s:fontpat_unix = '^\(\(-[^-]\+\)\{6}-\)\(' . s:decimalpat . '\)'
let s:fontpat_win32 = '\(:h\)\(' . s:decimalpat . '\)\(:\|,\|$\)'

let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 30
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

let s:ms = "map <silent> "
exe s:ms . s:guifontpp_smaller_font_map  . " :call SmallerFont()<CR>"
exe s:ms . s:guifontpp_larger_font_map   . " :call LargerFont()<CR>"

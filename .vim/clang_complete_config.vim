" ----- CLANG COMPLETE CONFIG -----
let g:clang_library_path="/usr/lib/x86_64-linux-gnu/libclang-6.0.so"
set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1

let g:clang_complete_auto=0

" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'

" Complete options (disable preview scratch window, longest removed to aways
" show menu)
set completeopt=menu,menuone


let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
let g:SuperTabMappingForward = '<C-@>'


" Limit popup menu height
set pumheight=20

let g:clang_complete_patterns = 1
let g:clang_complete_macros = 1
let g:clang_debug = 1

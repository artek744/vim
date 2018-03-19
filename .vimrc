"Pathogen is used to easy managed plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()


" ----- COLOR SCHEME -----
colorscheme monokai


" ----- MISCELLANEOUS SETTINGS -----
set number                    " display line numbers
set autoindent                " copy the indentation from the previous line
set encoding=utf-8            " The encoding displayed
set fileencoding=utf-8        " encoding written to file
set noswapfile                " disable .swp files creation
set nobackup                  " disable .backup files creation
set cursorline                " highlight the current line
set clipboard=unnamedplus     " use the system clipboard for copy and paste
set spelllang=en_us           " language for spell checking
syntax enable                 " enable syntax highlighting
filetype on                   " enable file type detection
filetype plugin on            " enable loading the plugin files for specific file types
set backspace=2               " make backspace work like most other apps
set linespace=2               " wihtout this line the underscores are invisible
set linebreak                 " move word to another line when it must be divided


" ----- COLOR FOR SEARCH MATCHES  -----
set hlsearch " set higlight for search matches
nnoremap <silent> <CR> :nohlsearch<CR><CR>
hi Search cterm=NONE ctermfg=black ctermbg=green
hi Search gui=NONE guifg=black guibg=green


" ----- MOVES LINES -----
nnoremap <A-DOWN> :m .+1<CR>==
nnoremap <A-UP> :m .-2<CR>==
inoremap <A-DOWN> <Esc>:m .+1<CR>==gi
inoremap <A-UP> <Esc>:m .-2<CR>==gi
vnoremap <A-DOWN> :m '>+1<CR>gv=gv
vnoremap <A-UP> :m '<-2<CR>gv=gv


" ----- DELETE WITHOUT PUTTING TEXT IN THE REGISTER (COPY) -----
nnoremap <Del> "_x
vnoremap <Del> "_d


" ----- COPY-COMMENT-PASTE -----
vnoremap <C-d> :t'><CR>gv:TComment<CR>`]
nnoremap <C-d> :t.<CR>k:TComment<CR>`]


" ----- ENABLE MOUSE SUPPORT -----
if has('mouse')
	set mouse=a
endif


" ----- INDENT -----
set tabstop=3
set shiftwidth=3

function! TabToggle()
	if &expandtab
		set noexpandtab
		echo "set tabs as indent"
	else
		set expandtab
		echo "set spaces as indent"
	endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>

noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>


" ----- MOVE CURSOR -----
" enable to move the cursor down/up one diplsayed line
" nnoremap <Down> gj
" nnoremap <Up> gk
" vnoremap <Down> gj
" vnoremap <Up> gk
" inoremap <Down> <C-o>gj
" inoremap <Up> <C-o>gk


" ----- SELECT ALL -----
nnoremap <C-a> <esc>ggVG<CR>


" ----- UNDO/REDO -----
nnoremap <C-y> :redo <CR>
nnoremap <C-z> :undo <CR>
inoremap <C-y> <c-o>:redo <CR>
inoremap <C-z> <c-o>:undo <CR>


" ----- QUICK SAVE ------
nnoremap <c-s> :update<CR>
inoremap <c-s> <c-o>:update<CR>
vnoremap <c-s> <Esc>:update <CR>gv


" ----- INDENT/UNINDED -----
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv


" ----- SWITCH TABS -----
nnoremap <TAB> :bnext <CR>
nnoremap <S-TAB> :bprevious <CR>


" ----- NAVIGATION BETWEEN PANES -----
nnoremap <C-Left> <C-W><C-H>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>


" ----- RESIZE SPLITS QUICKLY -----
nnoremap <S-Left> :vertical resize -5 <CR>
nnoremap <S-Right> :vertical resize +5 <CR>
nnoremap <S-Up> :resize -5 <CR>
nnoremap <S-Down> :resize +5 <CR>


" ------ NERDTREE ------
" Shortcut to open nerdtree
map <C-N> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeIgnore += ['\.o$', '\.so$', '\.a$']


" ----- FIND & REPLACE -----
function! SearchAndReplace()
	call inputsave()
	let src = input("source: ")
	echo " "
	let rep = input("replacement: ")
	call inputrestore()

	execute ":%s/".src."/".rep."/gc"
endfunction

noremap <S-F> :call SearchAndReplace()<CR>


" ------ VISIBLITY WHITESPACES ------
set listchars=eol:$,tab:>·,trail:~,extends:>,precedes:<,space:␣
hi NonText ctermfg=121 guifg=#87ff87
hi SpecialKey ctermfg=121 guifg=#87ff87
nnoremap <F10> :set list!<CR>


" ----- GUI SETTINGS FOR VIM GNOME -----
set guioptions-=m		"remove menu bar
set guioptions-=T		"remove toolbar
set guioptions-=r		"remove right-hand scroll bar
set guioptions-=L		"remove left-hand scroll bar
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 14 "set font


" ----- AIRLINE -----
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

if &guifont =~? 'Powerline'
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
else
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
endif

let g:airline_section_z = airline#section#create(['%l','/','%L',' : ','%c'])
set laststatus=2 "the status line appears in every split window


" ----- SYNTASTIC -----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1


" ----- TCOMMENT -----
if has("gui_running")
	nnoremap <C-?> :TComment <CR>
	vnoremap <C-?> :TComment <CR>
	inoremap <C-?> :TComment <CR>
endif


" ----- TAGBAR -----
nmap <F8> :TagbarToggle<CR>


" ----- FOLDING -----
set foldmethod=syntax
set foldlevel=99

hi Folded cterm=NONE ctermfg=black ctermbg=8
hi Folded gui=NONE guifg=black guibg=green

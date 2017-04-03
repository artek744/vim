" ----- PATHOGEN -----
"Pathogen is used to easy managed plugins
execute pathogen#infect()


" ----- COLOR SCHEME -----  
colorscheme monokai


set number
set tabstop=3 
set shiftwidth=3 
set softtabstop=3
set expandtab
set autoindent
set cindent
set encoding=utf-8
set noswapfile
set nobackup 
set cursorline
syntax enable
set laststatus=2
set clipboard=unnamedplus 
set spelllang=en_us
nnoremap <C-z> :undo <CR>
nnoremap <C-y> :redo <CR>


" ----- SWITCH TABS -----
nnoremap <TAB> :tabnext <CR>
nnoremap <S-TAB> :tabprevious <CR>

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
map <A-M> :NERDTreeToggle<CR>  


"Automatically start up nerdtree with vim
"autocmd vimenter * NERDTree  

"Close vim when the only widow
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  


" ----- AIRLINE -----
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
 
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_section_z = airline#section#create(['%l','/','%L',' : ','%c'])


" ----- GUI SETTINGS FOR VIM GNOME -----
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10 "set font


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
nnoremap <C-?> :TComment <CR>
vnoremap <C-?> :TComment <CR>


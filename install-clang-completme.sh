CLANG_CONFIG_FILE="clang_complete_config.vim"
SCRIPT_PATH=$(dirname "$(readlink -f "$0")")

sudo apt-get update
sudo apt-get install clang libclang-dev

cd ~/.vim/bundle
git clone https://github.com/rip-rip/clang_complete
cd clang_complete
make install

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

\" Complete options (disable preview scratch window, longest removed to aways
\" show menu)
set completeopt=menu,menuone

\" Limit popup menu height
set pumheight=20

\" SuperTab completion fall-back
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
" > $SCRIPT_PATH/.vim/$CLANG_CONFIG_FILE


echo '
" Ctrl-Space for completions. Heck Yeah!
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == "" ?
        \ "\<lt>C-n>" :
        \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
        \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
        \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
' >> $SCRIPT_PATH/.vim/$CLANG_CONFIG_FILE
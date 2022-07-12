# Personal Vim config

### Instalation

```
git clone https://github.com/artek744/vim.git
cd vim
./install.sh
```

### Troubleshooting
- **Prevent Vim from clearing the clipboard on exit** - add the following to your .vimrc:
```
autocmd VimLeave * call system('echo ' . shellescape(getreg('+')) . ' | xclip -selection clipboard')
```

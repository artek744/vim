# Personal Vim config

### Instalation

```
git clone --recursive https://github.com/artek744/vim.git
cd vim
./install.sh
```

### Troubleshooting
- **The bottom rigth white border of gvim** - a small addition to the .gtkrc-2.0 file resolves this:

```
style "vimfix" {
  bg[NORMAL] = "#1d1d1d" # Set the background to your vim theme background.
}
widget "vim-main-window.*GtkForm" style "vimfix"
```

- **Prevent Vim from clearing the clipboard on exit** - add the following to your .vimrc:
```
autocmd VimLeave * call system('echo ' . shellescape(getreg('+')) . ' | xclip -selection clipboard')
```

- **Generate ctags file **:
```
ctags --extra=+f -R .
```

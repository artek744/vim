# Personal Vim config

### Instalation

```
git clone --recursive https://github.com/artek744/vim.git
cd vim
./install.sh
```

### Troubleshooting
- **The bottom rigth white border of gvim**
A small addition to the .gtkrc-2.0 file resolves this:

```
style "vimfix" {
  bg[NORMAL] = "#1d1d1d" # Set the background to your vim theme background.
}
widget "vim-main-window.*GtkForm" style "vimfix"
```

# Personal Vim config

### Instalation

```
git clone --recursive https://github.com/artek744/vim.git
cd vim
./install.sh
```
### INSTALL COLOR CODDED - CLANG
First, install all required dependencies.
```
sudo apt-get install build-essential libclang-x.x-dev libncurses-dev libz-dev cmake xz-utils libpthread-workqueue-dev
```
For lua, you must install the version that your version of vim is compiled for.
```
vim --version | grep lua
```
Find your version number -llua5.x and use it to install the correct version.
```
sudo apt-get install liblua5.x-dev lua5.x
```
Since color_coded has a compiled component, you'll need to manually compile when installing and updating (unless your vim package manager does it for you). Compilation works as follows, assuming usage of vundle (see the dependencies section to ensure you can make properly):
```
cd ~/.vim/bundle/color_coded
mkdir build && cd build
cmake ..
make && make install
make clean && make clean_clang
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

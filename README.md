# vimrc
vimrc and plugins

# First time setup
- Install .vimrc
- curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
- git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
- cd ~/.vim/bundle/YouCompleteMe
  python3 install.py
- copy id_rsa id_rsa.pub

# tools
- sudo apt install ack
- sudo apt install libclang-dev
- sudo apt install llvm
- sudo apt install clang-format
- rtags

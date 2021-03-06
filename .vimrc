" execute pathogen#infect()

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/plugin/

set completefunc=RtagsCompleteFunc

let mapleader = ","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'ycm-core/YouCompleteMe'

Plugin 'lyuts/vim-rtags'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" let g:ycm_global_ycm_extra_conf = '/home/calvin/.ycm_extra_conf.py'

call plug#begin('~/.vim/plugged')

" Plug 'ycm-core/YouCompleteMe'
Plug 'neovimhaskell/haskell-vim'
Plug 'kien/ctrlp.vim'
Plug 'wvffle/vimterm'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-dispatch'
" Plug 'natebosch/vim-lsc'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'altercation/vim-colors-solarized'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ap/vim-buftabline'

Plug 'mileszs/ack.vim'

" Plug 'davidhalter/jedi-vim'

" Plug 'ivan-cukic/vim-ctrlp-cscope'

" Plug 'chazy/cscope_maps'

call plug#end()

" autocmd vimenter * NERDTree
autocmd bufnewfile *.it so /users/anikvyas/swift_template.txt
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

syntax on
syntax enable
set background=dark
" colorscheme solarized
filetype plugin indent on
set cursorline
set clipboard=unnamed
set ai
set si
set wrap
set tabstop=4
set shiftwidth=4
set mouse=v
set number
set expandtab
set showmatch
set incsearch
set hlsearch
set showcmd
set laststatus=2
set autoindent
set cmdheight=2
set report=0
set pastetoggle=<F2>
set backspace=indent,eol,start
set ruler
set guioptions+=F
set complete=.,w,b,u
set wildmode=longest,list,full
set wildmenu
" match Todo /\s\+$/
" set tags=./tags,tags,/vob/ios/sys/tags,/vob/ios/sys/TAGS
set tags=./tags,tags;$HOME
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
set dictionary+=/usr/share/lib/dict/words
set path+=/vob/ios

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 2
" " Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
" nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" ctags
nmap <leader>ct :!ctags -R .<CR>

" path to directory where library can be found
" let g:clang_library_path='/usr/lib/llvm-3.8/lib'
" or path directly to the library file
let g:clang_library_path='/nix/store/8a3l4j4w35w9wkas3f8aq4c8fsaw4kpk-clang-8.0.0-lib/lib/'

" Ack
" nmap <leader>ak :Ack 
" nnoremap <buffer> <leader>ak :Ack SomeFunc(input('Param: '))<CR>


" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%8000v.\+/
:com! -nargs=? T tabedit <args>

" CtrlP - mappings
" Setup some default ignores
let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
   \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" cscope
nmap <leader>cs :CtrlPCScopeSymbol<cr>

let g:rtagsRcCmd = '$CMAKE_INCLUDE_PATH'

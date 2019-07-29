" execute pathogen#infect()

set runtimepath^=~/.vim/plugin/

let g:lsc_server_commands = {'lua': 'lua-lsp', 'it': 'lua-lsp'}
let g:lsc_trace_level = 'verbose'
let g:lsc_autoStart = 1
let g:lsc_enable_autocomplete = v:true
let g:lsc_auto_map = v:true
let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'FindReferences': 'gr',
    \ 'FindCodeActions': 'ga',
    \ 'DocumentSymbol': 'go',
    \ 'ShowHover': 'K',
    \ 'Completion': 'completefunc',
     \}
let mapleader = ","

call plug#begin('~/.vim/plugged')

Plug 'lyuts/vim-rtags'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'wvffle/vimterm'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-dispatch'
Plug 'natebosch/vim-lsc'
Plug 'ycm-core/YouCompleteMe'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'tpope/vim-fugitive'
Plug 'LnL7/vim-nix'
Plug 'vim-syntastic/syntastic'
"Plug 'Valloric/YouCompleteMe'

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

call plug#end()

" autocmd vimenter * NERDTree
" autocmd BufWritePost
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
set tags=./tags,tags,/vob/ios/sys/tags,/vob/ios/sys/TAGS
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
set dictionary+=/usr/share/lib/dict/words
set path+=/vob/ios
" Taglist plugin mappings
if $OSTYPE == "linux"
    let Tlist_Ctags_Cmd='/users/yega/tools/ctags/linux/bin/ctags'
else
    let Tlist_Ctags_Cmd='/usr/cisco/bin/ctags'
endif

nmap <leader>t :CCTreeTraceForward<CR>

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

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

nmap <leader>m !run_tests<CR>

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/
:com! -nargs=? T tabedit <args>

" CtrlP - mappings
" Setup some default ignores
let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
   \ 'file': '\v\.(nix|exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Anduril stuff
call glaive#Install()

augroup autoformat_settings
    autocmd!
    autocmd FileType cpp AutoFormatBuffer
augroup END

Glaive codefmt
    \ plugin[mappings]=',='
    \ clang_format_executable='/nix/store/ncxn8iw8qh8aca0r51cnfb9myk4mcn44-clang-8.0.0/bin/clang-format'
    \ clang_format_style='file'

map <C-j> :w <CR> :!cat % \| jq . \| tee % <CR> :e <CR>
map <C-w> :w <CR> :! $(clang-tidy -fix-errors % -- -std=c++17 -x c++) <CR> :e <CR>
map <C-a> 1Gi//<CR> Copyright 2019 Anduril Industries<CR><CR><Bs><Bs><Bs><CR><Esc>

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftwidth=4
set smarttab
set textwidth=0

autocmd BufWritePre * :%s/\s\+$//e

nmap <F1> :if expand('%:e')=='hh'<CR>e %:r.cc<CR>else<CR>e %:r.hh<CR>endif<CR><CR>

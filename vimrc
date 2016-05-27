set nocompatible    

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'majutsushi/tagbar'

call vundle#end()


"syntax stuff"
filetype plugin indent on
syntax on
syntax enable
highlight Comment ctermfg=blue

"indentation
set smartindent
set autoindent
set smarttab

"tabs
set tabstop=4    
set shiftwidth=4     
set softtabstop=4
set noexpandtab
set shiftround
"tab completion
set wildmenu
set wildmode=list:longest,full

"Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

"No shitty sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"Backup off, redundant anyway
set nobackup
set nowb
set noswapfile


"General settings
set showmatch
set magic "regexp support
set ruler
set backspace=indent,eol,start
set number
set mouse=a
set pastetoggle=<F2>
set showmatch
set cursorline
set encoding=utf-8
set splitbelow
set splitright
set virtualedit=all
set foldmethod=indent
set foldlevel=99
set fileformat=unix

let mapleader=","

"Colorschemes

set background=dark
colorscheme solarized

" vim-airline settings"
set laststatus=2

" When powerline fonts are installed
let g:airline_powerline_fons=1
" Show PASTE if in paste mode
let g:airline_detect_paste=1
" Show airline for tabs too
let g:airline#extensions#tabline#enabled=1


"Nerdtree (tabs) settings
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
 " To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0



"useful mappings

map j gj
map k gk

map <silent> <Leader>e :Errors<CR>

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

"Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>"

nnoremap ; :
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" Return to last edit position when opening files 
autocmd BufReadPost *
	\  if line("'\"") > 0 && line("'\"") <= line("$") |
	\     exe "normal! g`\"" |
	\   endif


set nocompatible    

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/NERDTree'
Plugin 'ervandew/supertab'
Plugin 'Townk/vim-autoclose'
Plugin 'rgrinberg/vim-ocaml'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on
syntax on



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


"Tabs and indent
set tabstop=8    
set shiftwidth=8     
set softtabstop=8
set noexpandtab
set shiftround
set smarttab
set autoindent
set smartindent
set wrap

"General sets
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
syntax enable

let g:solarized_termcolors=256
colorscheme solarized

if has('gui_running')
        set background=dark
    else
        set background=dark
endif

"useful random

map j gj
map k gk

"Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

map <silent> <Leader>e :Errors<CR>



" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

"Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>"


nnoremap ; :
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Return to last edit position when opening files 
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
set viminfo^=%


autocmd FileType c         set makeprg=gcc\ -Wall\ -O2
autocmd FileType cpp       set makeprg=g++\ -Wall\ -O2
autocmd FileType python    set makeprg=python3

" Save, compile and run files
function! CompileAndRun()
  write
  silent! make %
  redraw!
  cwindow
  if len(getqflist()) == 0
    exec '!time ./a.out'
  endif
endfunction
nnoremap <leader>c :call CompileAndRun()<cr>
                           

"function! Tab_Or_Complete()
"      if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"              return "\<C-N>"
"      else
"            return "\<Tab>"
"      endif
"endfunction
":inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

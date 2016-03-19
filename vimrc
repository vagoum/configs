set nocompatible    

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'morhetz/gruvbox'

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


"line folding after 79 characters
set tw=79
set formatoptions+=t


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

"Gruvbox
colorscheme gruvbox



if has('gui_running')
        set background=dark
    else
        set background=dark
endif

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

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif


set statusline=
	\%F%m%r%h%w\ [format=%{&ff}]\ [type=%{&ft}]\ [%l,%v][%p%%]\ 
	\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}

nmap <leader>s :exec "set laststatus=" . (( &laststatus == 1) ? 2 : 1) <CR>





" Return to last edit position when opening files 
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
set viminfo^=%

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType ocaml source /Users/vagoum/.opam/system/share/typerex/ocp-indent/ocp-indent.vim

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

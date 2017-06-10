func! SetMouse()
  if &mouse == "n"
    set mouse=
  else
    set mouse=n
  endif
endfunc

colorscheme evening

set nocompatible
set number
syntax on
set cursorline
set ruler

set shiftwidth=4
set softtabstop=4
set tabstop=4
set showcmd
set background=dark

set nobackup
set ignorecase smartcase
set nowrapscan
set incsearch
set hlsearch

set autoindent
set smartindent
set cindent

set encoding=utf-8
set termencoding=utf-8

map <F4> <Esc>:call SetMouse()<cr><Esc>
map <F1> <Esc>0i//<Esc>
"save cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"enable mouse function
set mouse=n
"set paste
set pastetoggle=


set encoding=utf-8
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

filetype on
filetype indent on

set backspace=indent,eol,start
set showmatch
set matchtime=2
set noexpandtab

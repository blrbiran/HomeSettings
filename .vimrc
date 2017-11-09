func! SetMouse()
  if &mouse == "n"
    set mouse=
  else
    set mouse=n
  endif
endfunc

colorscheme evening

syntax on
set nocompatible
set number
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
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

filetype on
filetype indent on

set backspace=indent,eol,start
set showmatch
set matchtime=2

set noexpandtab
set noerrorbells	"no bells when occurs error

map <F4> <Esc>:call SetMouse()<cr><Esc>
map <12> <Esc>:set list!<cr><Esc>
map <F1> <Esc>0i//<Esc>
"save cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"enable mouse function
set mouse=n
"set paste
set pastetoggle=<F11>

inoremap jj <Esc>
let mapleader=","

"setting system clipboard
if has('win32')
	vmap <C-Insert> "+y
	nmap <C-Insert> "+y
	vmap <S-Insert> "-d"+gP
	nmap <S-Insert> "+gP
elseif has('unix')
elseif has('mac')
endif

map <C-F12> <Esc>:!ctags -R .<CR>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Open=1
set cscopequickfix=s-,c-,d-,i-,t-,e-

"press F5 for compile & run
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -DLOCAL -o   %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -std=c++11 -DLOCAL -Dxiaoai -o    %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python %"
	endif
endfunc

func! SetMouse()
  if &mouse == "n"
    set mouse=
  else
    set mouse=n
  endif
endfunc

syntax on
set nocompatible
set number
set cursorline
set ruler

set shiftwidth=8
set softtabstop=8
set tabstop=8
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

let mapleader="\<Space>"

map <F12> <Esc>:set list!<cr><Esc>
map <F1> <Esc>0i//<Esc>

map <F4> <Esc>:call SetMouse()<cr><Esc>
"save cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"enable mouse function
set mouse=n

"set paste
set pastetoggle=<F10>

" Quit insert mode
inoremap jj <Esc>

" Move to the start of line
nnoremap H ^
" Move to the end of line
nnoremap L $

"create a new file
nnoremap <Leader>o :CtrlP<CR>
"save current file
nnoremap <Leader>w :w<CR>

"setting system clipboard
if has('win32')
	vmap <C-Insert> "+y
	nmap <C-Insert> "+y
	vmap <S-Insert> "-d"+gP
	nmap <S-Insert> "+gP
elseif has('unix')
elseif has('mac')
endif

set tags=tags;
map <C-F12> <Esc>:!ctags -R .<CR>
"map <F6> <Esc>:TlistToggle<cr><Esc>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=1
let Tlist_Close_On_Select=1

" Open the TagList Plugin <F6>
nnoremap <silent> <F6> :TlistToggle<CR>

set cscopequickfix=s-,c-,d-,i-,t-,e-

" New Tab
nnoremap <silent> <C-c> :tabnew<CR>
" Next Tab
nnoremap <silent> <C-h> gT
" Previous Tab
nnoremap <silent> <C-l> gt

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

if exists('$TMUX')
	set term=screen-256color
endif

" Highlight over 80 char
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>80v.\+/

" Plugins
" powerline
" before this, run "pip install powerline_status"
set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'

" Color theme
syntax enable
set background=dark
"set background=light
colorscheme solarized
let g:solarized_termcolors=256
"colorscheme evening

" reference: https://gist.github.com/jnaulty/55d03392c37e9720631a

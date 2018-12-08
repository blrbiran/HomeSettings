set encoding=utf-8
set termencoding=utf-8
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
if has("win32")
	set fileencoding=gb18030
	" fix menu
	source $VIMRUNTIME\delmenu.vim
	source $VIMRUNTIME\menu.vim
else
	set fileencoding=utf-8
endif

" For Vundle plugins
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Install Vundle
"mkdir -p ~/.vim/bundle
"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" let plugin installed
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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
nnoremap <Leader>o :CtrlP<cr>
"save current file
nnoremap <Leader>s :w<cr>

"setting system clipboard
if has('win32')
	vmap <C-Insert> "+y
	nmap <C-Insert> "+y
	vmap <S-Insert> "-d"+gP
	nmap <S-Insert> "+gP
elseif has('unix')
elseif has('mac')
endif

" Auto search tags file
set tags=tags;
"map <C-F12> <Esc>:!ctags -R .<cr>
"map <F6> <Esc>:TlistToggle<cr><Esc>
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window=1
"let Tlist_Auto_Open=1
"let Tlist_Close_On_Select=1

" Open the TagList Plugin <F6>
"nnoremap <silent> <F6> :TlistToggle<cr>

" Open tagbar plugin <F6>
nmap <F6> :TagbarToggle<cr>

" New Tab
nnoremap <silent> <C-c> :tabnew<cr>
" Next Tab
nnoremap <silent> <C-h> gT
" Previous Tab
nnoremap <silent> <C-l> gt

"press F5 for compile & run
map <F5> :call CompileRunGcc()<cr>
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
let g:wordline_on = "n"

func! Set80Word()
  if g:wordline_on == "n"
    let g:wordline_on = "y"
    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%>80v.\+/
  else
    hi clear
    let g:wordline_on = "n"
  endif
endfunc

map <F9> <Esc>:call Set80Word()<cr><Esc>

"解决crontab -e时，提示crontab: temp file must be edited in place
autocmd filetype crontab setlocal nobackup nowritebackup

" Color theme
"syntax enable
"autocmd ColorScheme solarized hi Normal ctermbg=black
"autocmd ColorScheme evening hi Normal ctermbg=black
"set background=dark
"set background=light
"colorscheme evening
"colorscheme ir_black
"colorscheme grb256
"colorscheme distinguished
"colorscheme guardian2
"colorscheme twilight
"colorscheme vividchalk
colorscheme jellybeans
"colorscheme github
let g:solarized_termcolors=256
"colorscheme solarized

" reference: https://gist.github.com/jnaulty/55d03392c37e9720631a

" Plugins
" powerline
" before this, run "pip install powerline_status"
set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'

" easy motion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap S <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" CtrlP
" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'
" If none of the default markers (.git .hg .svn .bzr _darcs) are present in a project, you can define additional ones with g:ctrlp_root_markers
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']
" Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore. If a custom listing command is being used, exclusions are ignored
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" Use a custom file listing command
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Vim-go
" Disable auto download
let g:go_disable_autoinstall = 0

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <S-j> <Esc>:cn<cr>
nmap <S-k> <Esc>:cp<cr>


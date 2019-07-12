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

if exists('$TMUX')
	set term=screen-256color
endif

" For Vundle plugins
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Install Vundle
" mkdir -p ~/.vim/bundle
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Let plugin installed
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Normal Settings
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

" Save cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" Enable mouse function
set mouse=n
func! SetMouse()
  if &mouse == "n"
    set mouse=
  else
    set mouse=n
  endif
endfunc

" Setting system clipboard
if has('win32')
	vmap <C-Insert> "+y
	nmap <C-Insert> "+y
	vmap <S-Insert> "-d"+gP
	nmap <S-Insert> "+gP
elseif has('unix')
elseif has('mac')
endif

" 解决crontab -e时，提示crontab: temp file must be edited in place
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
" Powerline
" Before this, run "pip install powerline_status"
set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'
" Reference: https://gist.github.com/jnaulty/55d03392c37e9720631a

" Easy Motion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap S <Plug>(easymotion-overwin-f2)
" Move to line
map  <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" CtrlP
" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Search more sub folders
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=5
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

" NERDTree
""开启Nerdtree时自动显示Bookmarks
"let NERDTreeShowBookmarks=1
""自动开启Nerdtree
"autocmd vimenter * NERDTree
"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""修改树的显示图标
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
""窗口位置
let g:NERDTreeWinPos='left'
""Window Size
let g:NERDTreeSize=30
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeHidden=0
""过滤所有.pyc文件不显示
let NERDTreeIgnore = ['\.pyc$']
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

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

" Auto search tags file
set tags=tags;
"map <C-F12> <Esc>:!ctags -R .<cr>
" Default search tag than cscope
set cscopetagorder=0

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Open the TagList Plugin
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window=1
"let Tlist_Auto_Open=1
"let Tlist_Close_On_Select=1

" For tagbar update slow
set updatetime=500

" Press F5 for compile & run
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

func! Set80Word_v2()
  if g:wordline_on == "n"
    let g:wordline_on = "y"
    set textwidth=80
    set colorcolumn=+1
    hi ColorColumn ctermbg=lightgrey guibg=lightgrey
  else
    "hi clear
    set colorcolumn=
    let g:wordline_on = "n"
  endif
endfunc

" Short Key Bindings
" Quit insert mode
inoremap jj <Esc>

" Move to the start of line
nnoremap H ^
" Move to the end of line
nnoremap L $

" Create a new file
nnoremap <Leader>o :CtrlP<cr>
" Save current file
nnoremap <Leader>s :w<cr>

" New Tab
nnoremap <silent> <C-c> :tabnew<cr>
" Next Tab
nnoremap <silent> <C-h> gT
" Previous Tab
nnoremap <silent> <C-l> gt

" Short keys
map <F1> <Esc>0i//<Esc>
""将F2设置为开关NERDTree的快捷键
map <F2> :NERDTreeToggle<cr>
map <F3> <Esc>:Ack<Space>
map <F4> <Esc>:call SetMouse()<cr><Esc>
map <F5> :call CompileRunGcc()<cr>
" Open tagbar plugin <F6>
nmap <F6> :TagbarToggle<cr>
"map <F8> <Esc>:TlistToggle<cr><Esc>
call Set80Word_v2()
map <F9> <Esc>:call Set80Word_v2()<cr><Esc>
" Set paste
set pastetoggle=<F10>
map <F12> <Esc>:set list!<cr><Esc>


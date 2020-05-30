" Vundle Plugins: {{{1

set nocompatible " be iMproved, required
filetype off " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Install Vundle
" mkdir -p ~/.vim/bundle
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" === Taglist & Functions
Plugin 'majutsushi/tagbar'
"Plugin 'vim-scripts/taglist.vim'
Plugin 'tacahiroy/ctrlp-funky'

" === File Management
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

" === Moving
Plugin 'easymotion/vim-easymotion'

" === Editor Enhancement
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'

" === Misc
Plugin 'mbbill/undotree'

" === Language Support
Plugin 'fatih/vim-go'

" === Search
Plugin 'mileszs/ack.vim'

" === Color Theme
Plugin 'ajmwagar/vim-deus'
"Plugin 'jacoborus/tender.vim'

" === Visual Enhancement
Plugin 'luochen1990/rainbow'
Plugin 'RRethy/vim-illuminate'
Plugin 'Yggdroot/indentLine'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Mark--Karkat'

" Statusbar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'powerline/powerline'

" Git
Plugin 'airblade/vim-gitgutter'

" === Snippets
"Plugin 'Valloric/YouCompleteMe'
" Track the engine
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" }}}
" Common Settings: {{{1

" Should place before map <Leader> key
let mapleader = "\<Space>"

syntax on
set nocompatible " Not compatible to VI
set number " nu: set nu!(Toggle), set nu?(Status)
set relativenumber " rnu
set cursorline
set ruler
set showcmd " display incomplete commands
set wildmenu " using tab to switch into command shortlist
set wildmode=longest:list,full " display command shortlist
set background=dark
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set showmatch " show matched (,[,{
set matchtime=2
set noerrorbells " no bells when occurs error
set wrap " auto wrap line
set linebreak " no wrap in word
set nowrapscan
set scrolloff=3 " cursor position when scroll
set incsearch " do incremental searching
set hlsearch " highlight searching results
set ignorecase smartcase
set autochdir " auto change workdir
set autoread " notify when file changed
set history=1000

set autoindent
set smartindent
set cindent

set shiftwidth=8
set softtabstop=8
set tabstop=8
set noexpandtab

"set noswapfile " no .*.swp file
set nobackup " do not keep a *~ backup file
set noundofile " do not keep a .un~* file
"" Set global backup,swap,undo files
"silent !mkdir -p $HOME/.cache/.vim/backup/
"silent !mkdir -p $HOME/.cache/.vim/swp/
"silent !mkdir -p $HOME/.cache/.vim/undo/
set backupdir=$HOME/.cache/.vim/backup//,. " set backup folder, // means absolute path
set directory=$HOME/.cache/.vim/swp//,. " set swap folder
set undodir=$HOME/.cache/.vim/undo//,. " set undo folder
"if has('persistent_undo')
"	set undofile
"endif

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

	" Set GVIM font size
	set guifont=Courier\ New:h12
else
	set fileencoding=utf-8
endif

if exists('$TMUX') && !has('nvim')
	set term=screen-256color
endif

" }}}
" Color Theme: {{{1

"set background=dark
"set background=light
"autocmd ColorScheme solarized hi Normal ctermbg=black
"autocmd ColorScheme evening hi Normal ctermbg=black
let g:solarized_termcolors = 256
"colorscheme solarized
"colorscheme evening
"colorscheme ir_black
"colorscheme grb256
"colorscheme distinguished
"colorscheme guardian2
"colorscheme twilight
"colorscheme vividchalk
"colorscheme github
"colorscheme jellybeans
"colorscheme tender
color deus

" }}}
" Plugin Settings: {{{1

" ===
" === Powerline
" ===
" Before this, run "pip install powerline_status"
"set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim/
"set laststatus=2
"set t_Co=256
"let g:Powerline_symbols = 'fancy'
" Reference: https://gist.github.com/jnaulty/55d03392c37e9720631a

" ===
" === Airline
" ===
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#bufffer_nr_show = 1

" ===
" === Airline Themes
" ===
let g:airline_theme='jellybeans'
"let g:airline_theme='deus'

" ===
" === Easy Motion
" ===
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap S <Plug>(easymotion-overwin-f2)
" Move to line
"map  <Leader>l <Plug>(easymotion-bd-jk)
"nmap <Leader>l <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" ===
" === CtrlP
" ===
" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-o>'
let g:ctrlp_cmd = 'CtrlP'
" Search more sub folders
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 5
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

" ===
" === NERDTree
" ===
""开启Nerdtree时自动显示Bookmarks
"let NERDTreeShowBookmarks = 1
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
let g:NERDTreeWinPos = 'left'
""Window Size
let g:NERDTreeSize = 30
""窗口是否显示行号
let g:NERDTreeShowLineNumbers = 1
""不显示隐藏文件
let g:NERDTreeHidden = 0
""过滤文件不显示
let NERDTreeIgnore = ['\.pyc$', '\.swp']
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ===
" === Vim-go
" ===
" Disable auto download
let g:go_disable_autoinstall = 0
" Disable warning for Vim 7.4
let g:go_version_warning = 0

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" ===
" === TagList
" ===
" Open the TagList Plugin
"let Tlist_Show_One_File = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Use_Right_Window = 1
"let Tlist_Auto_Open = 1
"let Tlist_Close_On_Select = 1

" ===
" === Tagbar
" ===
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
" For tagbar update slow
set updatetime=500
" tagbar width
let g:tagbar_width = 40
" tagbar position
let g:tagbar_right = 1
" auto close tagbar when selected
"let g:tagbar_autoclose = 1

" ===
" === Undotree
" ===
noremap U :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> r <plug>UndotreeNextState
	nmap <buffer> u <plug>UndotreePreviousState
	nmap <buffer> R 5<plug>UndotreeNextState
	nmap <buffer> U 5<plug>UndotreePreviousState
endfunc

" ===
" === Ctags
" ===
" Auto search tags file
set tags=tags;
"map <C-F12> <Esc>:!ctags -R .<cr>

" ===
" === Cscope
" ===
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <S-j> <Esc>:cn<cr>
nmap <S-k> <Esc>:cp<cr>

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

" ===
" === OmniCppComplete
" ===
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1 " 输入 . 后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

" ===
" === UltiSnips
" ===
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<S-j>"
let g:UltiSnipsJumpBackwardTrigger = "<S-k>"
"let g:UltiSnipsListSnippets = "<c-i>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit = "vertical"

" ===
" === rainbow
" ===
let g:rainbow_active = 1

" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 750
"hi illuminateWord cterm=undercurl gui=undercurl
"hi illuminateWord cterm=underline gui=underline

" ===
" === auto-pairs
" ===
" auto-pairs rules: ex1. Add space after comma. ',':' '
"let g:AutoPairs = {',':' ', '(':')', '[':']', '{':'\}', "'":"'", '"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", "`":"`", '```':'```'}

" ===
" === indentLine
" ===
" 设置Gvim的对齐线样式
let g:indentLine_char = "┊"
let g:indentLine_first_char = "┊"
" 设置对齐线默认开1/关0状态
let g:indentLine_enabled = 1
" 设置 GUI 对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
" let g:indentLine_color_gui = '#A4E57E'
" 设置终端对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
" let g:indentLine_color_term = 239

" ===
" === vim-gitgutter
" ===
let g:gitgutter_terminal_reports_focus = 0
" don't set up any mappings at all
let g:gitgutter_map_key = 0
" To turn off vim-gitgutter by default
let g:gitgutter_enabled = 0

" }}}
" My Functions: {{{1

" Press F5 for compile & run
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -DLOCAL -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -std=c++11 -DLOCAL -Dxiaoai -o %<"
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

" Enable mouse function
set mouse=a " Support mouse in all mode
" set mouse=n " Support mouse in normal mode
func! SetMouse()
  if &mouse == "a"
   set mouse=n
  elseif &mouse == "n"
   set mouse=
  else
   set mouse=a
  endif
endfunc

" Highlight over 80 char
let g:wordline_on = "n"
let g:CC_ctermbg = &bg
let g:CC_guibg = &bg

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
    set textwidth=0
    "set textwidth=80
    "set colorcolumn=+1
    set colorcolumn=81
    hi ColorColumn ctermbg=lightgrey guibg=lightgrey
  else
    "hi clear
    set colorcolumn=
    "set textwidth=0
    let g:wordline_on = "n"
  endif
endfunc

let g:kerStyle = "y"
func! KernelStyle()
  if g:kerStyle == "y"
    let g:kerStyle = "n"
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4
    set expandtab
  else
    let g:kerStyle="y"
    set shiftwidth=8
    set softtabstop=8
    set tabstop=8
    set noexpandtab
  endif
endfunc

" }}}
" Hot Key Bindings: {{{1

" Quit from insert mode
inoremap jj <Esc>

noremap ; :

" Save current file
nnoremap <Leader>s :w<cr>

" Move to the start of line
nnoremap H ^
" Move to the end of line
nnoremap L $

" Create a new file
nnoremap <Leader>o :CtrlP .<cr>
nnoremap <Leader>b :CtrlPBuffer<cr>
nnoremap <Leader>t :CtrlPFunky<cr>
" 设置对齐线开/关快捷键
nnoremap <Leader>l :IndentLinesToggle<CR>
nnoremap <Leader>g :GitGutterToggle<CR>

" Setting system clipboard
if has('win32')
	"vmap <C-Insert> "+y
	"nmap <C-Insert> "+y
	"vmap <S-Insert> "-d"+gP
	"nmap <S-Insert> "+gP
	vnoremap <C-c> "+y
	nnoremap <C-c> "+Y
	vnoremap <C-i> "+p
	nnoremap <C-i> "+p
elseif has('unix')
	vnoremap <C-c> "+y
	nnoremap <C-c> "+Y
	vnoremap <C-i> "+p
	nnoremap <C-i> "+p
elseif has('mac')
endif

" New Tab
nnoremap <silent> <Leader>t :tabnew<cr>
" Next Tab
nnoremap <silent> <C-h> gT
" Previous Tab
nnoremap <silent> <C-l> gt

" Next Buffer
nnoremap <C-n> :bn<cr>
" Previous Buffer
nnoremap <C-p> :bp<cr>

" find and replace
noremap \g :%s///g<left><left><left>

" Disable the default s key
noremap s <nop>

" Window management
noremap <Leader>q <Esc>:close<cr>

" Shortkeys
noremap <F1> <Esc>0i//<Esc>
""将F2设置为开关NERDTree的快捷键
noremap <F2> :NERDTreeToggle<cr>
noremap <F3> <Esc>:Ack<Space>
noremap <F5> :call CompileRunGcc()<cr>
" Open tagbar plugin <F6>
nnoremap <F6> :TagbarToggle<cr>
noremap <F7> <Esc>:call KernelStyle()<cr><Esc>
noremap <F8> <Esc>:call SetMouse()<cr><Esc>
" map <F8> <Esc>:TlistToggle<cr><Esc>
call Set80Word_v2()
noremap <F9> <Esc>:call Set80Word_v2()<cr><Esc>
" Set paste
set pastetoggle=<F10>
noremap <F12> <Esc>:set list!<cr><Esc>

" }}}
" Autocmd: {{{1

" Reload .vimrc when changed
augroup Reload_vimrc
	autocmd!
	autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
	" Fold .vimrc when loaded
	autocmd! BufEnter $MYVIMRC set foldenable | set foldmethod=marker
augroup END

" Save cursor position
"au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe("normal! g`\"") | endif

" 解决crontab -e时，提示crontab: temp file must be edited in place
autocmd filetype crontab setlocal nobackup nowritebackup

autocmd filetype c,cpp set shiftwidth=8|set softtabstop=8|set tabstop=8|set noexpandtab

" }}}
" Load Machine Specific Settings {{{1

" Please touch ~/.machine-specific.vim to define machine specific settings.
if !empty(glob('~/.machine-specific.vim'))
  source ~/.machine-specific.vim
endif

" }}}

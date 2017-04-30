" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'

Plug 'fholgado/minibufexpl.vim'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-scripts/taglist.vim', { 'on':  'Tlist' }
Plug 'vim-scripts/winmanager'

Plug 'vim-scripts/lookupfile'
Plug 'vim-scripts/genutils'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

Plug 'Shougo/neocomplete.vim'

" 自动括号补全
Plug 'Raimondi/delimitMate'

Plug 'majutsushi/tagbar'

" 快速加减注释
" <Leader>ci 以每行一个 /* */ 注释选中行(选中区域所在行)，再输入则取消注释
" <Leader>cm 以一个 /* */ 注释选中行(选中区域所在行)，再输入则称重复注释
" <Leader>cc 以每行一个 /* */ 注释选中行或区域，再输入则称重复注释
" <Leader>cu 取消选中区域(行)的注释，选中区域(行)内至少有一个 /* */
" <Leader>ca 在/*...*/与//这两种注释方式中切换（其它语言可能不一样了）
" <Leader>cA 行尾注释
Plug 'scrooloose/nerdcommenter'

" 括号匹配高亮
Plug 'luochen1990/rainbow'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-syntastic/syntastic'

Plug 'artur-shaik/vim-javacomplete2'

call plug#end()

syntax enable
syntax on
colorscheme desert
set ignorecase "搜索忽略大小写"
set enc=utf-8  "编码设置"

""""""""""""""""""""""""""""""
" vim-javacomplete2 setting
""""""""""""""""""""""""""""""
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

""""""""""""""""""""""""""""""
" syntastic setting
""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""
" airline setting
""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_theme='solarized'

""""""""""""""""""""""""""""""
" rainbow setting
""""""""""""""""""""""""""""""
let g:rainbow_active = 1

""""""""""""""""""""""""""""""
" nerdcommenter setting
""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

""""""""""""""""""""""""""""""
" tagbar setting
""""""""""""""""""""""""""""""
let g:tagbar_ctags_bin = '~/Git/ctags-5.8/ctags'
let g:tagbar_autofocus = 1
nmap <F3> :TagbarToggle<CR>

""""""""""""""""""""""""""""""
" taglist setting
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '~/Git/ctags-5.8/ctags'
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Auto_Open=1

""""""""""""""""""""""""""""""
" winManager setting
"""""""""""""""""""""""""""""" 
let g:winManagerWindowLayout='FileExplorer'
" nmap wm :WMToggle<cr>:Tlist<cr>
nmap wm :WMToggle<cr>:TagbarToggle<cr>
" let g:winManagerWindowLayout='NERDTree'
" nmap wm :NERDTreeToggle<cr>:Tlist<cr> 

 """"""""""""""""""""""""""""""
 " minibuffer setting
 """"""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1

noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l 

""""""""""""""""""""""""""""""
" LookupFilee setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 4  "最少输入4个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0 "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1 "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1 "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0 "不允许创建不存在的文件

"lf = LookupFile
nmap lf :LUTags<cr>
"lb = LUBufs
nmap lb :LUBufs<cr>
"lw = LUWalk
nmap lw :LUWalk<cr>
"选择文件上下ctrl+n/ctrl+p ctrl+u快捷键清空
let g:LookupFile_TagExpr='"/Volumes/PetePalm/AOSP/android44/filenametags"'

""""""""""""""""""""""""""""""
" cscopse setting
""""""""""""""""""""""""""""""
"查找C语言符号，即查找函数名、宏、枚举值等出现的地方
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"查找调用本函数的函数
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"查找指定的字符串
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"查找egrep模式，相当于egrep功能，但查找速度快多了
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"查找并打开文件，类似vim的find功能
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"查找包含本文件的文件
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"查找本函数调用的函数
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""
" ctags setting
""""""""""""""""""""""""""""""
set tags+=/Volumes/PetePalm/AOSP/android44/androidtags
cscope add /Volumes/PetePalm/AOSP/android44/cscope.out

" This is the default extra key bindings
let g:fzf_action = {
   \ 'ctrl-t': 'tab split',
   \ 'ctrl-x': 'split',
   \ 'ctrl-v': 'vsplit' }

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
     \ 'default' : '',
     \ 'vimshell' : $HOME.'/.vimshell_hist',
     \ 'scheme' : $HOME.'/.gosh_completions'
     \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] ='\h\w*'

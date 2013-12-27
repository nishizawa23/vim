"base configure

set helplang=cn "set help language to chinese

set mouse=a

set selection=exclusive

set selectmode=mouse,key

set nocompatible "diff for vi

syntax enable

colorscheme default

"code style
"
set autoindent

set cindent "使用C样式的缩进

set smartindent "为C程序提供自动缩进

set tabstop=4 "制表符为8

set shiftwidth=4 "统一缩进为8

"set softtabstop=8 "atuo tabstop & shiftwidth

set noexpandtab "不要用空格代替制表符

filetype plugin indent on 
"hotkey


nmap ^A :%s/\s\+$//e<cr> "ctrl + a can clean tab or space

let g:template_load = 1

let g:template_tags_replacing = 1

let g:T_AUTHOR = "huangxinghua"

let g:T_AUTHOR_EMAIL = "nishizawa23@gmail.com"

let g:T_AUTHOR_WEBSITE = "http://www.nishizawa23.com"

let g:T_DATE_FORMAT = "%Y-%m-%d %H:%M:%S"

"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
""autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
""autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

"sub witd
nmap <Left> <C-w><
"add witd
nmap <Right> <C-w>>
"sub high
nmap <Up> <C-w>+
"add high
nmap <Down> <C-w>-

"cscope
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"lookupfile F5 to start
let g:LookupFile_MinPatLength = 2  "最少输入2个字符才开始查找
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

let g:LookupFile_TagExpr='"/home/pete/Android/hitown/android/android235_oemlhc/filenametags"'

set tags+=/home/pete/Android/hitown/android/android235_oemlhc/tags
cscope add /home/pete/Android/hitown/android/android235_oemlhc/cscope.out
"set tags+=/home/pete/Android/kernel/goldfish/tags

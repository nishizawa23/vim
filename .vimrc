syntax enable
"set background=light
"set background=dark
"colorscheme solarized
colorscheme desert

""""""""""""""""""""""""""""""
" template_loader.vim setting
""""""""""""""""""""""""""""""
let g:template_load = 1

let g:template_tags_replacing = 1

let g:T_AUTHOR = "nishizawa23"

let g:T_AUTHOR_EMAIL = "nishizawa23@gmail.com"

let g:T_AUTHOR_WEBSITE = "http://nishizawa23.github.io"

let g:T_DATE_FORMAT = "%Y-%m-%d"


""""""""""""""""""""""""""""""
" taglist setting
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '~/Git/ctags-5.8/ctags'
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Exit_OnlyWindow = 1         "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Auto_Open=1


""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>:Tlist<cr>


""""""""""""""""""""""""""""""
" minibuffer setting
""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1

""""""""""""""""""""""""""""""
" window size change setting
""""""""""""""""""""""""""""""
"sub wide
nmap <Left> <C-w><
"add wide
nmap <Right> <C-w>>
"sub high
nmap <Up> <C-w>+
"add high
nmap <Down> <C-w>-

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
"选择文件上下ctrl+n/ctrl+p
let g:LookupFile_TagExpr='"/Volumes/android/JB/filenametags"'

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
set tags+=/Volumes/android/JB/androidtags
cscope add /Volumes/android/JB/cscope.out

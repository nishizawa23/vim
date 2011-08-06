"set tags=/home/nishizawa23/MyFile/8180/opt/crosstool/arm-linux/gcc-3.4.4-glibc-2.3.5/arm-linux/arm-linux/include/tags
"set tags+=/home/nishizawa23/MyFile/8180/ffmpeg-0.4.8/tags


set helplang=cn

let g:winManagerWindowLayout='FileExplorer|TagList'

nmap wm :WMToggle<cr>

nmap <F6> :cn<cr>
nmap <F7> :cp<cr>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1

"set autoindent
"set shiftwidth=4
"set cindent
" 自动格式化
set formatoptions=tcrqn

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 为C程序提供自动缩进
set smartindent

" 使用C样式的缩进
set cindent

" 制表符为4
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 不要用空格代替制表符
set noexpandtab

" 不要换行
set nowrap

" 在行和段开始处使用制表符
set smarttab

set list
set listchars=tab:>-,trail:@
"set listchars=tab:»\ ,trail:·,extends:»,precedes:«,eol:¶

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
"match tab /\t/
highlight tab ctermbg=DarkGreen guibg=DarkGreen
"match WarningMsg /\s\+$/
"
"au BufWritePre * :%s/\s\+$//e
"ctrl + a can clean tab or space
nmap ^A :%s/\s\+$//e<cr>

"sub witd
nmap OD <<cr>
"add witd
nmap OC ><cr>
"sub high
nmap OB +<cr>
"add high
nmap OA -<cr>

let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

set ruler

set cmdheight=2

"let Tlist_Use_Right_Window=1

":cs add /home/hang/MyFile/8180/ffmpeg-0.4.8/cscope.out /home/hang/MyFile/8180/ffmpeg-0.4.8
":cs add /home/hang/MyFile/8180/ffmpeg-0.4.8/cscope.out /home/hang/MyFile/8180/ffmpeg-0.4.8
":cs add /home/nishizawa23/MyFile/vlc/ffmpeg/cscope.out /home/nishizawa23/MyFile/vlc/ffmpeg
:set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

set dictionary=/home/nishizawa23/.vim/dictionary/c_dictionary.txt
filetype plugin on

"tpl
let g:template_load = 1

let g:template_tags_replacing = 1

let g:T_AUTHOR = "huangxinghua"

let g:T_AUTHOR_EMAIL = "nishizawa23@gmail.com"

let g:T_AUTHOR_WEBSITE = "http://www.nishizawa23.com"

let g:T_DATE_FORMAT = "%Y-%m-%d %H:%M:%S"

"T3
"set tags=/home/pete/Eben/T3/trunk/kernel_imx/mytags
":cs add /home/pete/Eben/T3/trunk/kernel_imx/cscope.out

"T4
set tags+=/home/pete/T4/kernel_imx/tags
":cs add /home/pete/Eben/T4/t4_r10.1/kernel_imx/cscope.out

"T3_T4
":cs add /home/pete/Eben/T3/trunk/kernel_imx/cscope.out /home/pete/Eben/T4/T3/kernel_imx/T4_T3cscope.out
"
"2410
"set tags=/home/pete/kernel/linux-2.6.26/mytags
":cs add /home/pete/kernel/linux-2.6.26/cscope.out

"set tags=/home/pete/Eben/T3/trunk/selftest/src/tags

"set tags+=/home/pete/T4/bootable/bootloader/uboot-imx/tags

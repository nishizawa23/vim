"base configure

set helplang=cn "set help language to chinese

set mouse=a

set selection=exclusive

set selectmode=mouse,key

set nocompatible "diff for vi

syntax on

"code style
"
set autoindent

set cindent "使用C样式的缩进

set smartindent "为C程序提供自动缩进

set tabstop=8 "制表符为8

set shiftwidth=8 "统一缩进为8

"set softtabstop=8 "atuo tabstop & shiftwidth

set noexpandtab "不要用空格代替制表符

filetype plugin indent on 
"hotkey

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
	if getline('.')[col('.')- 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

function CloseBracket()
	if match(getline(line('.') + 1), '\s*}') < 0
		return "\<CR>}"
	else
		return "\<Esc>j0f}a"
	endif
endf

function QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
	"Inserting a quoted quotation mark into the string
		return a:char
	elseif line[col - 1] == a:char
	"Escaping out of the string
		return "\<Right>"
	else
	"Starting a string
		return a:char.a:char."\<Esc>i"
	endif
endf

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
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
""autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

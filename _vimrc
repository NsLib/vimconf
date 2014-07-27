"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 作者:     凝霜
" E-mail:   mdl2009@vip.qq.com
" GitHub:   https://github.com/NsLib
" Blog:     http://blog.csdn.net/MDL13412 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{ star ahogen 
call pathogen#incubate()
execute pathogen#infect()
"}}}

"{{{ 基本设置
set nocompatible
"}}}

"{{{语法检测设定
filetype    on                      " 检测打开文件的类型
syntax      on                      " 开启语法高亮
syntax      enable                  " 激活语法高亮
filetype    plugin on               " 允许特定的文件类型载入插件文件
filetype    indent on               " 允许特定的文件类型载入缩进文件
autocmd     BufRead,BufNewFile      *.go                    set filetype=go
autocmd     BufRead,BufNewFile      *.{md,mkd,mkdn,mark*}   set filetype=markdown
autocmd     BufRead,BufNewFile      *.tex                   set filetype=tex
"}}}

"{{{ 编码及存储
set fileencodings=utf-8             " 文件编码，强制UTF-8
set encoding=utf-8                  " vim内部编码
set nobomb                          " 不使用bom编码
set nobackup                        " 不使用备份文件
set noswapfile                      " 不产生交换文件
set autoread                        " 自动同步外部修改
set autowrite                       " 自动把内容写回文件
"set clipboard=unnamed               " 共用系统剪贴板
"}}}

"{{{ 缩进/换行/空白/行号/折叠/滚动
" 缩进
set autoindent                      " 开启新行时，自动缩进
set smartindent                     " 开启新行时，智能缩进
set cindent                         " C程序自动缩进

" 换行
set nowrap                          " 不自动换行
set lbr                             " 不在单词中间断行
set fo+=mB                          " 打开断行模块对亚洲语言支持
set whichwrap+=<,>,h,l              " 命令模式下可以直接移动到下一行或上一行

" 空白
set shiftwidth=4                    " 缩进空白数
set tabstop=4                       " Tab所占空格数
set expandtab                       " 将Tab展开为空格
set softtabstop=4                   " 配合tabstop
set listchars=tab:▸\ ,trail:▫       " 指定Tab和结尾空白字符
autocmd FileType make   set      noexpandtab
set backspace=eol,start,indent      " 插入模式下使用 <BS>、<Del> <C-W> <C-U>

" 行号
set number                          " 显示行号

" 代码折叠
set foldenable                      " 开启代码折叠
set foldmethod=syntax               " 根据语法折叠代码
autocmd FileType c      :syntax match   comment     "\v(^\s*//.*\n)+" fold | " 折叠C语言多行的//注释
autocmd FileType cpp    :syntax match   comment     "\v(^\s*//.*\n)+" fold | " 折叠C++多行的//注释
autocmd FileType go     :syntax match   comment     "\v(^\s*//.*\n)+" fold | " 折叠go多行的//注释
autocmd FileType go     :syntax region  goImport    start="($" end=")$" fold | " 折叠go的import ()导入
let g:sh_fold_enabled   = 1         " 开启shell脚本函数折叠支持
autocmd FileType sh     :syntax match   comment     "\v(^\s*[#]+.*\n)+" fold | " 折叠shell的#多行注释
autocmd FileType python setlocal foldmethod=indent
autocmd FileType vim    setlocal foldmethod=marker
autocmd FileType vim    setlocal foldmarker={{{,}}}

" 默认开启代码折叠的文件类型
autocmd BufReadPost *.vim                           normal z[
autocmd BufReadPost *.vimrc                         normal z[
autocmd BufReadPost *.vimrc.*                       normal z[

set foldlevel=99                    " 默认的折叠级别，为0则表示函数级别的折叠
set foldcolumn=0                    " 折叠线所占的宽度
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>    " 用空格键开关折叠
"}}}

"{{{ 状态栏/标尺
set ruler                           " 显示光标所在位置
set cursorline                      " 高亮当前行
set showcmd                         " 再屏幕最后一行显示命令
set laststatus=2                    " 始终显示状态栏
set cmdheight=1                     " 命令行使用的屏幕行数
"}}}

"{{{ 搜索和匹配
set showmatch                       " 高亮显示匹配的括号
set matchtime=5                     " 匹配括号高亮的时间(单位是十分之一秒)
set ignorecase                      " 搜索时忽略大小写
set smartcase                       " 如果搜索模式包含大写字符，不使用'ignorecase'选项
set hlsearch                        " 高亮被搜索的内容
set incsearch                       " 增量搜索
"}}}

"{{{ 主题设置
set t_Co=256                        " 开启256色支持
"}}}

"{{{ 杂项
set noerrorbells                    " 错误时不发出声响
set novisualbell                    " 禁用可视响铃
set t_vb=                           " 可视响铃
set mouse=a                         " 所有模式下，开启鼠标支持
set wildmenu                        " 命令行补全以增强模式运行
"}}}

"{{{ python的基础设定
let g:python_highlight_all                  = 1
let g:python_highlight_builtin_funcs        = 1
let g:python_highlight_exceptions           = 1
let g:python_highlight_builtin_objs         = 1
let g:python_highlight_string_formatting    = 1
"}}}

" 加载非通用的设置
if filereadable(expand("~/.vimrc.keybind"))
  source ~/.vimrc.keybind
endif
if filereadable(expand("~/.vimrc.plugin"))
  source ~/.vimrc.plugin
endif
if filereadable(expand("~/.vimrc.plugin.local"))
  source ~/.vimrc.plugin.local
endif
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

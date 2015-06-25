"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 作者:     凝霜
" E-mail:   mdl2009@vip.qq.com
" GitHub:   https://github.com/NsLib
" Blog:     http://blog.csdn.net/MDL13412 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"===============================================================================
" Vim Settings
"===============================================================================

"{{{ start pathogen
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
" 一些文件类型的自动检测 & 设定
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
nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>    " 用空格键开关折叠
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
set splitright                      " 竖直新分割的窗口在右侧
set splitbelow                      " 水平新分割的窗口在下面
" 打开上次编辑位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"}}}

"{{{ python的基础设定
let g:python_highlight_all                  = 1
let g:python_highlight_builtin_funcs        = 1
let g:python_highlight_exceptions           = 1
let g:python_highlight_builtin_objs         = 1
let g:python_highlight_string_formatting    = 1
"}}}

"===============================================================================
" Plugins
"===============================================================================

"{{{ ConqueTerm Vim中运行终端
let g:ConqueTerm_StartMessages = 0
"}}}

"{{{ startify Vim起始页
let g:startify_list_order = [
            \ ['   Bookmarks:'],
            \ 'bookmarks',
            \ ['   MRU:'],
            \ 'files',
            \ ['   MRU in dir'],
            \ 'dir',
            \ ]
let g:startify_skiplist = [
            \ '\.vimgolf',
            \ '^/tmp',
            \ '/project/.*/documentation',
            \ $HOME . '/.zshrc',
            \ $HOME . '/.vimrc',
            \ $HOME . '/.vimrc.local',
            \ $HOME . '/vimwiki/index.md',
            \ $HOME . '/tools/*',
            \ ]

let g:startify_custom_header = ['   1.01^365 = 37.78, 1.02^365 = 1377.40']
"}}}

"{{{ numbers.vim 更好的行号显示
" 不开启numbers.vim的窗口(:echo &ft)
let g:numbers_exclude = ['unite', 
            \ 'tagbar', 
            \ 'startify',
            \ 'gundo',
            \ 'vimshell',
            \ 'conque_term',
            \ 'w3m']
"}}}

"{{{
let g:gundo_width               = 60
let g:gundo_preview_height      = winheight(0) / 3 * 2
let g:gundo_right               = 1
"}}}

"{{{ calendar.vim 日历插件
" 日期格式 year-month-day
let g:calendar_date_endian      = "big"
" 日期分隔符
let g:calendar_date_separator   = "-"
" 打开日历时的视图
let g:calendar_view             = "day"
" 设置View布局
let g:calendar_views            = ['year', 'day', 'month', 'week', 'clock', 'days']
"}}}

"{{{ vim-instant-markdown Markdown实时预览
let g:instant_markdown_autostart = 0    " 手动触发预览
"}}}

"{{{ ctrlsf.vim 更好的搜索插件，可以在预览窗口查看上下文
let g:ctrlsf_open_left          = 0
"}}}

"{{{ rainbow 对于不同的括号，渲染成不同颜色
let g:rainbow_active = 1
let g:rainbow_operators=2
let g:rainbow_conf = {
            \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \   'ctermfgs': ['lightgray', 'lightblue', 'lightmagenta', 'lightcyan'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
            \       '*': {},
            \       'lisp': {
            \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \           'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan', 'darkred', 'darkgreen'],
            \       },
            \       'vim': {
            \           'parentheses': [['fu\w* \s*.*)','endfu\w*'], ['for','endfor'], ['while', 'endwhile'], ['if','_elseif\|else_','endif'], ['(',')'], ['\[','\]'], ['{','}']],
            \       },
            \       'tex': {
            \           'parentheses': [['(',')'], ['\[','\]'], ['\\begin{.*}','\\end{.*}']],
            \       },
            \       'css': 0,
            \       'stylus': 0,
            \   }
            \}
"}}}

"{{{ tabular    对齐插件
autocmd FileType markdown inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
"}}}

"{{{ markdown
let g:vim_markdown_folding_disabled     = 1
"}}}

"{{{ easymotion
map <Leader><leader> <Plug>(easymotion-prefix)
"}}}

"{{{ vimwiki
let g:vimwiki_use_mouse         = 1
let g:vimwiki_camel_case        = 0
let g:vimwiki_hl_cb_checked     = 1
let g:vimwiki_folding           = 0
let g:vimwiki_CJK_length        = 1
let g:vimwiki_valid_html_tags   ='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'
        
 let g:vimwiki_list = [
             \{
             \   "path": "~/vimwiki", "path_html": "~/vimwiki/html",  
             \   "html_footer": "~/vimwiki/template/footer.tpl",
             \   "html_header": "~/vimwiki/template/header.tpl",
             \   "syntax": "markdown",
             \   "ext": ".md",
             \   "css_name": "main.css",
             \   "custom_wiki2html": "~/.vim/bundle/vimwiki/autoload/vimwiki/misaka_md2html.py",
             \   "auto_export": 0
             \}]
            
let g:vimwiki_ext2syntax    = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
"}}}

"{{{ ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.o
let g:ctrlp_key_loop = 1
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git)$',
            \ 'file': '\v\.(log|jpg|png|jpeg)$',
            \ }
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:100'
"}}}

"{{{ vim-ctrlp-tjump
let g:ctrlp_tjump_only_silent = 1
"}}}

"{{{ tabbar
let g:Tb_MoreThanOne            = 0
let g:Tb_SplitBelow             = 0
let g:Tb_TabWrap                = 1
let g:Tb_MaxSize                = 3
"}}}

"{{{ ctrlp 模糊文件跳转插件
" <C-P> 打开文件
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.bak,*.bk,*~,*.so,*.swp,*.zip,*.pyc,*.o,*.obj  " 补全时忽略的文件类型
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"}}}

"{{{ NERDTree      文件浏览器
let NERDChristmasTree           = 1
let NERDTreeWinPos              = 'left'
let NERDTreeWinSize             = 25 
" 自动开启NERDTree并将光标移动到打开的文件
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
"}}}

"{{{ fold 折叠所有文档注释/函数/类
"
" z[    折叠所有文档注释
" z]    打开所有文档注释
" z{    折叠所有函数
" z}    打开所有函数
"}}}


"{{{ tasklist.vim  任务列表插件
" \td           开启任务列表
let g:tlTokenList = ["FIXME", "TODO", "HACK", "NOTE", "WARN", "MODIFY"]
"}}}

"{{{ vim-bookmarks      可视化书签
let g:bookmark_highlight_lines = 1
highlight BookmarkSign ctermbg=NONE ctermfg=blue
highlight BookmarkLine ctermbg=237 ctermfg=NONE
highlight BookmarkAnnotationSign ctermbg=NONE ctermfg=blue
highlight BookmarkAnnotationLine ctermbg=016 ctermfg=NONE
"}}}


"{{{ 编程通用插件
"{{{
if has('mac')
    let g:Cscope_ctags_cmd    = '/usr/local/bin/ctags'
endif
"}}}

"{{{ gitgutter  用于git托管项目的diff插件,显示文件变化
let g:gitgutter_realtime    = 0
let g:gitgutter_eager       = 0
"}}}

"{{{  UltiSnips
autocmd FileType * call UltiSnips#FileTypeChanged()
let g:UltiSnipsExpandTrigger        = "ii"
let g:UltiSnipsUsePythonVersion     = 2
let g:UltiSnipsEditSplit            = "vertical"
"}}}

"{{{ TagList        大纲 
let g:tlist_markdown_settings   = 'markdown;h:TOC'
let g:tlist_vimwiki_settings    = 'vimwiki;h:TOC'
let Tlist_Auto_Open             = 0
let Tlist_Auto_Update           = 1
let Tlist_Show_One_File         = 1
let Tlist_Exit_OnlyWindow       = 1
let Tlist_Use_Right_Window      = 1
let Tlist_Auto_Highlight_Tag    = 0
let Tlist_Compart_Format        = 1
let Tlist_File_Fold_Auto_Close  = 0
let Tlist_Sort_Type             = "name"
"}}}

"{{{ TagBar        适合OOP的大纲 
if has('mac')
    let Tlist_Ctags_Cmd         = '/usr/local/bin/ctags'
endif
let g:tagbar_ctags_bin          = 'ctags'
let g:tagbar_width              = 40
let g:tagbar_expand             = 2
let g:tagbar_zoomwidth          = 0
"}}}

"{{{ NERD_commenter.vim    注释插件
" \cc                   注释当前行
" \c<space>             注释掉所选块
" \cs                   /*
"                        * 形式的注释
"                        */
" \cu                   取消注释
let NERDShutUp=1
"}}}

"{{{ echofunc 函数原型提示
"
" ( 触发, 使用<Alt-n>查看下一个原型, <Alt-p>查看上一个原型
let g:EchoFuncKeyNext   =   '˜'     " <Alt-n>
let g:EchoFuncKeyPrev   =   'π'     " <Alt-p>
"}}}

"{{{ DoxygenToolkit.vim  文档插件
" :DoxLic        插入License信息
" :DoxAuthor     插入作者信息
" :Dox           插入文档注释
let g:DoxygenToolkit_undocTag               = "DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre           = "@brief\t\t"
let g:DoxygenToolkit_paramTag_pre           = "@param\t\t"
let g:DoxygenToolkit_returnTag              = "@return\t\t"
let g:DoxygenToolkit_throwTag_pre           = "@exception\t\t"
let g:DoxygenToolkit_briefTag_funcName      = "yes"
let g:DoxygenToolkit_maxFunctionProtoLines  = 30 
"}}}

"{{{ indent-guides 对齐线插件
"
" \ig           开启对齐线
let g:indent_guides_guide_size      = 1
let g:indent_guides_auto_colors     = 0
let g:indent_guides_start_level     = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=White ctermbg=DarkGray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=White ctermbg=Gray
"}}}

"{{{ syntastic  支持多种语言的语法检查插件
let g:syntastic_check_on_open               = 0
let g:syntastic_echo_current_error          = 1
let g:syntastic_loc_list_height             = 10
let g:syntastic_c_checkers                  = ['gcc', 'make']
let g:syntastic_c_check_header              = 1
let g:syntastic_c_no_include_search         = 1
let g:syntastic_python_checkers             = ['pylint', 'flake8', 'pep8', 'pyflakes']
let g:syntastic_c_checkers                  = ['gcc', 'make']
let g:syntastic_python_pylint_args          = "-disable-msg=C0103 --max-line-length=79"
let g:syntastic_python_pep8_args            = "--max-line-length=79"
let g:syntastic_python_flake8_args          = "--max-line-length=79 --max-complexity=15"
let g:syntastic_always_populate_loc_list    = 1
"}}}

"{{{ whitespace     去除文件的行尾空白
autocmd BufWritePre     *.py        call WhitespaceStripTrailing()
autocmd BufWritePre     *.h         call WhitespaceStripTrailing()
autocmd BufWritePre     *.c         call WhitespaceStripTrailing()
autocmd BufWritePre     *.cpp       call WhitespaceStripTrailing()
"}}}

"}}}

"{{{ a.vim  快速切换头文件与实现文件插件
"
" :A     打开.cpp对应的.h
" :AS    打开.cpp对应的.h并且水平分屏
" :AV    打开.cpp对应的.h并且竖直分屏
" \ih    打开光标所在的文件
"}}}

"{{{ omnicppcomplete  自动提示插件
let OmniCpp_ShowScopeInAbbr             = 0     " 函数命名空间显示[0]：右侧 [1]：左侧
let OmniCpp_ShowPrototypeInAbbr         = 1     " 是否显示函数原型
let OmniCpp_SelectFirstItem             = 2     " 弹出菜单 [0]：不选中 [1]：选中并插入 [2]：选中不插入
set completeopt=longest,menu
set omnifunc=syntaxcomplete#Complete

" 用于一般的生成
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ .
" 将生成tags文件拷贝到~/tags/   并改名为xxx_tags
" 解决__THROW等宏导致的问题
" 忽略列表见~/.vim/tags/filter
" ctags -R -I ./filter --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q .

" 默认加载tags
set tags=tags;/
"}}}

"{{{ Emmet(zen-coding)      前端插件
" <C-Z>A       从URL地址生成引用文本
" <C-Z>a       生成URL标记
" <c-y>m       合并行
" <C-Z>k       移除标签对
" <C-Z>N       跳转到上一个编辑点
" <C-Z>n       跳转到下一个编辑点
" <C-Z>D       插入模式下根据光标位置选中整个标签内容
" <C-Z>d       插入模式下根据光标位置选中整个标签
" <C-Z>;       展开tag标签
" <C-Z>,       展开缩略词
let g:user_emmet_install_global     = 0
autocmd FileType xhtml,html,css EmmetInstall
let g:user_emmet_leader_key         = '<C-Z>'
"}}}

"{{{ javascript
let b:javascript_fold               = 'false'         " 打开javascript折叠
let javascript_enable_domhtmlcss    = 1         " 打开javascript对dom、html和css的支持
autocmd BufRead,BufNewFile  *.js set syntax=jquery
autocmd FileType javascript set         omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set         makeprg=/usr/bin/jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ '/usr/bin/jsl.conf'\ -process\ %
autocmd FileType javascript set         errorformat=%f(%l):\ %m
autocmd FileType javascript inoremap    <silent> <F9> <C-O>:make<CR> :copen<CR>
"}}}

"{{{ lightline
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'component': {
            \   'readonly': '%{&readonly?"⭤":""}',
            \ },
            \ }
"}}}

"===============================================================================
" Key Binding
"===============================================================================

"{{{ 映射F1~F12
" <F3>  搜索光标所在单词
nnoremap        <silent> <F3>           :Ack  
" <F4>  C++切换头文件
map             <F4>                    :A<CR>
" <F5>  生成tags文件
autocmd FileType cpp            map <F5>            :call NsLibMakeTags()<CR>
autocmd FileType c              map <F5>            :call NsLibMakeTags()<CR>
autocmd FileType python         map <F5>            :call NsLibMakeTags()<CR>
autocmd FileType javascript     map <F5>            :call NsLibMakeTags()<CR>
autocmd FileType go             map <F5>            :call NsLibMakeTags()<CR>

" 语法检查
autocmd FileType *          map <buffer> <F7>    :SyntasticCheck<ESC>:Errors<CR>
" 关闭NerdTree和行号以及鼠标，用于复制代码
nnoremap <S-F7>             :call ToggleLineNumberAndNerdTree()<CR>

" <F9>
if hostname() == "localhost"
    autocmd FileType python     map <F9> :!python "%"<CR>
elseif hostname() == "NsLibRMBP.lan"
    autocmd FileType python     map <F9> :!python "%"<CR>
elseif hostname() == "qunarzz.com"
    autocmd FileType python     map <F9> :!python "%"<CR>
else
    autocmd FileType python     map <F9> :!q-python27 "%"<CR>
endif
autocmd FileType cpp        map <F9> :call Do_OneFileMake()<CR>
autocmd FileType c          map <F9> :call Do_OneFileMake()<CR>
autocmd FileType cpp        map <S-F9> :call Do_make()<CR>
autocmd FileType c          map <S-F9> :call Do_make()<CR>
autocmd FileType perl       map <F9> :!perl -w "%"<CR>
autocmd FileType lua        map <F9> :!lua "%"<CR>
autocmd FileType erlang     map <F9> :!erlc "%"<CR>
autocmd FileType sh         map <F9> :!bash "%"<CR>
autocmd FileType go         map <F9> :!go run "%"<CR>
autocmd FileType lisp       map <F9> :!clisp "%"<CR>
autocmd FileType dot        map <F9> :!dot % -Tjpg -o a.jpg && open a.jpg<CR>
autocmd FileType vim        map <F9> :source %<CR>
autocmd FileType html       map <F9> :!open %<CR>
autocmd FileType javascript map <F9> :!node %<CR>

map             <F12>                               :NERDTreeToggle<CR>
"}}}

" {{{映射快捷键
" vim 开发
nnoremap    ,sv                 :source $MYVIMRC<cr>        " 刷新vim配置
nnoremap    ,ev                 :vsplit $MYVIMRC<cr>        " 分割窗口打开vim配置

" 编辑相关
" 编辑模式下按jk等价于按ESC键, 非常高效
inoremap    jk                  <esc>
nnoremap    Q                   :q<CR>          " 命令模式下，输入Q，退出Vim
cmap w!! %!sudo tee > /dev/null %               " 忘记sudo时，强制保存
vnoremap    ,y                  "+y             " 选中元素复制到系统剪贴板
nnoremap    ,p                  "+p             " 系统剪贴板内容粘贴到当前位置

" 窗口间移动
nnoremap    <C-j>               <C-W>j
nnoremap    <C-k>               <C-W>k
nnoremap    <C-h>               <C-W>h
nnoremap    <C-l>               <C-W>l

" 插入模式下移动光标
inoremap    <C-y>               <Up>            " 输入模式下，按Ctrl+y移动光标到上一行
inoremap    <C-e>               <Down>          " 输入模式下，按Ctrl+e移动光标到下一行
inoremap    <c-h>               <left>
inoremap    <c-l>               <right>
inoremap    <c-j>               <c-o>gj
inoremap    <c-k>               <c-o>gk

" DoxygenToolkit快捷键
nnoremap    ,da                 :DoxAuthor<cr>
nnoremap    ,df                 :Dox<cr>
nnoremap    ,db                 :DoxBlock<cr>

" 高亮当前列
nnoremap    ,hc                 :call SetColorColumn()<CR>

" Tabbar切换选项卡 \0-30
nnoremap    ,tc                 :TbBufferClose<CR>
nnoremap    ,c                  :TbBufferClose<CR>

nnoremap    ,tl                 :TlistToggle<CR>
nnoremap    ,tb                 :TagbarToggle<CR>
nnoremap    ,td                 :TaskList<CR>

" 对齐插件
nnoremap    ,a=                 :Tabularize /=<CR>
vnoremap    ,a=                 :Tabularize /=<CR>
nnoremap    ,a#                 :Tabularize /#<CR>
vnoremap    ,a#                 :Tabularize /#<CR>
nnoremap    ,a"                 :Tabularize /"<CR>
vnoremap    ,a"                 :Tabularize /"<CR>
nnoremap    ,a:                 :Tabularize /:\zs<CR>
vnoremap    ,a:                 :Tabularize /:\zs<CR>

nnoremap    ,gn                 <Plug>GitGutterNextHunk
nnoremap    ,gp                 <Plug>GitGutterPrevHunk
nnoremap    ,gs                 <Plug>GitGutterStageHunk
nnoremap    ,gr                 <Plug>GitGutterRevertHunk

" 调整窗口大小
nnoremap <silent> ,=            :exe "vertical resize " . (winwidth(0) * 6/5)<CR>
nnoremap <silent> ,-            :exe "vertical resize " . (winwidth(0) * 4/5)<CR>
nnoremap <silent> ,h=           :exe "resize " . (winheight(0) * 6/5)<CR>
nnoremap <silent> ,h-           :exe "resize " . (winheight(0) * 4/5)<CR>
nnoremap <silent> ,v=           :exe "vertical resize " . (winwidth(0) * 6/5)<CR>
nnoremap <silent> ,v-           :exe "vertical resize " . (winwidth(0) * 4/5)<CR>

nnoremap    ,np                 :set nopaste<CR>
nnoremap    ,sp                 :set paste<CR>

nnoremap    <Leader>wb          :Vimwiki2HTMLBrowse<CR>
nnoremap    <Leader>wa          :VimwikiAll2HTML<CR>
nnoremap    <Leader>wh          :Vimwiki2HTML<CR>

nnoremap    zvf                 :vsplit<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap    zsf                 :split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap    zf                  :split<CR>:exec("tag ".expand("<cword>"))<CR>


nnoremap    <c-]>               :CtrlPtjump<cr>
vnoremap    <c-]>               :CtrlPtjumpVisual<cr>

nnoremap    ,gu                 :GundoToggle<CR>

nnoremap    <C-\>b              :ConqueTermSplit bash<CR>
nnoremap    <C-\>vb             :ConqueTermVSplit bash<CR>

nnoremap    <Leader>ws          :call VMS()<CR>
function! VMS()
    execute ":VimwikiSearch " . input("VimwikiSearch:")
    :lopen
endfunction
"}}}

"===============================================================================
" Source User's Own Setting
"===============================================================================

"{{{ source
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
"}}}

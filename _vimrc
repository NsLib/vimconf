"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 作者:     凝霜
" E-mail:   mdl2009@vip.qq.com
" GitHub:   https://github.com/NsLib
" Blog:     http://blog.csdn.net/MDL13412
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{ Vundle插件管理

    "{{{ Vundle配置
        set nocompatible
        set hidden
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
        Plugin 'VundleVim/Vundle.vim'
    "}}}

    "{{{ 前端
        " Yet Another JavaScript Syntax for Vim
        Plugin 'othree/yajs.vim'
        " JavaScript文档生成工具
        Plugin 'heavenshell/vim-jsdoc'
        Plugin 'marijnh/tern_for_vim'
    "}}}

    "{{{ 编程辅助
        Plugin 'Valloric/YouCompleteMe'
        Plugin 'scrooloose/syntastic'
        Plugin 'SirVer/ultisnips'
        Plugin 'NsLib/vim-snippets-mod'
        Plugin 'scrooloose/NERDCommenter'
        Plugin 'NsLib/vim-fold-mod'
        Plugin 'NsLib/vim-DoxygenToolkit-mod'
        Plugin 'TaskList.vim'
        Plugin 'majutsushi/tagbar'
        Plugin 'tpope/vim-projectionist'
        Plugin 'tpope/vim-dispatch'
        Plugin 'thinca/vim-quickrun'
        Plugin 'airblade/vim-rooter'
    "}}}

    "{{{ Go
        Plugin 'fatih/vim-go'
        Plugin 'rjohnsondev/vim-compiler-go'
        Plugin 'dgryski/vim-godef'
        Plugin 'vim-jp/vim-go-extra'
    "}}}

    "{{{ C/C++
        Plugin 'a.vim'
        Plugin 'NsLib/vim-cscope-mod'
    "}}}

    "{{{ Python
    Plugin 'klen/python-mode'
        Plugin 'nathanaelkane/vim-indent-guides'
    "}}}

    "{{{ 通用

        " 启动页
        Plugin 'mhinz/vim-startify'
        " 状态栏
        Plugin 'bling/vim-airline'
        Plugin 'easymotion/vim-easymotion'
        Plugin 'terryma/vim-multiple-cursors'
        Plugin 'tpope/vim-surround'
        Plugin 'godlygeek/tabular'
        " 可视化书签
        Plugin 'MattesGroeges/vim-bookmarks'
        Plugin 'myusuf3/numbers.vim'
        Plugin 'tpope/vim-fugitive'
        Plugin 'airblade/vim-gitgutter'
        Plugin 'NsLib/vimwiki-mod'
        Plugin 'VOoM'
        Plugin 'matchit.zip'
        Plugin 'scrooloose/nerdtree'
        Plugin 'bronson/vim-trailing-whitespace'
        Plugin 'Shougo/vimproc.vim'
        Plugin 'Shougo/unite.vim'
        Plugin 'Shougo/neomru.vim'
        Plugin 'Shougo/unite-outline'
        Plugin 'szw/vim-ctrlspace'
        Plugin 'dyng/ctrlsf.vim'
    "}}}

"Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'plasticboy/vim-markdown'
Plugin 'janko-m/vim-test'


" 编程
" Plugin 'tpope/vim-commentary'
" Plugin 'junegunn/vim-easy-align'
" Plugin 'unblevable/quick-scope'
" Plugin 'kshenoy/vim-signature'
" Plugin 'sjl/gundo.vim'
" Plugin 'hdima/python-syntax'
" Plugin 'hynek/vim-python-pep8-indent'
" https://github.com/marijnh/tern_for_vim
" Plugin 'marijnh/tern_for_vim'
" Plugin 'elzr/vim-json', {'for': 'json'}
" Plugin 'gorodinskiy/vim-coloresque'
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'gcmt/wildfire.vim'


call vundle#end()

"}}}


"{{{ 基础设置

    "{{{ 语法检测设定
        " 检测文件类型
        filetype on
        " 允许特定的文件类型载入插件
        filetype plugin on
        " 允许特定的文件类型载入缩进文件
        filetype indent on
        " 补全
        filetype plugin indent on
        " 开启语法高亮
        syntax on
        " 激活语法高亮
        syntax enable
    "}}}

    "{{{ 编码及存储
        " 文件编码，强制UTF-8
        set fileencodings=utf-8
        " vim内部编码
        set encoding=utf-8
        " 不使用bom编码
        set nobomb
        " 不使用备份文件
        set nobackup
        " 不产生交换文件
        set noswapfile
        " 自动同步外部修改
        set autoread
        " 自动把内容写回文件
        set autowrite
        " 合并两行中文时，不在中间加空格
        set formatoptions+=B
    "}}}

    "{{{ 缩进/换行/空白/行号/折叠/滚动
        " 开启新行时，自动缩进
        set autoindent
        " 开启新行时，智能缩进
        set smartindent
        " C程序自动缩进
        set cindent

        " 不自动换行
        set nowrap
        " 不在单词中间断行
        set lbr
        " 打开断行模块对亚洲语言支持
        set fo+=mB
        " 命令模式下可以直接移动到下一行或上一行
        set whichwrap+=<,>,h,l

        " 缩进空白数
        set shiftwidth=4
        " Tab所占空格数
        set tabstop=4
        " 将Tab展开为空格
        set expandtab
        " 退格是删除tab
        set smarttab
        set shiftround
        " 配合tabstop
        set softtabstop=4
        " 指定Tab和结尾空白字符
        set listchars=tab:▸\ ,trail:▫
        autocmd FileType make set noexpandtab
        " 插入模式下使用 <BS>、<Del> <C-W> <C-U>
        set backspace=eol,start,indent

        " 显示行号
        set number

        " 开启代码折叠
        set foldenable
        " 根据语法折叠代码
        set foldmethod=syntax

        " 默认的折叠级别，为0则表示函数级别的折叠
        set foldlevel=99
        " 折叠线所占的宽度
        set foldcolumn=0
        nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>    " 用空格键开关折叠
    "}}}

    "{{{ 状态栏/标尺
        " 显示光标所在位置
        set ruler
        " 高亮当前行
        set cursorline
        " 高亮当前列
        " set cursorcolumn
        " 再屏幕最后一行显示命令
        set showcmd
        " 始终显示状态栏
        set laststatus=2
        " 命令行使用的屏幕行数
        set cmdheight=1
        " 高亮显示列
        set cursorcolumn
        " 插入文本的最大宽度
        set textwidth=78
        " 是否显示标尺
        set cc=+1
        " 光标上下两侧最少保留的屏幕行数
        set scrolloff=15
    "}}}

    "{{{ 搜索和匹配
        " 高亮显示匹配的括号
        set showmatch
        " 匹配括号高亮的时间(单位是十分之一秒)
        set matchtime=5
        " 搜索时忽略大小写
        set ignorecase
        " 如果搜索模式包含大写字符，不使用'ignorecase'选项
        set smartcase
        " 高亮被搜索的内容
        set hlsearch
        " 增量搜索
        set incsearch
    "}}}

    "{{{ 主题设置
        " 开启256色支持
        set t_Co=256
        " 主题
        "colorscheme jellyx
        "colorscheme darkerdesert_modified
        "colorscheme dw_cyan
        "colorscheme maroloccio3_modified
        "colorscheme desertEx_256
        "set background=dark
        "let g:solarized_termcolors=256
        "colorscheme solarized
        colorscheme BusyBee
        "colorscheme jellybeans
        " 参考线颜色
        highlight ColorColumn ctermfg=White ctermbg=Grey
    "}}}

    "{{{ 杂项
        " 错误时不发出声响
        set noerrorbells
        " 禁用可视响铃
        set novisualbell
        " 可视响铃
        set t_vb=
        " 所有模式下，开启鼠标支持
        set mouse=a
        " 命令行补全以增强模式运行
        set wildmenu
        " 补全时忽略的文件类型
        set wildignore+=*/tmp/*,*.bak,*.bk,*~,*.so,*.swp,*.zip,*.pyc,*.o,*.obj
        " 竖直新分割的窗口在右侧
        set splitright
        " 水平新分割的窗口在下面
        set splitbelow
        "" 共用系统剪贴板
        "set clipboard=unnamed

        " 打开上次编辑位置
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g'\"" |
                    \ endif

        " 默认加载tags
        set tags=tags;/
        " 离开插入模式后自动关闭预览窗口
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    "}}}

"}}}


"{{{ 特定文件类型设置

    "{{{ vim
        autocmd FileType vim setlocal foldmethod=marker
        autocmd FileType vim setlocal foldmarker={{{,}}}
        autocmd FileType vim setlocal foldlevel=0

        " 默认开启代码折叠的文件类型
        autocmd BufReadPost *.vim normal z[
        autocmd BufReadPost *.vimrc normal z[
        autocmd BufReadPost *.vimrc.* normal z[
    "}}}

    "{{{ shell
        " 开启shell脚本函数折叠支持
        let g:sh_fold_enabled = 1
    "}}}

    "{{{ python
        autocmd FileType python setlocal foldmethod=indent
    "}}}

    "{{{ markdown
        autocmd BufRead,BufNewFile *.{md,mkd,mkdn,mark*} set filetype=markdown
    "}}}

    "{{{ vimwiki
    "}}}

    "{{{ go
        autocmd BufRead,BufNewFile *.go set filetype=go
    "}}}

"}}}


"{{{ 插件配置

    "{{{ 前端

        "{{{ JavaScript

            "{{{ vim-jsdoc
            " :JsDoc
                let g:jsdoc_allow_input_prompt = 1
                let g:jsdoc_input_description = 1
                let g:jsdoc_param_description_separator = ' - '
            "}}}

        "}}}

        "{{{ HTML

        "}}}

    "}}}

    "{{{ 通用

        "{{{ startify Vim起始页
            let g:startify_list_order = ['files', 'bookmarks']
            let g:startify_files_number = 20
            let g:startify_enable_special = 0
            let g:startify_skiplist = [
                        \ '^/tmp',
                        \ '/project/.*/documentation'
                        \ ]
        "}}}

        "{{{ vim-bookmarks 可视化书签
        " mm    添加/删除书签
        " mi    带注释的书签
        " mn    跳转到下一个书签
        " mp    跳转到前一个书签
        " ma    显示所有书签(toggle)
        " mc    清除书签
        " mx    清除所有书签
            let g:bookmark_sign = '♥'
            let g:bookmark_highlight_lines = 1
            let g:bookmark_auto_save = 1
            let g:bookmark_save_per_working_dir = 1

            highlight BookmarkSign ctermbg=NONE ctermfg=blue
            highlight BookmarkLine ctermbg=237 ctermfg=NONE
            highlight BookmarkAnnotationSign ctermbg=NONE ctermfg=blue
            highlight BookmarkAnnotationLine ctermbg=016 ctermfg=NONE
        "}}}

        "{{{ airline 状态栏
            let g:airline_left_sep = ''
            let g:airline_right_sep = ''
            let g:airline_exclude_preview = 1
            let g:airline#extensions#tabline#enabled = 1
            let g:airline#extensions#tabline#left_sep = ' '
            let g:airline#extensions#tabline#left_alt_sep = '|'
            let g:airline#extensions#tabline#tab_nr_type = 2
            let g:airline#extensions#tabline#buffer_idx_mode = 1
            nmap <leader>1 <Plug>AirlineSelectTab1
            nmap <leader>2 <Plug>AirlineSelectTab2
            nmap <leader>3 <Plug>AirlineSelectTab3
            nmap <leader>4 <Plug>AirlineSelectTab4
            nmap <leader>5 <Plug>AirlineSelectTab5
            nmap <leader>6 <Plug>AirlineSelectTab6
            nmap <leader>7 <Plug>AirlineSelectTab7
            nmap <leader>8 <Plug>AirlineSelectTab8
            nmap <leader>9 <Plug>AirlineSelectTab9
            nmap <Leader>c :bp<CR>:bd #<CR>
        "}}}

        "{{{ vim-ctrlspace
        " TODO: workspace
        " TODO: bookmark
        "}}}

    "}}}

"}}}


"{{{ ctrlsf.vim 更好的搜索插件，可以在预览窗口查看上下文
let g:ctrlsf_open_left = 0
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
let g:vim_markdown_folding_disabled = 1
"}}}

"{{{ eaymotion
map <Leader><leader> <Plug>(easymotion-prefix)
"}}}

"{{{ VOom
let g:oom_return_key = "<C-Return>"
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
             \   "custom_wiki2html": "~/.vim/bundle/vimwiki-mod/autoload/vimwiki/misaka_md2html.py",
             \   "auto_export": 0
             \},
             \{
             \   "path": "~/miwiki", "path_html": "~/miwiki/html",
             \   "html_footer": "~/miwiki/template/footer.tpl",
             \   "html_header": "~/miwiki/template/header.tpl",
             \   "syntax": "markdown",
             \   "ext": ".md",
             \   "css_name": "main.css",
             \   "custom_wiki2html": "~/.vim/bundle/vimwiki-mod/autoload/vimwiki/misaka_md2html.py",
             \   "auto_export": 0
             \}
             \]
let g:vimwiki_ext2syntax    = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
"}}}

"{{{ NERDTree      文件浏览器
let NERDChristmasTree = 1
let NERDTreeWinPos = 'left'
let NERDTreeWinSize = 25
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

"{{{ nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
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
let g:tlTokenList = ["FIXME", "TODO", "HACK", "NOTE", "WARN", "MODIFY", "BUG"]
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

"{{{ NERD_commenter.vim    注释插件
" \cc                   注释当前行
" \c<space>             注释掉所选块
" \cs                   /*
"                        * 形式的注释
"                        */
" \cu                   取消注释
let NERDShutUp=1
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

"}}}

"{{{ a.vim  快速切换头文件与实现文件插件
"
" :A     打开.cpp对应的.h
" :AS    打开.cpp对应的.h并且水平分屏
" :AV    打开.cpp对应的.h并且竖直分屏
" \ih    打开光标所在的文件
"}}}

"{{{ pytest
let test#python#runner = 'pytest'
"}}}

"{{{ python-mode
let g:pymode_lint                       = 0
let g:pymode_rope                       = 1
let g:pymode_rope_goto_definition_bind  = '<C-]>'
let g:pymode_rope_goto_definition_cmd   = 'e'
"}}}

"{{{ quickrun
let g:quickrun_config = {}
let g:quickrun_config.html = {'command' : 'open'}
"}}}

"===============================================================================
" Key Binding
"===============================================================================

"{{{ 映射F1~F12
nnoremap <F1> <Esc>
" <F3>  搜索光标所在单词
"nnoremap        <silent> <F3>           :Unite grep:.<cr>
nnoremap        <silent> <F3>           :Ag <c-r>=expand("<cword>")<cr><cr>
vnoremap        <silent> <F3>           :Ag <c-r>=expand("<cword>")<cr><cr>
" <F4>  C++切换头文件
map             <F4>                    :A<CR>
" <F5>  生成tags文件
autocmd FileType cpp            map <F5>            :call NsLibMakeTags()<CR>
autocmd FileType c              map <F5>            :call NsLibMakeTags()<CR>
autocmd FileType python         map <F5>            :call NsLibMakeTags()<CR>
autocmd FileType javascript     map <F5>            :call NsLibMakeTags()<CR>
autocmd FileType go             map <F5>            :call NsLibMakeTags()<CR>

" 切换语法高亮
":exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
" 语法检查
autocmd FileType *          map <buffer> <F7>    :SyntasticCheck<ESC>:Errors<CR>
" 关闭NerdTree和行号以及鼠标，用于复制代码
nnoremap <S-F7>             :call ToggleLineNumberAndNerdTree()<CR>

" <F9>
nnoremap <F9>                   :QuickRun

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
inoremap    <c-h>               <left>
inoremap    <c-l>               <right>
inoremap    <c-j>               <c-o>gj
inoremap    <c-k>               <c-o>gk

" vim命令行Emacs风格快捷键绑定
cnoremap   <C-a>               <Home>
cnoremap   <C-b>               <Left>
cnoremap   <C-f>               <Right>
cnoremap   <C-d>               <Delete>
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap   <Esc>b              <S-Left>
cnoremap   <Esc>f              <S-Right>
cnoremap   <Esc>d              <S-right><Delete>
cnoremap   <C-g>               <C-c>

" DoxygenToolkit快捷键
nnoremap    ,da                 :DoxAuthor<cr>
nnoremap    ,df                 :Dox<cr>
nnoremap    ,db                 :DoxBlock<cr>

" 高亮当前列
nnoremap    ,hc                 :call SetColorColumn()<CR>

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

nnoremap    <Leader>ws          :call VMS()<CR>
nnoremap    <Leader>wm          :VimwikiUISelect<CR>2<CR>
function! VMS()
    execute ":VimwikiSearch " . input("VimwikiSearch:")
    :lopen
endfunction

nnoremap    ,u/                 :Unite grep:.<cr>
let         g:unite_source_history_yank_enable      = 1
nnoremap    ,uy                 :Unite -buffer-name=yanks   history/yank<cr>
nnoremap    ,uo                 :Unite -buffer-name=outline -vertical outline<cr>
nnoremap    ,um                 :Unite -buffer-name=mru file_mru
nnoremap    ,us                 :Unite -quick-match buffer<cr>
nnoremap    ,ub                 :Unite -buffer-name=buffer buffer<CR>
nnoremap    ,uf                 :Unite -buffer-name=files file_rec/async<CR>
"nnoremap    <silent><c-p>       :<C-u>Unite -auto-resize file file_mru file_rec/async<cr>
nnoremap <silent><C-p> :CtrlSpace O<CR>
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.git/',
            \ 'tmp/',
            \ 'node_modules/',
            \ 'vendor/',
            \ 'Vendor/',
            \ 'bower_components/',
            \ '.sass-cache',
            \ '\.venv',
            \ '**\.png',
            \ '**\.jpeg',
            \ '**\.jpg',
            \ '**\.gif',
            \ '**\.bpm',
            \ '**\.svg',
            \ '**\.gliffy',
            \ 'vimwiki/html/images/',
            \ 'vimwiki/html/*\.html',
            \ ], '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context', {
            \   'marked_icon': '✓',
            \   'start_insert': 1,
            \   'winheight': 10,
            \   'direction': 'botright',
            \   'unite-options-direction': 'botright'
            \ })


"call unite#custom#source('file_rec/async','sorters','sorter_rank', )
" replacing unite with ctrl-p
let g:unite_data_directory                  = '~/.cache/unite'
let g:unite_source_history_yank_enable      = 1
let g:unite_prompt                          = '» '
"let g:unite_split_rule                      = 'botright'

if executable('ack')
    let g:unite_source_grep_command         = 'ack'
    let g:unite_source_grep_default_opts    = '--no-heading --no-color -C4'
    let g:unite_source_grep_recursive_opt   = ''
elseif executable('ag')
    let g:unite_source_grep_command         = 'ag'
    let g:unite_source_grep_default_opts    = '--nocolor --line-numbers --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt   = ''
endif
"}}}

"===============================================================================
" Source User's Own Setting
"===============================================================================

"{{{ source
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
"}}}

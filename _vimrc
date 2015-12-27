"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 作者:     凝霜
" E-mail:   mdl2009@vip.qq.com
" GitHub:   https://github.com/NsLib
" Blog:     http://blog.csdn.net/MDL13412
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{ before
set nocompatible
set hidden
let mapleader = ","
"}}}

"{{{ Vundle插件管理

    "{{{ Vundle配置
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
        Plugin 'VundleVim/Vundle.vim'
    "}}}

    "{{{ 前端
        " Yet Another JavaScript Syntax for Vim
        Plugin 'othree/yajs.vim'
        " JavaScript文档生成工具
        Plugin 'heavenshell/vim-jsdoc'
        " JavaScript补全
        Plugin 'marijnh/tern_for_vim'
        " 快速生成HTML/CSS代码
        Plugin 'mattn/emmet-vim'
    "}}}

    "{{{ 编程辅助
        " 使用Dash查看API文档
        Plugin 'rizzatti/dash.vim'
        " 格式化代码
        Plugin 'Chiel92/vim-autoformat'
        " 代码补全
        Plugin 'Valloric/YouCompleteMe'
        " 生成YCM使用的配置文件
        Plugin 'rdnetto/YCM-Generator'
        " 语法检查插件
        Plugin 'scrooloose/syntastic'
        " 代码片段
        Plugin 'SirVer/ultisnips'
        " 代码片段
        Plugin 'NsLib/vim-snippets-mod'
        " 快速注释插件
        Plugin 'scrooloose/NERDCommenter'
        " 代码折叠
        Plugin 'NsLib/vim-fold-mod'
        " 任务列表
        Plugin 'TaskList.vim'
        " 显示文件中的tag列表
        Plugin 'majutsushi/tagbar'
        " 异步构建&测试
        Plugin 'tpope/vim-dispatch'
        " 快速运行代码
        Plugin 'thinca/vim-quickrun'
        " test wrapper
        Plugin 'janko-m/vim-test'
        " 自动闭合标签
        Plugin 'Raimondi/delimitMate'
    "}}}

    "{{{ Go
        Plugin 'fatih/vim-go'
        Plugin 'rjohnsondev/vim-compiler-go'
        Plugin 'dgryski/vim-godef'
        Plugin 'vim-jp/vim-go-extra'
    "}}}

    "{{{ C/C++
        " c/cpp和.h切换
        Plugin 'a.vim'
        " 生成tags和scope文件
        Plugin 'NsLib/vim-cscope-mod'
    "}}}

    "{{{ Python
        " 对齐参考线
        Plugin 'nathanaelkane/vim-indent-guides'
    "}}}

    "{{{ 通用

        " 启动页
        Plugin 'mhinz/vim-startify'
        " 状态栏
        Plugin 'bling/vim-airline'
        " 快速移动
        Plugin 'easymotion/vim-easymotion'
        " 多光标编辑
        Plugin 'terryma/vim-multiple-cursors'
        " 简化对称标签编辑
        Plugin 'tpope/vim-surround'
        " 可视化书签
        Plugin 'MattesGroeges/vim-bookmarks'
        " 相对行号
        Plugin 'myusuf3/numbers.vim'
        " Git wrapper
        Plugin 'tpope/vim-fugitive'
        " 显示Git修改
        Plugin 'airblade/vim-gitgutter'
        " 个人Wiki
        Plugin 'NsLib/vimwiki-mod'
        " 增强%
        Plugin 'matchit.zip'
        " 文件浏览器
        Plugin 'scrooloose/nerdtree'
        " 高亮显示空白行
        Plugin 'bronson/vim-trailing-whitespace'
        " 加入异步执行命令支持
        Plugin 'Shougo/vimproc.vim'
        " Unite and create user interfaces
        Plugin 'Shougo/unite.vim'
        " MRU plugin for unite.vim
        Plugin 'Shougo/neomru.vim'
        " buffer/file/tab/workspace/bookmark切换
        Plugin 'szw/vim-ctrlspace'
        " 搜索插件
        Plugin 'dyng/ctrlsf.vim'
        " Markdown支持
        Plugin 'plasticboy/vim-markdown'
    "}}}

    "{{{ 主题
        Plugin 'altercation/vim-colors-solarized'
    "}}}

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
        if has("gui_running")
            set background=light
            colorscheme solarized
            let g:solarized_contrast = 'low'
        else
            set background=light
            let g:solarized_termcolors=256
            let g:solarized_contrast = 'low'
            colorscheme solarized
            " 参考线颜色
            highlight ColorColumn ctermfg=White ctermbg=Grey
        endif
    "}}}

    "{{{ 杂项
        " 错误时不发出声响
        set noerrorbells
        " 禁用可视响铃
        set visualbell
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

    "{{{ go
        autocmd BufRead,BufNewFile *.go set filetype=go
    "}}}

"}}}

"{{{ 插件配置

    "{{{ 编程辅助

        "{{{ vim-autoformat
            let g:autoformat_autoindent = 0
            let g:autoformat_verbosemode = 1
            let g:formatdef_jsbeautify_javascript = join(['"',
                        \' js-beautify -f - ',
                        \' --indent-size 4 ',
                        \' --wrap-line-length 80 ',
                        \' --jslint-happy ',
                        \' --brace-style collapse',
                        \' --break-chained-methods ',
                        \'"'])
        "}}}

        "{{{ Dash.vim
        let g:dash_map = {
                    \'javascript': ['javascript'],
                    \'c': ['c', 'cpp'],
                    \'cpp': ['c', 'cpp'],
                    \}
        "}}}

        "{{{  UltiSnips
            autocmd FileType * call UltiSnips#FileTypeChanged()
            let g:UltiSnipsExpandTrigger = "ii"
            let g:UltiSnipsUsePythonVersion = 2
            let g:UltiSnipsEditSplit = "vertical"
        "}}}

        "{{{ tasklist.vim
            let g:tlTokenList = ["FIXME", "TODO", "HACK", "NOTE", "WARN", "MODIFY", "BUG"]
        "}}}

        "{{{ quickrun
            let g:quickrun_config = {}
            let g:quickrun_config.html = {'command' : 'open'}
        "}}}

        "{{{ syntastic
            let g:syntastic_check_on_open = 0
            let g:syntastic_echo_current_error = 1
            let g:syntastic_loc_list_height = 10
            let g:syntastic_c_checkers = ['gcc', 'make']
            let g:syntastic_c_check_header = 1
            let g:syntastic_c_no_include_search = 1
            let g:syntastic_python_checkers = ['pylint', 'flake8', 'pep8', 'pyflakes']
            let g:syntastic_c_checkers = ['gcc', 'make']
            let g:syntastic_python_pylint_args = "-disable-msg=C0103 --max-line-length=79"
            let g:syntastic_python_pep8_args = "--max-line-length=79"
            let g:syntastic_python_flake8_args = "--max-line-length=79 --max-complexity=15"
            let g:syntastic_always_populate_loc_list = 1
        "}}}

        "{{{ YouCompleteMe
            let g:ycm_register_as_syntastic_checker = 0
            let g:ycm_disable_for_files_larger_than_kb = 100
            let g:ycm_key_list_select_completion = ['<Down>', '<C-J>']
            let g:ycm_key_list_previous_completion = ['<Up>', '<C-K>']
            let g:ycm_min_num_of_chars_for_completion = 3
            let g:ycm_collect_identifiers_from_tags_files = 1
            let g:ycm_key_invoke_completion = '<C-L>'
            let g:ycm_key_detailed_diagnost1cs = ''
            let g:ycm_confirm_extra_conf = 1
            let g:ycm_complete_in_comments = 1
            let g:ycm_filetype_blacklist = {
                        \ 'tagbar' : 1,
                        \ 'qf' : 1,
                        \ 'notes' : 1,
                        \ 'markdown' : 1,
                        \ 'unite' : 1,
                        \ 'text' : 1,
                        \ 'vimwiki' : 1,
                        \ 'pandoc' : 1,
                        \ 'infolog' : 1,
                        \ 'mail' : 1
                        \}
        "}}}

        "{{{ ctrlsf.vim
            let g:ctrlsf_position = 'right'
            let g:ctrlsf_mapping = {
                        \ "next": ["<C-J>", "n"],
                        \ "prev": ["<C-K>", "p"]
                        \}
        "}}}

    "}}}

    "{{{ 前端

        "{{{ JavaScript

            "{{{ vim-jsdoc
                let g:jsdoc_allow_input_prompt = 1
                let g:jsdoc_input_description = 1
                let g:jsdoc_param_description_separator = ' - '
            "}}}

        "}}}

        "{{{ HTML

        "{{{ vim-emmet
            let g:user_emmet_install_global = 0
            let g:user_emmet_leader_key='<C-z>'
            autocmd FileType html,css EmmetInstall
        "}}}

        "}}}

    "}}}

    " {{{ python

        "{{{ indent-guides 对齐线插件
            let g:indent_guides_guide_size = 1
            let g:indent_guides_start_level = 2
            if !has("gui_running")
                let g:indent_guides_auto_colors = 0
                autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=White ctermbg=DarkGray
                autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=White ctermbg=Gray
            endif

        "}}}

    "}}}

    "{{{ c/cpp

        "{{{ vim-cscope-mod
            if has('mac')
                let g:Cscope_ctags_cmd    = '/usr/local/bin/ctags'
            endif
        "}}}

    "}}}

    "{{{ 通用

        "{{{ startify
            let g:startify_list_order = ['files', 'bookmarks']
            let g:startify_files_number = 20
            let g:startify_enable_special = 0
            let g:startify_skiplist = [
                        \ '^/tmp',
                        \ '/project/.*/documentation'
                        \ ]
        "}}}

        "{{{ unite
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

            let g:unite_data_directory = '~/.cache/unite'
            let g:unite_source_history_yank_enable = 1
            let g:unite_prompt = '» '

            if executable('ack')
                let g:unite_source_grep_command = 'ack'
                let g:unite_source_grep_default_opts = '--no-heading --no-color -C4'
                let g:unite_source_grep_recursive_opt = ''
            elseif executable('ag')
                let g:unite_source_grep_command = 'ag'
                let g:unite_source_grep_default_opts = '--nocolor --line-numbers --nogroup -S -C4'
                let g:unite_source_grep_recursive_opt = ''
            endif
        "}}}

        "{{{ vim-bookmarks
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

        "{{{ airline
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

        "{{{ vim-easymotion
            let g:EasyMotion_smartcase = 1
        "}}}

        "{{{ vim-gitgutter
            let g:gitgutter_map_keys = 0
            let g:gitgutter_realtime    = 0
            let g:gitgutter_eager       = 0
        "}}}

        "{{{ vim-ctrlspace
        " TODO: workspace
        " TODO: bookmark
        "}}}

        "{{{ NERDTree
            let g:NERDTreeWinPos = 'left'
            let g:NERDTreeWinSize = 25
            autocmd VimEnter * if argc() != 0 | NERDTree | endif
            autocmd VimEnter * if argc() != 0 | wincmd p | endif
            autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        "}}}

        "{{{ vimwiki
            let g:vimwiki_use_mouse = 1
            let g:vimwiki_camel_case = 0
            let g:vimwiki_hl_cb_checked = 1
            let g:vimwiki_folding = 0
            let g:vimwiki_CJK_length = 1
            let g:vimwiki_valid_html_tags ='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'
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
            let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
        "}}}

    "}}}

"}}}

"{{{ 快捷键

    "{{{ F1 ~ F12
        nnoremap <F1> <Esc>
        nnoremap <F3> :CtrlSF
        autocmd FileType cpp map <F5> :call NsLibMakeTags()<CR>
        autocmd FileType c map <F5> :call NsLibMakeTags()<CR>
        autocmd FileType python map <F5> :call NsLibMakeTags()<CR>
        autocmd FileType javascript map <F5> :call NsLibMakeTags()<CR>
        autocmd FileType go map <F5> :call NsLibMakeTags()<CR>
        autocmd FileType * map <buffer><F7> :SyntasticCheck<ESC>:Errors<CR>
        nnoremap <S-F7> :call ToggleLineNumberAndNerdTree()<CR>
        nnoremap <F9> :QuickRun
        nnoremap <F12> :NERDTreeToggle<CR>
    "}}}

    "{{{ vim

        "{{{ 基础配置
            " 刷新vim配置
            nnoremap <leader>sv :source $MYVIMRC<cr>

            " 编辑模式下按jk等价于按ESC键, 非常高效
            inoremap jk <esc>
            " 命令模式下，输入Q，退出Vim
            nnoremap Q :q<CR>
            " 忘记sudo时，强制保存
            cmap w!! %!sudo tee > /dev/null %
            " 选中元素复制到系统剪贴板
            vnoremap <leader>y "+y
            " 系统剪贴板内容粘贴到当前位置
            nnoremap <leader>p "+p

            nnoremap <leader>np :set nopaste<CR>
            nnoremap <leader>sp :set paste<CR>
        "}}}

        "{{{ 移动
            " 窗口间移动
            nnoremap <C-j> <C-W>j
            nnoremap <C-k> <C-W>k
            nnoremap <C-h> <C-W>h
            nnoremap <C-l> <C-W>l

            " 插入模式下移动光标
            inoremap <c-h> <left>
            inoremap <c-l> <right>
            inoremap <c-j> <c-o>gj
            inoremap <c-k> <c-o>gk

            " vim命令行Emacs风格快捷键绑定
            cnoremap <C-a> <Home>
            cnoremap <C-b> <Left>
            cnoremap <C-f> <Right>
            cnoremap <C-d> <Delete>
            cnoremap <C-j> <t_kd>
            cnoremap <C-k> <t_ku>
            cnoremap <Esc>b <S-Left>
            cnoremap <Esc>f <S-Right>
            cnoremap <Esc>d <S-right><Delete>
            cnoremap <C-g> <C-c>
        "}}}

        "{{{ 高亮
            " 高亮当前列
            nnoremap <leader>hc :call SetColorColumn()<CR>
        "}}}

        "{{{ 编程辅助

            nnoremap <leader>tb :TagbarToggle<CR>
            nnoremap <leader>td :TaskList<CR>

            "{{{ vim-gitgutter
                nnoremap <leader>gn <Plug>GitGutterNextHunk
                nnoremap <leader>gp <Plug>GitGutterPrevHunk
                nnoremap <leader>gs <Plug>GitGutterStageHunk
                nnoremap <leader>gr <Plug>GitGutterRevertHunk
                nnoremap <leader>gv <Plug>GitGutterPreviewHunk
            "}}}

            "{{{ vimwiki
                nnoremap <Leader>wb :Vimwiki2HTMLBrowse<CR>
                nnoremap <Leader>wa :VimwikiAll2HTML<CR>
                nnoremap <Leader>wh :Vimwiki2HTML<CR>
                nnoremap <Leader>ws :call VMS()<CR>
                nnoremap <Leader>wm :VimwikiUISelect<CR>2<CR>

                function! VMS()
                    execute ":VimwikiSearch " . input("VimwikiSearch:")
                    :lopen
                endfunction
            "}}}

            "{{{ cscope & ctags
                nnoremap zvf :vsplit<CR>:exec("tag ".expand("<cword>"))<CR>
                nnoremap zsf :split<CR>:exec("tag ".expand("<cword>"))<CR>
                nnoremap zf :split<CR>:exec("tag ".expand("<cword>"))<CR>
            "}}}

            "{{{ unite
                nnoremap  <leader>u/ :Unite grep:.<cr>
                nnoremap  <leader>uy :Unite -buffer-name=yanks history/yank<cr>
                nnoremap  <leader>uo :Unite -buffer-name=outline -vertical outline<cr>
                nnoremap  <leader>um :Unite -buffer-name=mru file_mru
                nnoremap  <leader>us :Unite -quick-match buffer<cr>
                nnoremap  <leader>ub :Unite -buffer-name=buffer buffer<CR>
                nnoremap  <leader>uf :Unite -buffer-name=files file_rec/async<CR>
                "nnoremap <silent><c-p> :<C-u>Unite -auto-resize file file_mru file_rec/async<cr>
            "}}}

            "{{{ ctrlsf
                nnoremap <leader>cf :CtrlSF<CR>
            "}}}

            "{{{ ctrlspace
                nnoremap <silent><C-p> :CtrlSpace O<CR>
            "}}}

        "}}}

    "}}}

"}}}

"{{{ 加载个性设置
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
"}}}

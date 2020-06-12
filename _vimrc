"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 作者:     凝霜
" E-mail:   mdl2009@vip.qq.com
" GitHub:   https://github.com/NsLib
" Blog:     http://blog.csdn.net/MDL13412
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{ before
set nocompatible
set hidden
set shell=bash
map <space> <leader>
map <space><space> <leader><leader>
"}}}

"{{{ Vundle插件管理

    "{{{ Vundle配置
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
        Plugin 'VundleVim/Vundle.vim'
    "}}}

    "{{{ 编程辅助
        " 语法检查插件
        Plugin 'scrooloose/syntastic'
        " 切换工作目录到项目根目录
        Plugin 'airblade/vim-rooter'
        " 快速注释插件
        Plugin 'scrooloose/NERDCommenter'
        " 代码折叠
        Plugin 'NsLib/vim-fold-mod'
    "}}}

    "{{{ Python
        " 语法高亮
        Plugin 'hdima/python-syntax'
    "}}}

    "{{{ 通用
        " 状态栏
        Plugin 'bling/vim-airline'
        " 快速移动
        Plugin 'easymotion/vim-easymotion'
        " 简化对称标签编辑
        Plugin 'tpope/vim-surround'
        " 可视化书签
        Plugin 'MattesGroeger/vim-bookmarks'
        " 相对行号
        Plugin 'myusuf3/numbers.vim'
        " Git wrapper
        Plugin 'tpope/vim-fugitive'
        " 显示Git修改
        Plugin 'airblade/vim-gitgutter'
        " 文件浏览器
        Plugin 'scrooloose/nerdtree'
        " 高亮显示空白行
        Plugin 'bronson/vim-trailing-whitespace'
        " buffer/file/tab/workspace/bookmark切换
        Plugin 'szw/vim-ctrlspace'
        " 搜索插件
        Plugin 'dyng/ctrlsf.vim'
        " Markdown支持
        Plugin 'plasticboy/vim-markdown'
        " 快速对齐
        Plugin 'junegunn/vim-easy-align'
        " enable repeating supported plugin maps with .
        Plugin 'tpope/vim-repeat'
        " 支持editorconfig
        Plugin 'editorconfig/editorconfig-vim'
    "}}}

    "{{{ 主题
        Plugin 'w0ng/vim-hybrid'
    "}}}
call vundle#end()

"}}}

"{{{ 基础设置

    "{{{ 语法检测设定
        filetype on
        filetype plugin on
        filetype indent on
        filetype plugin indent on
        syntax on
        syntax enable
        " 语法高亮最大列限制(提升性能)
        set synmaxcol=150
    "}}}

    "{{{ 编码及存储
        set fileencodings=utf-8
        set encoding=utf-8
        set nobomb
        set nobackup
        set noswapfile
        set autoread
        set autowrite
        set formatoptions+=B
    "}}}

    "{{{ 缩进/换行/空白/行号/折叠/滚动
        set autoindent
        set smartindent
        set cindent

        set nowrap
        set linebreak
        " 打开断行模块对亚洲语言支持
        set fo+=mB
        " 命令模式下可以直接移动到下一行或上一行
        set whichwrap+=<,>,h,l

        set shiftwidth=4
        set tabstop=4
        set expandtab
        set smarttab
        set shiftround
        set softtabstop=4
        set listchars=tab:▸\ ,trail:▫
        augroup vimrc-lang-make
            autocmd!
            autocmd FileType make set noexpandtab
        augroup END
        " 插入模式下使用 <BS>、<Del> <C-W> <C-U>
        set backspace=eol,start,indent

        set number

        set foldenable
        set foldmethod=syntax

        " 默认的折叠级别，为0则表示函数级别的折叠
        set foldlevel=99
        " 折叠线所占的宽度
        set foldcolumn=0
        " 用空格键开关折叠
        " nnoremap <silent> <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
    "}}}

    "{{{ 状态栏/标尺
        " 显示光标所在位置
        set ruler
        set cursorline
        " set cursorcolumn
        set showcmd
        set laststatus=2
        set cmdheight=1
        set textwidth=78
        set cc=+1
        set scrolloff=15
    "}}}

    "{{{ 搜索和匹配
        set showmatch
        set matchtime=5
        set ignorecase
        set smartcase
        set hlsearch
        set incsearch
    "}}}

    "{{{ 主题设置
        set t_Co=256
        set background=dark
        let g:hybrid_reduced_contrast = 1
        colorscheme hybrid

        "colorscheme dracula
        " 参考线颜色
        "highlight ColorColumn ctermfg=White ctermbg=Grey
    "}}}

    "{{{ 杂项
        set noerrorbells
        set visualbell
        set t_vb=
        set mouse=a
        set wildmenu
        set wildignore+=*/tmp/*,*.bak,*.bk,*~,*.so,*.swp,*.zip,*.pyc,*.o,*.obj
        set splitright
        set splitbelow

        " 打开上次编辑位置
        augroup vimrc-remember-cursor-position
            autocmd!
            autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
        augroup END

        " 默认加载tags
        set tags=tags;/
        " 离开插入模式后自动关闭预览窗口
        augroup vimrc-editor-insert
            autocmd!
            autocmd InsertLeave * if pumvisible() == 0|pclose|endif
        augroup END
    "}}}

"}}}

"{{{ 特定文件类型设置

    "{{{ vim
        augroup vimrc-lang-vim
            autocmd!
            autocmd FileType vim setlocal foldmethod=marker
            autocmd FileType vim setlocal foldmarker={{{,}}}
            autocmd FileType vim setlocal foldlevel=0

            " 默认开启代码折叠的文件类型
            autocmd BufReadPost *.vim normal z[
            autocmd BufReadPost *.vimrc normal z[
            autocmd BufReadPost *.vimrc.* normal z[
        augroup END
    "}}}

    "{{{ shell
        augroup vimrc-lang-shell
            set foldmethod=manual
            " 开启shell脚本函数折叠支持
            " let g:sh_fold_enabled = 1
        augroup END
    "}}}

    "{{{ python
        augroup vimrc-lang-python
            autocmd!
            autocmd FileType python setlocal foldmethod=indent
        augroup END
    "}}}

    "{{{ markdown
        augroup vimrc-lang-markdown
            autocmd!
            autocmd BufRead,BufNewFile *.{md,mkd,mkdn,mark*} set filetype=markdown
        augroup END
    "}}}

    "{{{ yaml
        augroup vimrc-lang-yaml
            autocmd!
            autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
        augroup END
    "}}}

    "{{{ go
        augroup vimrc-lang-go
            autocmd!
            autocmd BufRead,BufNewFile *.go set filetype=go
        augroup END
    "}}}

    "{{{ crontab
        autocmd filetype crontab setlocal nobackup nowritebackup
    "}}}

"}}}

"{{{ 插件配置

    "{{{ 编程辅助

        "{{{ syntastic
            let g:syntastic_check_on_open = 0
            let g:syntastic_check_on_wq = 0
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
            let g:syntastic_mode_map = {
                        \ "mode": "passive",
                        \ "active_filetypes": [],
                        \ "passive_filetypes": []
                        \ }
        "}}}

        "{{{ ctrlsf.vim
            let g:ctrlsf_position = 'right'
            let g:ctrlsf_mapping = {
                        \ "next": ["<C-J>", "n"],
                        \ "prev": ["<C-K>", "p"]
                        \}
        "}}}

    "}}}

    "{{{ 通用

        "{{{ vim-bookmarks
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
            let g:airline#extensions#ctrlspace#enabled = 1
            let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"

            nmap <leader>1 <Plug>AirlineSelectTab1
            nmap <leader>2 <Plug>AirlineSelectTab2
            nmap <leader>3 <Plug>AirlineSelectTab3
            nmap <leader>4 <Plug>AirlineSelectTab4
            nmap <leader>5 <Plug>AirlineSelectTab5
            nmap <leader>6 <Plug>AirlineSelectTab6
            nmap <leader>7 <Plug>AirlineSelectTab7
            nmap <leader>8 <Plug>AirlineSelectTab8
            nmap <leader>9 <Plug>AirlineSelectTab9
            nmap <Leader>x :bp<CR>:bd #<CR>
        "}}}

        "{{{ vim-easymotion
            let g:EasyMotion_smartcase = 1
        "}}}

        "{{{ vim-gitgutter
            let g:gitgutter_map_keys = 0
            let g:gitgutter_realtime    = 0
            let g:gitgutter_eager       = 0
        "}}}

        "{{{ NERDTree
            let g:NERDTreeWinPos = 'left'
            let g:NERDTreeWinSize = 25
        "}}}
    "}}}

"}}}

"{{{ 快捷键

    "{{{ F1 ~ F12
        nnoremap <F1> <Esc>
        nnoremap <F3> :CtrlSF
        augroup vimrc-editor-shortcuts
            autocmd!
            autocmd FileType * map <buffer><F7> :SyntasticCheck<ESC>:Errors<CR>
        augroup END
        nnoremap <S-F7> :call ToggleLineNumberAndNerdTree()<CR>
        nnoremap <F9> :QuickRun
        nnoremap <F11> :NERDTreeFind<CR>
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

            "{{{ ctrlsf
                nnoremap <leader>cf :CtrlSF<CR>
            "}}}

        "}}}

    "}}}

"}}}

"{{{ 加载个性设置
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
"}}}

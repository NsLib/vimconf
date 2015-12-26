""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"作者：凝霜
"博客：http://blog.csdn.net/MDL13412
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("loaded_nslib_syntax")
    finish
endif
let loaded_nslib_syntax = 1

"{{{ shell
" 折叠shell的#多行注释
autocmd FileType sh :syntax match comment "\v(^\s*[#]+.*\n)+" fold
"}}}

"{{{ C/C++
" 折叠C语言多行的//注释
autocmd FileType c :syntax match comment "\v(^\s*//.*\n)+" fold
" 折叠C++多行的//注释
autocmd FileType cpp :syntax match comment "\v(^\s*//.*\n)+" fold
"}}}

"{{{ go
" 折叠go多行的//注释
autocmd FileType go :syntax match comment "\v(^\s*//.*\n)+" fold
" 折叠go的import ()导入
autocmd FileType go :syntax region goImport start="($" end=")$" fold
"}}}

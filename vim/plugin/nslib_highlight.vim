""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"作者：凝霜
"博客：http://blog.csdn.net/MDL13412
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("loaded_nslib_highlight")
    finish
endif
let loaded_nslib_highlight = 1

function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction

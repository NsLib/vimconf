""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"作者：凝霜
"博客：http://blog.csdn.net/MDL13412
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("loaded_nslib_make_tags")
    finish
endif
let loaded_nslib_make_tags = 1

function NsLibMakeTags()
    call CscopeUpdateDB()
    echo "1"
    :TagsGenerate!
endfunction

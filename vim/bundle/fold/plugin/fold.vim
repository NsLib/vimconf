" 将打开和关闭的快捷键呼唤，符合个人习惯
" 添加Python语言的支持
" Modified By: 凝霜
" mdl2009@vip.qq.com
" http://blog.csdn.net/MDL13412
"
" Causes all comment folds to be opened and closed using z[ and z]
" respectively.
"
" Causes all block folds to be opened and closed using z{ and z} respectively.
"

function! NoneFoldOnlyMatching()
endfunction

function! CFoldOnlyMatching(op)
    try
        " patch版本，适用于绝大部分的语言
        mark Z
        normal gg
        normal zj
        let s:lastline = 0 
        while s:lastline != line('.')
            exec 'normal ' . a:op
            let s:lastline = line('.')
            normal zj
        endwhile
        normal 'Z
        unlet s:lastline
    catch
        " 忽略找不到折叠的情况
    endtry
endfunction



function! PythonFoldOnlyMatching(op)
    call CFoldOnlyMatching(a:op)
endfunction

function! VimFoldOnlyMatching(op)
    call CFoldOnlyMatching(a:op)
endfunction

function! GoFoldOnlyMatching(op)
    call CFoldOnlyMatching(a:op)
endfunction

function! ShellFoldOnlyMatching(op)
    call CFoldOnlyMatching(a:op)
endfunction

function! MDFoldOnlyMatching(op)
    call CFoldOnlyMatching(a:op)
endfunction



autocmd FileType c          noremap <silent> z[ :call CFoldOnlyMatching('zc')<CR>
autocmd FileType c          noremap <silent> z] :call CFoldOnlyMatching('zo')<CR>
autocmd FileType c          noremap <silent> z{ :call CFoldOnlyMatching('zc')<CR>
autocmd FileType c          noremap <silent> z} :call CFoldOnlyMatching('zo')<CR>

autocmd FileType cpp        noremap <silent> z[ :call CFoldOnlyMatching('zc')<CR>
autocmd FileType cpp        noremap <silent> z] :call CFoldOnlyMatching('zo')<CR>
autocmd FileType cpp        noremap <silent> z{ :call CFoldOnlyMatching('zc')<CR>
autocmd FileType cpp        noremap <silent> z} :call CFoldOnlyMatching('zo')<CR>

autocmd FileType python     noremap <silent> z[ :call PythonFoldOnlyMatching('zc')<CR>
autocmd FileType python     noremap <silent> z] :call PythonFoldOnlyMatching('zo')<CR>
autocmd FileType python     noremap <silent> z{ :call PythonFoldOnlyMatching('zc')<CR>
autocmd FileType python     noremap <silent> z} :call PythonFoldOnlyMatching('zo')<CR>

autocmd FileType vim        noremap <silent> z[ :call VimFoldOnlyMatching('zc')<CR>
autocmd FileType vim        noremap <silent> z] :call VimFoldOnlyMatching('zo')<CR>
autocmd FileType vim        noremap <silent> z{ :call VimFoldOnlyMatching('zc')<CR>
autocmd FileType vim        noremap <silent> z} :call VimFoldOnlyMatching('zo')<CR>

autocmd FileType go         noremap <silent> z[ :call GoFoldOnlyMatching('zc')<CR>
autocmd FileType go         noremap <silent> z] :call GoFoldOnlyMatching('zo')<CR>
autocmd FileType go         noremap <silent> z{ :call GoFoldOnlyMatching('zc')<CR>
autocmd FileType go         noremap <silent> z} :call GoFoldOnlyMatching('zo')<CR>

autocmd FileType sh         noremap <silent> z[ :call ShellFoldOnlyMatching('zc')<CR>
autocmd FileType sh         noremap <silent> z] :call ShellFoldOnlyMatching('zo')<CR>
autocmd FileType sh         noremap <silent> z{ :call ShellFoldOnlyMatching('zc')<CR>
autocmd FileType sh         noremap <silent> z} :call ShellFoldOnlyMatching('zo')<CR>

autocmd FileType markdown   noremap <silent> z[ :call MDFoldOnlyMatching('zc')<CR>
autocmd FileType markdown   noremap <silent> z] :call MDFoldOnlyMatching('zo')<CR>
autocmd FileType markdown   noremap <silent> z{ :call MDFoldOnlyMatching('zc')<CR>
autocmd FileType markdown   noremap <silent> z} :call MDFoldOnlyMatching('zo')<CR>

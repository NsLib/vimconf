autocmd FileType *              command! CloseSyntasticQuickFixWindow   SyntasticReset
autocmd FileType *              command! OpenSyntasticQuickFixWindow    SyntasticCheck

let s:toggle_line_bumber_and_nerd_tree_flag = 1
function! ToggleLineNumberAndNerdTree()
    try
        if s:toggle_line_bumber_and_nerd_tree_flag == 1
            let s:toggle_line_bumber_and_nerd_tree_flag = 0
            NERDTreeClose
            set nonu
            set mouse=
            GitGutterDisable
            :CloseSyntasticQuickFixWindow
            :NumbersToggle
        else
            let s:toggle_line_bumber_and_nerd_tree_flag = 1
            NERDTree
            wincmd l
            set nu
            set mouse=a
            GitGutterEnable
            :OpenSyntasticQuickFixWindow
            :NumbersToggle
        endif
    catch
    endtry
endfunction

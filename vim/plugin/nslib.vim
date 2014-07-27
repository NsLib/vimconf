
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"作者：凝霜
"博客：http://blog.csdn.net/MDL13412
"大部分功能来自与互联网，无法一一注明出处，只能在此对作者表示感谢。
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"添加版权信息
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
function InsertCopyrights()
    call append(0,"/**")
    call append(1," * @file    ".expand("%:t"))
    call append(2," * @author  凝霜")
    call append(3," * email:   mdl2009@vip.qq.com")
    call append(4," * blog:    http://blog.csdn.net/MDL13412")
    call append(5," */")
    echohl WarningMsg | echo "版权信息加入成功" | echohl None
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"插入头文件guard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
function InsertHeadDef(firstLine, lastLine)
    if a:firstLine <1 || a:lastLine> line('$')
        echoerr 'InsertHeadDef : Range overflow !(FirstLine:'.a:firstLine.';LastLine:'.a:lastLine.';ValidRange:1~'.line('$').')'
        return ''
    endif
    let sourcefilename=expand("%:t")
    let definename=substitute(sourcefilename,' ','','g')
    let definename=substitute(definename,'\.','_','g')
    let definename = toupper(definename)
    exe 'normal '.a:firstLine.'GO'
    call setline('.', '#ifndef _NSLIB_'.definename."_")
    normal ==o
    call setline('.', '#define _NSLIB_'.definename."_")
    exe 'normal =='.(a:lastLine-a:firstLine+1).'jo'
    call setline('.', '#endif   // '.'_NSLIB_'.definename."_")
    let goLn = a:firstLine+2
    exe 'normal =='.goLn.'G'
endfunction

function InsertHeaderGuard()
    let firstLine = 1
    let lastLine = line('$')
    let n=1
    while n < 20
        let line = getline(n)
        if n==1 
            if line =~ '^\/\*.*$'
                let n = n + 1
                continue
            else
                break
            endif
        endif
        if line =~ '^.*\*\/$'
            let firstLine = n+1
            break
        endif
        let n = n + 1
    endwhile
    call InsertHeadDef(firstLine, lastLine)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"一键编译
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function Do_OneFileMake()
    if expand("%:p:h")!=getcwd()
        echohl WarningMsg | echo "make失败! 文件不在当前目录!按F7键重定向到文件所在目录." | echohl None
        return
    endif
    let sourcefileename=expand("%:t")
    if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
        echohl WarningMsg | echo "make失败!请选择正确的文件!" | echohl None
        return
    endif
    let deletedspacefilename=substitute(sourcefileename,' ','','g')
    if strlen(deletedspacefilename)!=strlen(sourcefileename)
        echohl WarningMsg | echo "make失败!请删除文件名中的空格!" | echohl None
        return
    endif
    if &filetype=="c"
        set makeprg=gcc\ -o\ %<\ %
    elseif &filetype=="cpp"
        set makeprg=g++\ -o\ %<\ %
        "elseif &filetype=="cs"
        "set makeprg=csc\ \/nologo\ \/out:%<.exe\ %
    endif
   
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'','g')
    let toexename=outfilename
    if filereadable(outfilename)
        let outdeletedsuccess=delete("./".outfilename)
        if(outdeletedsuccess!=0)
            set makeprg=make
            echohl WarningMsg | echo "make失败! I 无法删除 ".outfilename | echohl None
            return
        endif
    endif
    execute "silent make"
    set makeprg=make
    execute "normal :"
    execute "!echo 编译完成！"
    if filereadable(outfilename)
        execute "!./".toexename
    endif
    execute "copen"
endfunction
function Do_make()
    set makeprg=make
    execute "silent make"
    execute "!echo make完成！"
    execute "copen"
endfunction

function Do_make_clean()
    execute "silent make clean"
    execute "!echo make clean 完成！"
    execute "copen"
endfunction

"能够漂亮地显示.NFO文件 
function! SetFileEncodings(encodings) 
    let b:myfileencodingsbak=&fileencodings 
    let &fileencodings=a:encodings 
endfunction 

function! RestoreFileEncodings() 
    let &fileencodings=b:myfileencodingsbak 
    unlet b:myfileencodingsbak 
endfunction 

au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single au BufReadPost *.nfo call RestoreFileEncodings() 


function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction

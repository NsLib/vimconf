" Vim color file
" Maintainer:   Mingbai <mbbill AT gmail DOT com>
" Last Change:  2006-12-24 20:09:09

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
    syntax reset
    endif
endif
let g:colors_name="desertEx_256"

highlight Normal guifg=gray guibg=grey17 gui=NONE ctermfg=250 ctermbg=235 cterm=NONE

" AlignCtrl default
" AlignCtrl =P0 guifg guibg gui
" Align

" highlight groups
highlight Cursor guifg=black guibg=yellow gui=NONE ctermfg=16 ctermbg=226 cterm=NONE
highlight ErrorMsg guifg=white guibg=red gui=NONE ctermfg=231 ctermbg=196 cterm=NONE
highlight VertSplit guifg=gray40 guibg=gray40 gui=NONE ctermfg=241 ctermbg=241 cterm=NONE
highlight Folded guifg=darkslategray3 guibg=grey30 gui=NONE ctermfg=116 ctermbg=239 cterm=NONE
highlight FoldColumn guifg=tan guibg=grey30 gui=NONE ctermfg=180 ctermbg=239 cterm=NONE
highlight IncSearch guifg=#b0ffff guibg=#2050d0 ctermfg=159 ctermbg=26
highlight LineNr guifg=burlywood3 gui=NONE ctermfg=180 cterm=NONE
highlight ModeMsg guifg=skyblue gui=NONE ctermfg=117 cterm=NONE
highlight MoreMsg guifg=seagreen gui=NONE ctermfg=29 cterm=NONE
highlight NonText guifg=cyan gui=NONE ctermfg=51 cterm=NONE
highlight Question guifg=springgreen gui=NONE ctermfg=48 cterm=NONE
highlight Search guifg=gray80 guibg=#445599 gui=NONE ctermfg=252 ctermbg=61 cterm=NONE
highlight SpecialKey guifg=cyan gui=NONE ctermfg=51 cterm=NONE
highlight StatusLine guifg=black guibg=#c2bfa5 gui=bold ctermfg=16 ctermbg=144 cterm=bold
highlight StatusLineNC guifg=grey guibg=gray40 gui=NONE ctermfg=250 ctermbg=241 cterm=NONE
highlight Title guifg=indianred gui=NONE ctermfg=167 cterm=NONE
highlight Visual guifg=gray17 guibg=tan1 gui=NONE ctermfg=235 ctermbg=215 cterm=NONE
highlight WarningMsg guifg=salmon gui=NONE ctermfg=210 cterm=NONE
highlight Pmenu guifg=darkslategray3 guibg=grey30 gui=NONE ctermfg=116 ctermbg=239 cterm=NONE
"highlight Pmenu guifg=white guibg=#445599 gui=NONE ctermfg=231 ctermbg=61 cterm=NONE
highlight PmenuSel guifg=#445599 guibg=gray ctermfg=61 ctermbg=250
highlight WildMenu guifg=gray guibg=gray17 gui=NONE ctermfg=250 ctermbg=235 cterm=NONE
highlight MatchParen guifg=cyan guibg=NONE gui=bold ctermfg=51 cterm=bold
highlight DiffAdd guifg=black guibg=wheat1 ctermfg=16 ctermbg=223
highlight DiffChange guifg=black guibg=skyblue1 ctermfg=16 ctermbg=117
highlight DiffText guifg=black guibg=hotpink1 gui=NONE ctermfg=16 ctermbg=205 cterm=NONE
highlight DiffDelete guifg=black guibg=gray45 gui=NONE ctermfg=16 ctermbg=243 cterm=NONE



" syntax highlighting groups
highlight Comment guifg=palegreen3 gui=italic ctermfg=114
highlight Constant guifg=salmon gui=NONE ctermfg=210 cterm=NONE
highlight Identifier guifg=skyblue gui=NONE ctermfg=117 cterm=NONE
highlight Function guifg=skyblue gui=NONE ctermfg=117 cterm=NONE
highlight Statement guifg=lightgoldenrod2 gui=NONE ctermfg=186 cterm=NONE
highlight PreProc guifg=palevioletred2 gui=NONE ctermfg=211 cterm=NONE
highlight Type guifg=tan1 gui=NONE ctermfg=215 cterm=NONE
highlight Special guifg=aquamarine2 gui=NONE ctermfg=122 cterm=NONE
highlight Ignore guifg=grey40 gui=NONE ctermfg=241 cterm=NONE
highlight Todo guifg=orangered guibg=yellow2 gui=NONE ctermfg=202 ctermbg=226 cterm=NONE


" Vim color file - dw_cyan
" Generated by http://bytefluent.com/vivify 2014-07-11
set background=dark
if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

set t_Co=256
let g:colors_name = "dw_cyan"

hi IncSearch guifg=#000000 guibg=#00bbbb guisp=#00bbbb gui=NONE ctermfg=NONE ctermbg=37 cterm=NONE
"hi WildMenu -- no settings --
hi SignColumn guifg=#ffffff guibg=#111111 guisp=#111111 gui=NONE ctermfg=15 ctermbg=233 cterm=NONE
hi SpecialComment guifg=#ffffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Typedef guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Title guifg=#00ffff guibg=NONE guisp=NONE gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi Folded guifg=#ff0000 guibg=#222222 guisp=#222222 gui=NONE ctermfg=196 ctermbg=235 cterm=NONE
hi PreCondit guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Include guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi TabLineSel guifg=#000000 guibg=#00aaaa guisp=#00aaaa gui=NONE ctermfg=NONE ctermbg=37 cterm=NONE
hi StatusLineNC guifg=#000000 guibg=#444444 guisp=#444444 gui=NONE ctermfg=NONE ctermbg=238 cterm=NONE
"hi CTagsMember -- no settings --
hi NonText guifg=#ffffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
"hi CTagsGlobalConstant -- no settings --
hi DiffText guifg=#ffffff guibg=#333333 guisp=#333333 gui=NONE ctermfg=15 ctermbg=236 cterm=NONE
hi ErrorMsg guifg=#000000 guibg=#ffffff guisp=#ffffff gui=NONE ctermfg=NONE ctermbg=15 cterm=NONE
"hi Ignore -- no settings --
hi Debug guifg=#ffffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=NONE guibg=#000000 guisp=#000000 gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Identifier guifg=#00cccc guibg=#000000 guisp=#000000 gui=NONE ctermfg=44 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#ffffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Conditional guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Todo guifg=#ff0000 guibg=#000000 guisp=#000000 gui=NONE ctermfg=196 ctermbg=NONE cterm=NONE
hi Special guifg=#ffffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi LineNr guifg=#008888 guibg=#000000 guisp=#000000 gui=NONE ctermfg=30 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#000000 guibg=#00ffff guisp=#00ffff gui=NONE ctermfg=NONE ctermbg=14 cterm=NONE
hi Normal guifg=#c0c0c0 guibg=#000000 guisp=#000000 gui=NONE ctermfg=7 ctermbg=NONE cterm=NONE
hi Label guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
"hi CTagsImport -- no settings --
hi PMenuSel guifg=#000000 guibg=#00ffff guisp=#00ffff gui=NONE ctermfg=NONE ctermbg=14 cterm=NONE
hi Search guifg=#000000 guibg=#00ffff guisp=#00ffff gui=NONE ctermfg=NONE ctermbg=14 cterm=NONE
"hi CTagsGlobalVariable -- no settings --
hi Delimiter guifg=#ffffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Statement guifg=#00ffff guibg=NONE guisp=NONE gui=bold ctermfg=14 ctermbg=NONE cterm=bold
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
hi Comment guifg=#696969 guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
hi Character guifg=#00ffff guibg=NONE guisp=NONE gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
"hi Float -- no settings --
hi Number guifg=#00ffff guibg=NONE guisp=NONE gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi Boolean guifg=#00ffff guibg=NONE guisp=NONE gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi Operator guifg=#696969 guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#001818 guisp=#001818 gui=NONE ctermfg=NONE ctermbg=23 cterm=NONE
"hi Union -- no settings --
hi TabLineFill guifg=#ffffff guibg=#000000 guisp=#000000 gui=underline ctermfg=15 ctermbg=NONE cterm=underline
hi Question guifg=#00ffff guibg=NONE guisp=NONE gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi WarningMsg guifg=#000000 guibg=#888888 guisp=#888888 gui=NONE ctermfg=NONE ctermbg=102 cterm=NONE
"hi VisualNOS -- no settings --
hi DiffDelete guifg=#00ffff guibg=#333333 guisp=#333333 gui=NONE ctermfg=14 ctermbg=236 cterm=NONE
hi ModeMsg guifg=#00ffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#001111 guisp=#001111 gui=NONE ctermfg=NONE ctermbg=23 cterm=NONE
hi Define guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Function guifg=#00ffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#ff0000 guibg=#222222 guisp=#222222 gui=NONE ctermfg=196 ctermbg=235 cterm=NONE
hi PreProc guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
"hi EnumerationName -- no settings --
hi Visual guifg=#000000 guibg=#00dddd guisp=#00dddd gui=NONE ctermfg=NONE ctermbg=44 cterm=NONE
hi MoreMsg guifg=#00ffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
"hi SpellCap -- no settings --
hi VertSplit guifg=#ffffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Exception guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Keyword guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Type guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi DiffChange guifg=#00ffff guibg=#333333 guisp=#333333 gui=NONE ctermfg=14 ctermbg=236 cterm=NONE
hi Cursor guifg=#ffffff guibg=#444444 guisp=#444444 gui=NONE ctermfg=15 ctermbg=238 cterm=NONE
"hi SpellLocal -- no settings --
"hi Error -- no settings --
hi PMenu guifg=#000000 guibg=#444444 guisp=#444444 gui=NONE ctermfg=NONE ctermbg=238 cterm=NONE
hi SpecialKey guifg=#00ffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi Constant guifg=#00ffff guibg=NONE guisp=NONE gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
"hi DefinedName -- no settings --
hi Tag guifg=#ffffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi String guifg=#00bbbb guibg=NONE guisp=NONE gui=NONE ctermfg=37 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=NONE guibg=#008888 guisp=#008888 gui=NONE ctermfg=NONE ctermbg=30 cterm=NONE
hi MatchParen guifg=#00ffff guibg=#222222 guisp=#222222 gui=NONE ctermfg=14 ctermbg=235 cterm=NONE
"hi LocalVariable -- no settings --
hi Repeat guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
hi Directory guifg=#00ffff guibg=#000000 guisp=#000000 gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi Structure guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Macro guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
"hi Underlined -- no settings --
hi DiffAdd guifg=#00ffff guibg=#333333 guisp=#333333 gui=NONE ctermfg=14 ctermbg=236 cterm=NONE
hi TabLine guifg=#000000 guibg=#444444 guisp=#444444 gui=NONE ctermfg=NONE ctermbg=238 cterm=NONE
hi cursorim guifg=#dbdbdb guibg=#8b8bff guisp=#8b8bff gui=NONE ctermfg=253 ctermbg=105 cterm=NONE
"hi clear -- no settings --
hi pythonimport guifg=#00ff00 guibg=NONE guisp=NONE gui=NONE ctermfg=10 ctermbg=NONE cterm=NONE
hi pythonexception guifg=#ff0000 guibg=NONE guisp=NONE gui=NONE ctermfg=196 ctermbg=NONE cterm=NONE
hi pythonbuiltinfunction guifg=#00ff00 guibg=NONE guisp=NONE gui=NONE ctermfg=10 ctermbg=NONE cterm=NONE
hi pythonoperator guifg=#c6d9ff guibg=NONE guisp=NONE gui=NONE ctermfg=189 ctermbg=NONE cterm=NONE
hi pythonexclass guifg=#00ff00 guibg=NONE guisp=NONE gui=NONE ctermfg=10 ctermbg=NONE cterm=NONE
hi mbenormal guifg=#ffebd5 guibg=#2e2e3f guisp=#2e2e3f gui=NONE ctermfg=230 ctermbg=237 cterm=NONE
hi perlspecialstring guifg=#eb9dff guibg=#404040 guisp=#404040 gui=NONE ctermfg=219 ctermbg=238 cterm=NONE
hi doxygenspecial guifg=#ffd191 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi mbechanged guifg=#ffffff guibg=#2e2e3f guisp=#2e2e3f gui=NONE ctermfg=15 ctermbg=237 cterm=NONE
hi mbevisiblechanged guifg=#ffffff guibg=#4e4e8f guisp=#4e4e8f gui=NONE ctermfg=15 ctermbg=60 cterm=NONE
hi doxygenparam guifg=#ffd191 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi doxygensmallspecial guifg=#ffd191 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi doxygenprev guifg=#ffd191 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi perlspecialmatch guifg=#eb9dff guibg=#404040 guisp=#404040 gui=NONE ctermfg=219 ctermbg=238 cterm=NONE
hi cformat guifg=#eb9dff guibg=#404040 guisp=#404040 gui=NONE ctermfg=219 ctermbg=238 cterm=NONE
hi lcursor guifg=#787878 guibg=#c0aa94 guisp=#c0aa94 gui=NONE ctermfg=243 ctermbg=138 cterm=NONE
hi doxygenspecialmultilinedesc guifg=#ff8b10 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi taglisttagname guifg=#8995ff guibg=NONE guisp=NONE gui=NONE ctermfg=105 ctermbg=NONE cterm=NONE
hi doxygenbrief guifg=#ffad60 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi mbevisiblenormal guifg=#fffffd guibg=#4e4e8f guisp=#4e4e8f gui=NONE ctermfg=230 ctermbg=60 cterm=NONE
hi user2 guifg=#b2b2ff guibg=#3e3e5e guisp=#3e3e5e gui=NONE ctermfg=147 ctermbg=60 cterm=NONE
hi user1 guifg=#00ff8c guibg=#3e3e5e guisp=#3e3e5e gui=NONE ctermfg=48 ctermbg=60 cterm=NONE
hi doxygenspecialonelinedesc guifg=#ff8b10 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi doxygencomment guifg=#ffb62f guibg=NONE guisp=NONE gui=NONE ctermfg=214 ctermbg=NONE cterm=NONE
hi cspecialcharacter guifg=#eb9dff guibg=#404040 guisp=#404040 gui=NONE ctermfg=219 ctermbg=238 cterm=NONE
hi htmlitalic guifg=#ffffec guibg=#2a2a2a guisp=#2a2a2a gui=italic ctermfg=230 ctermbg=235 cterm=NONE
hi htmlboldunderlineitalic guifg=#ffffec guibg=#2a2a2a guisp=#2a2a2a gui=bold,italic,underline ctermfg=230 ctermbg=235 cterm=bold,underline
hi htmlbolditalic guifg=#ffffec guibg=#2a2a2a guisp=#2a2a2a gui=bold,italic ctermfg=230 ctermbg=235 cterm=bold
hi htmlunderlineitalic guifg=#ffffec guibg=#2a2a2a guisp=#2a2a2a gui=italic,underline ctermfg=230 ctermbg=235 cterm=underline
hi htmlbold guifg=#ffffec guibg=#2a2a2a guisp=#2a2a2a gui=bold ctermfg=230 ctermbg=235 cterm=bold
hi htmlboldunderline guifg=#ffffec guibg=#2a2a2a guisp=#2a2a2a gui=bold,underline ctermfg=230 ctermbg=235 cterm=bold,underline
hi htmlunderline guifg=#ffffec guibg=#2a2a2a guisp=#2a2a2a gui=underline ctermfg=230 ctermbg=235 cterm=underline
hi cdefine guifg=#00ffff guibg=NONE guisp=NONE gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi cinclude guifg=#ffffff guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE


" Bunnyfly Colors Based off wombat256mod
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "bunnyfly"


" General colors
hi Normal       ctermfg=231     ctermbg=232     cterm=none      guifg=#ffffff   guibg=#080808   gui=none
hi Cursor       ctermfg=none    ctermbg=241     cterm=none      guifg=NONE      guibg=#656565   gui=none
hi Visual       ctermfg=7       ctermbg=238     cterm=none      guifg=#f6f3e8   guibg=#444444   gui=none
" hi VisualNOS
hi Search       ctermfg=231     ctermbg=125     cterm=none      guifg=#ffffff   guibg=#aa0055   gui=none
hi Folded       ctermfg=103     ctermbg=238     cterm=none      guifg=#a0a8b0   guibg=#384048   gui=none
hi Title        ctermfg=7       ctermbg=none    cterm=bold      guifg=#f6f3e8   guibg=NONE      gui=bold
hi StatusLine   ctermfg=016     ctermbg=238     cterm=bold      guifg=#000000   guibg=#444444   gui=bold
hi StatusLineNC ctermfg=236     ctermbg=238     cterm=none      guifg=#303030   guibg=#444444   gui=none
hi VertSplit    ctermfg=236     ctermbg=236     cterm=none      guifg=#303030   guibg=#303030   gui=none
hi LineNr       ctermfg=238     ctermbg=232     cterm=none      guifg=#444444   guibg=#080808   gui=none
hi SignColumn   ctermfg=238     ctermbg=232     cterm=none      guifg=#444444   guibg=#080808   gui=none
hi SpecialKey   ctermfg=244     ctermbg=236     cterm=none      guifg=#808080   guibg=#303030   gui=none
hi WarningMsg   ctermfg=203                                     guifg=#ff5f55
hi ErrorMsg     ctermfg=196     ctermbg=236     cterm=bold      guifg=#ff2026   guibg=#3a3a3a   gui=bold
hi NonText      ctermfg=235     ctermbg=232     cterm=none      guifg=#222222   guibg=#080808   gui=none
hi ColorColumn                  ctermbg=233                                     guibg=#121212

" Vim >= 7.0 specific colors
if version >= 700
hi CursorLine                   ctermbg=236     cterm=none                      guibg=#2d2d2d
hi MatchParen   ctermfg=7       ctermbg=243     cterm=bold      guifg=#f6f3e8   guibg=#857b6f   gui=bold
hi Pmenu        ctermfg=7       ctermbg=238                     guifg=#f6f3e8   guibg=#444444
hi PmenuSel     ctermfg=0       ctermbg=192                     guifg=#000000   guibg=#cae682
endif


" Diff highlighting
" Potential Good Diff Colors: ctermbg=24 ctermbg=58 ctermbg=61 ctermbg=125 ctermbg=133
hi DiffAdd                      ctermbg=24                                      guibg=#2a0d6a
hi DiffDelete   ctermfg=236     ctermbg=60      cterm=none      guifg=#242424   guibg=#3e3969   gui=none
hi DiffText     ctermfg=255     ctermbg=58      cterm=none                      guibg=#73186e   gui=none
hi DiffChange                   ctermbg=237                                     guibg=#382a37


" Syntax highlighting
hi Keyword      ctermfg=111     cterm=none      guifg=#8ac6f2   gui=none
hi Statement    ctermfg=111     cterm=none      guifg=#8ac6f2   gui=none
hi Constant     ctermfg=173     cterm=none      guifg=#e5786d   gui=none
hi Number       ctermfg=173     cterm=none      guifg=#e5786d   gui=none
hi PreProc      ctermfg=173     cterm=none      guifg=#e5786d   gui=none
hi Function     ctermfg=192     cterm=none      guifg=#cae682   gui=none
hi Identifier   ctermfg=192     cterm=none      guifg=#cae682   gui=none
hi Type         ctermfg=192     cterm=none      guifg=#cae682   gui=none
hi Special      ctermfg=194     cterm=none      guifg=#e7f6da   gui=none
hi String       ctermfg=113     cterm=none      guifg=#95e454   gui=italic
hi Comment      ctermfg=246     cterm=none      guifg=#99968b   gui=italic
hi Todo         ctermfg=245     cterm=none      guifg=#8f8f8f   gui=italic
hi Underlined   ctermfg=81                      guifg=#5fd7ff

"hi Keyword      ctermfg=141     cterm=none
"hi Statement    ctermfg=141     cterm=none
"hi Keyword      ctermfg=81     cterm=none
"hi Statement    ctermfg=81     cterm=none


" Links
hi! link FoldColumn     Folded
hi! link CursorColumn   CursorLine


" EasyMotion
hi EasyMotionTarget cterm=bold ctermfg=1 ctermbg=15
hi link EasyMotionTarget2First EasyMotionTarget
hi link EasyMotionTarget2Second EasyMotionTarget

hi EasyMotionShade cterm=none ctermfg=242 ctermbg=0
hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search


" vim-signify
hi SignifySignAdd    ctermfg=113 ctermbg=232 cterm=none guifg=#95e454 guibg=#080808 gui=none
hi SignifySignDelete ctermfg=196 ctermbg=232 cterm=none guifg=#ff2026 guibg=#080808 gui=none
hi SignifySignText   ctermfg=111 ctermbg=232 cterm=none guifg=#8ac6f2 guibg=#080808 gui=none
hi SignifySignChange ctermfg=111 ctermbg=232 cterm=none guifg=#8ac6f2 guibg=#080808 gui=none



" Unset
"hi CursorIM
"hi Directory
"hi IncSearch
"hi Menu
"hi ModeMsg
"hi MoreMsg
"hi PmenuSbar
"hi PmenuThumb
"hi Question
"hi Scrollbar
"hi SignColumn
"hi SpellBad
"hi SpellCap
"hi SpellLocal
"hi SpellRare
"hi TabLine
"hi TabLineFill
"hi TabLineSel
"hi Tooltip
"hi User1
"hi User9
"hi WildMenu

" vim:set ts=4 sw=4 noet:

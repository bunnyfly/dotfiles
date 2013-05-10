" Chloe's Custom Based on wombat256

" Vim color file
" Original Maintainer:  Lars H. Nielsen (dengmao@gmail.com)
" Last Change:  2010-07-23
"
" Converting for 256-color terminals by
" Danila Bespalov (danila.bespalov@gmail.com)
" with great help of tool by Wolfgang Frisch (xororand@frexx.de)
" inspired by David Liang's version (bmdavll@gmail.com)

set background=dark

hi clear

if exists("syntax_on")
	syntax reset
endif

let colors_name = "bunnyfly"


" General colors
hi Normal		ctermfg=254		ctermbg=232		cterm=none		guifg=#f6f3e8	guibg=#080808	gui=none
hi Cursor		ctermfg=none	ctermbg=241		cterm=none		guifg=NONE		guibg=#656565	gui=none
hi Visual		ctermfg=7		ctermbg=238		cterm=none		guifg=#f6f3e8	guibg=#444444	gui=none
" hi VisualNOS
hi Search		ctermfg=231		ctermbg=125		cterm=none		guifg=#ffffff	guibg=#aa0055	gui=none
hi Folded		ctermfg=103		ctermbg=238		cterm=none		guifg=#a0a8b0	guibg=#384048	gui=none
hi Title		ctermfg=7		ctermbg=none	cterm=bold		guifg=#f6f3e8	guibg=NONE		gui=bold
hi StatusLine	ctermfg=016		ctermbg=238		cterm=bold		guifg=#000000	guibg=#444444	gui=bold
hi StatusLineNC	ctermfg=234		ctermbg=238		cterm=none		guifg=#181818	guibg=#444444	gui=none
hi VertSplit	ctermfg=236		ctermbg=236		cterm=none		guifg=#333333	guibg=#333333	gui=none
hi LineNr		ctermfg=238		ctermbg=232		cterm=none		guifg=#444444	guibg=#080808	gui=none
hi SpecialKey	ctermfg=244		ctermbg=236		cterm=none		guifg=#808080	guibg=#343434	gui=none
hi NonText		ctermfg=235		ctermbg=232		cterm=none		guifg=#222222	guibg=#080808	gui=none
hi ColorColumn					ctermbg=233										guibg=#121212

" Vim >= 7.0 specific colors
if version >= 700
hi CursorLine					ctermbg=236		cterm=none						guibg=#2d2d2d
hi MatchParen	ctermfg=7		ctermbg=243		cterm=bold		guifg=#f6f3e8	guibg=#857b6f	gui=bold
hi Pmenu		ctermfg=7		ctermbg=238						guifg=#f6f3e8	guibg=#444444
hi PmenuSel		ctermfg=0		ctermbg=192						guifg=#000000	guibg=#cae682
endif


" Syntax highlighting
hi Keyword		ctermfg=111		cterm=none		guifg=#8ac6f2	gui=none
hi Statement	ctermfg=111		cterm=none		guifg=#8ac6f2	gui=none
hi Constant		ctermfg=173		cterm=none		guifg=#e5786d	gui=none
hi Number		ctermfg=173		cterm=none		guifg=#e5786d	gui=none
hi PreProc		ctermfg=173		cterm=none		guifg=#e5786d	gui=none
hi Function		ctermfg=192		cterm=none		guifg=#cae682	gui=none
hi Identifier	ctermfg=192		cterm=none		guifg=#cae682	gui=none
hi Type			ctermfg=192		cterm=none		guifg=#cae682	gui=none
hi Special		ctermfg=194		cterm=none		guifg=#e7f6da	gui=none
hi String		ctermfg=113		cterm=none		guifg=#95e454	gui=italic
hi Comment		ctermfg=246		cterm=none		guifg=#99968b	gui=italic
hi Todo			ctermfg=245		cterm=none		guifg=#8f8f8f	gui=italic
hi Underlined	ctermfg=81						guifg=#5fd7ff


" Links
hi! link FoldColumn		Folded
hi! link CursorColumn	CursorLine

" vim:set ts=4 sw=4 noet:

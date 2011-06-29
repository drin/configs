" Vim color file
" Maintainer:	Aldrin Montana <DrinMontana@gmail.com>
" Last Change:	2011 Jun 28
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "darkdrin"

" hardcoded colors :
" GUI Comment : #80a0ff = Light blue

" GUI
highlight Normal     guifg=Green guibg=Black
highlight Search     guifg=Black guibg=LightBlue gui=bold
highlight Visual     guifg=#404040			gui=bold
highlight Cursor     guifg=White guibg=White gui=bold
highlight Special    guifg=Orange
highlight Comment    guifg=#80a0ff
highlight StatusLine guifg=blue		guibg=white
highlight Statement  guifg=Yellow			gui=NONE
highlight Type						gui=NONE

" Console
highlight Normal     ctermfg=Green ctermbg=Black
highlight Search     ctermfg=Black ctermbg=LightBlue cterm=NONE
highlight Visual		cterm=NONE
highlight Cursor     ctermfg=Red ctermbg=Yellow cterm=NONE
highlight Special    ctermfg=Magenta
highlight Comment    ctermfg=Blue
highlight StatusLine ctermfg=Blue	ctermbg=White
highlight Statement  ctermfg=Red cterm=NONE
highlight Type						cterm=NONE

" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey	ctermbg=Black	cterm=NONE	guifg=Grey80      guibg=Black	gui=NONE
    highlight Search  ctermfg=Black	ctermbg=Red	cterm=bold	guifg=Black       guibg=Red	gui=bold
    highlight Visual  ctermfg=Black	ctermbg=yellow	cterm=bold	guifg=#404040			gui=bold
    highlight Special ctermfg=LightBlue			cterm=NONE	guifg=LightBlue			gui=NONE
    highlight Comment ctermfg=Cyan			cterm=NONE	guifg=LightBlue			gui=NONE
  endif
endif


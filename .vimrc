call plug#begin()
  Plug 'zah/nim.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'morhetz/gruvbox'
call plug#end()

set relativenumber
set number

" for gruvbox
set t_Co=256 "terminal color range
try "try to set the theme as gruvbox
  colorscheme gruvbox
  let g:gruvbox_termcolors = 16 "256 colors look really bad
  set background=dark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme darkblue
endtry

" for nim
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

let g:nim_highlight_space_errors = 0


" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

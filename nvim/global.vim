let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set background=dark
set encoding=UTF-8
set hidden
set number
set relativenumber
set mouse=a
set inccommand=split
set splitbelow
set grepprg=ag\ --vimgrep
set shiftwidth=2

let g:NERDTreeFindCmd='ag --hidden --ignore .git -g'
let g:gitblame_enabled = 1
let g:blamer_delay = 500

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

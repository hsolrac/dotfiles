let mapleader = " "
set autoindent
set clipboard+=unnamedplus
set ai ma si ts=2 sw=2
set undofile
set number
set completeopt=longest,menuone
set nobackup
set nowritebackup
set encoding=utf-8

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme gruvbox

map <silent> <C-l> :NvimTreeToggle<CR>

lua << EOF
require("nvim-tree").setup {
    actions = {
        open_file = {
            quit_on_open = true,
        }
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
}
EOF

let g:NERDTreeIgnore = ['^node_modules$', 'public']

let g:coc_global_extensions = [
  \ 'coc-snippets', 
	\ 'coc-pairs', 
	\ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json',
	\	'coc-solargraph',
	\	'coc-rust-analyzer',
	\ ]


"commmand open vim config 
nmap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>

"GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Remap find files
nmap <C-p> :Files <CR>
nmap <C-s> :w!<CR>
nmap <C-q> :bd<CR>
nmap <c-f> :Rg<cr>
nmap <C-r> :vsplit<CR>
nmap <C-j> :m .+1<CR>
nmap <C-k> :m .-2<CR>
nmap <S-h> :bprev<CR>
nmap <S-l> :bnext<CR>

nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Use K to show documentation in preview window

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Use a tecla Tab para ativar o preenchimento automático
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<Tab>"

" Use Shift + Tab para navegar para trás no menu pop-up
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" --------------------------------------------------------

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

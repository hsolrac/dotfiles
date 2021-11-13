call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'APZelos/blamer.nvim'
Plug 'f-person/git-blame.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'mfussenegger/nvim-dap' 
Plug 'edluffy/hologram.nvim'
call plug#end()

colorscheme gruvbox

set hidden
set number
set relativenumber
set mouse=a
set inccommand=split

let g:gitblame_enabled = 1
let g:blamer_delay = 500


let mapleader="\<space>"
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <C-s> :w!<CR>
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>
nnoremap <C-q> :qa<CR>
nnoremap <F1> :bprevious<CR>
nnoremap <F2> :bnext<CR>
nnoremap <C-y> :tabnew<CR>
nnoremap <C-x> :term<CR>
vnoremap <C-c> "+y<CR>
nnoremap <c-z> :bd<CR>
nnoremap <C-r> :vsplit<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-a> :NERDTree<CR>
nnoremap <C-l> :NERDTreeFind<CR>





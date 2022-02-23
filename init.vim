call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'APZelos/blamer.nvim'
Plug 'edluffy/hologram.nvim'
Plug 'mfussenegger/nvim-dap' 
Plug 'f-person/git-blame.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'manasthakur/vim-commentor'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-ruby/vim-ruby'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sainnhe/sonokai'
Plug 'ryanoasis/vim-devicons'
call plug#end()

set termguicolors
lua << EOF
require("bufferline").setup{}
EOF
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'bold'
colorscheme sonokai

set encoding=UTF-8

 
set hidden
set number
set relativenumber
set mouse=a
set inccommand=split

let g:gitblame_enabled = 1
let g:blamer_delay = 500
let g:airline_theme = 'codedark'

"nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }




let mapleader="\<space>"
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <C-s> :w!<CR>
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

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>



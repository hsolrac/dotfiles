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
set fileencoding=utf-8
set foldmethod=expr         
set foldlevelstart=99
set termguicolors
set expandtab
"commmandopen vim config 
nmap<leader>cf :vsplit ~/.config/nvim/init.lua<cr>

"keymaps
nmap<leader>e :NERDTreeToggle<CR>
nmap<leader>ff :FzfLua files <CR>
nmap<C-s> :w!<CR>
nmap<C-q> :bd<CR>
nmap<C-f> :FzfLua grep<cr>
nmap<C-r> :%s/
nmap<leader>vs :vsplit<CR>
nmap<S-h> :bprev<CR>
nmap<S-l> :bnext<CR>
nmap<leader>g :FzfLua git_status<CR>
nmap<leader>hb :lua require('gitsigns').blame_line({ full = true })<CR>
nmap<leader>ht :lua require('gitsigns').toggle_current_line_blame()<CR>
nmap<leader>ra :lua require('spectre').toggle()<CR>
set updatetime=300

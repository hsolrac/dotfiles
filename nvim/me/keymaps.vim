let mapleader="\<space>"
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <C-s> :w!<CR>
nnoremap <F1> :bprevious<CR>
nnoremap <F2> :bnext<CR>
nnoremap <C-y> :tabnew<CR>
vnoremap <C-c> :%y<CR>
nnoremap <C-q> :bd<CR>
nnoremap <C-r> :vsplit<CR>

nnoremap <C-l> :NERDTreeFind<CR>

nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>st <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent> <Leader>e :NERDTreeToggle<CR>




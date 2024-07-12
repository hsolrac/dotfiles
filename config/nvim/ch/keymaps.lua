local keymap = function(tbl)
	local opts = { noremap = true, silent = true }
	local mode = tbl['mode']
	tbl['mode'] = nil
	local bufnr = tbl['bufnr']
	tbl['bufnr'] = nil

	for k, v in pairs(tbl) do
		if tonumber(k) == nil then
			opts[k] = v
		end
	end

	if bufnr ~= nil then
		vim.api.nvim_buf_set_keymap(bufnr, mode, tbl[1], tbl[2], opts)
	else
		vim.api.nvim_set_keymap(mode, tbl[1], tbl[2], opts)
	end
end

nmap = function(tbl)
	tbl['mode'] = 'n'
	keymap(tbl)
end

imap = function(tbl)
	tbl['mode'] = 'i'
	keymap(tbl)
end

nmap{"<C-s>", ":w!<CR>"}
nmap{"<C-r>", ":vsplit<CR>"}
nmap{"<C-q>", ":bd<CR>"}
nmap{"<leader>/", ":normal gcc<CR>"}
vim.api.nvim_set_keymap('n', '<leader>f', "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') })<CR>", { noremap = true, silent = true })
nmap{"<leader>a", ":e%:p:h<CR>"}

-- navigation
nmap{"L", "<cmd>bnext<cr>"}
nmap{"H", "<cmd>bprevious<cr>"}

nmap{"<leader>ev", ":vsplit ~/.config/nvim/init.lua<cr>"}
nmap{"<C-j>", ":m .-2<CR>"}
nmap{"<C-l>", ":Explore<CR>"}
nmap{"<C-k>", ":m .+1<CR>"}


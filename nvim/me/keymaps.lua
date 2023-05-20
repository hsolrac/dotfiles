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


local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then return end
treesitter.setup { ensure_installed = "all", highlight = { enable = true } }

local hop = require('hop').setup()

-- keymaps
vim.keymap.set("n", "<leader>p", "<cmd>Glow<cr>")
nmap{"<C-f>", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>"}
nmap{"<C-s>", ":w!<CR>"}
nmap{"<C-r>", ":vsplit<CR>"}
nmap{"<C-q>", ":bd<CR>"}
nmap{"<leader>dl", "<cmd>Telescope diagnostics<cr>"}
vim.api.nvim_set_keymap('n', '<leader>f', "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') })<CR>", { noremap = true, silent = true })
nmap{"<leader>a", ":e%:p:h<CR>"}

nmap{"<leader>st", "<cmd>Telescope live_grep<cr>"}
nmap{"<leader>fb", "<cmd>Telescope buffers<cr>"}
-- navigation
nmap{"L", "<cmd>bnext<cr>"}
nmap{"H", "<cmd>bprevious<cr>"}
nmap{"F", "<cmd>HopPattern<cr>"}


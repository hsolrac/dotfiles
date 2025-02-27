require("core.lazy")

vim.g.mapleader = " "
vim.opt.autoindent = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.undofile = true
vim.opt.number = true
vim.opt.completeopt = { "longest", "menuone" }
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.encoding = "utf-8"
-------------------------------------------------------------------------------
--
-- hotkeys
--
-------------------------------------------------------------------------------
vim.keymap.set("", "<C-p>", "<cmd>Files<cr>")
vim.keymap.set("", "<C-f>", "<cmd>Rg<cr>")
vim.keymap.set("", "<C-q>", "<cmd>bd<cr>")
vim.keymap.set("", "<C-l>", "<cmd>Explore<cr>")
vim.keymap.set("", "<S-l>", "<cmd>bnext<cr>")
vim.keymap.set("", "<S-h>", "<cmd>bprev<cr>")
-- search buffers
vim.keymap.set("n", "<leader>;", "<cmd>Buffers<cr>")
-- quick-save
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
vim.keymap.set("n", "<leader>o", ':e <C-R>=expand("%:p:h") . "/" <cr>')
vim.keymap.set("n", "<C-r>", ":vsplit<CR>")
vim.keymap.set("n", "<leader>ev", ":vsplit ~/.config/nvim/init.lua<CR>")
-------------------------------------------------------------------------------
--
-- autocommands
--
-------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function(ev)
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			if not vim.fn.expand("%:p"):find(".git", 1, true) then
				vim.cmd('exe "normal! g\'\\""')
			end
		end
	end,
})
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.orig", command = "set readonly" })
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.pacnew", command = "set readonly" })
vim.api.nvim_create_autocmd("InsertLeave", { pattern = "*", command = "set nopaste" })
local email = vim.api.nvim_create_augroup("email", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "/tmp/mutt*",
	group = email,
	command = "setfiletype mail",
})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = "mail",
	group = email,
	command = "setlocal formatoptions+=w",
})
local text = vim.api.nvim_create_augroup("text", { clear = true })
for _, pat in ipairs({ "text", "markdown", "mail", "gitcommit" }) do
	vim.api.nvim_create_autocmd("Filetype", {
		pattern = pat,
		group = text,
		command = "setlocal spell tw=72 colorcolumn=73",
	})
end
vim.api.nvim_create_autocmd("Filetype", {
	pattern = "tex",
	group = text,
	command = "setlocal spell tw=80 colorcolumn=81",
})

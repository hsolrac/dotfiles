vim.g.gitblame_enabled = 1
vim.g.blamer_delay = 500
vim.cmd('set guifont=monospace:h9')
vim.o.swapfile = false
-- style
vim.o.background = "dark"
vim.o.encoding = "UTF-8"
vim.o.hidden = true
vim.o.number = true
--vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.inccommand = "split"
vim.o.splitbelow = true


-- Enable true-color mode in Neovim
vim.o.termguicolors = true

-- Use 24-bit color support when outside tmux
if os.getenv("TMUX") == nil then
	if vim.fn.has("nvim") == 1 then
		-- For Neovim 0.1.3 and 0.1.4
		vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
	elseif vim.fn.has("termguicolors") == 1 then
		-- For Neovim > 0.1.5 and Vim > patch 7.4.1799
		vim.o.termguicolors = true
	end
end

-- search
vim.o.grepprg = "ag --vimgrep"
vim.o.shiftwidth = 4
vim.o.tabstop = 4

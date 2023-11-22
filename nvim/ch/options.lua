local set = vim.opt

local options = {
	ma = true,
	mouse = "a",
	cursorline = true,
	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 2,
	expandtab = true,
	autoread = true,
	nu = true,
	foldlevelstart = 99,
	scrolloff = 7,
	backup = false,
	writebackup = false,
	swapfile = false,
	clipboard = "unnamedplus",
	showmode = false,
  autoindent = true
}

for k, v in pairs(options) do
	set[k] = v
end

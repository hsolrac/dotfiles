-- UltiSnips
--
local cmd = vim.cmd

vim.g.UltiSnipsEditSplit = "vertical"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
cmd "syntax enable"
cmd "syntax on"

vim.cmd [[colorscheme gruvbox]]
vim.cmd "hi! normal ctermbg=none"

vim.g.vimspector_enable_mappings = 'HUMAN'
vim.g.mapleader = " "

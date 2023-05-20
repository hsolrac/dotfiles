package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/?.lua"

vim.cmd('colorscheme gruvbox')
require("me.globals")
require("me.keymaps")
--require("me.lualine")
require("after.plugins.telescope")
require("after.plugins.packer")
require("after.plugins.nvimtreesitter")
require("me.lsp")




package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/?.lua"

require('colorbuddy').colorscheme('gruvbox')
require("me.globals")
require("me.keymaps")
require("me.options")
-- require("me.lualine")
require("me.lsp")
require("me.airline")
-- require("after.plugins.mason")
require("after.plugins.telescope")
require("after.plugins.packer")
--require("after.plugins.nvimtreesitter")
require("bufferline").setup {}

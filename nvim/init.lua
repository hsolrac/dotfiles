package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/?.lua"

require("ch.globals")
require("ch.keymaps")
require("ch.options")
require("ch.lsp")
require("ch.airline")
require("after.plugins.fzffiles")
require("after.plugins.packer")
require("bufferline").setup {}


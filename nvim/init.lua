package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/?.lua"

require("after.plugins.packer")
require("ch.options")
require("ch.globals")
require("ch.keymaps")
require("ch.lsp")
require("ch.airline")
require("after.plugins.fzffiles")


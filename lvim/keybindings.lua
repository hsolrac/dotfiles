lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.leader = "space"
-- add your own keymapping
lvim.lsp.diagnostics.virtual_text = false
lvim.keys.normal_mode["<C-t>"] = ":ToggleTerm size=20 dir=pwd direction=horizontal<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-z>"] = ":vsplit ~/.config/lvim/config.lua<cr>"
lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["<C-a>"] = ":vsplit<cr>"
lvim.keys.normal_mode["<C-j>"] = ":m. -2<cr>"
lvim.keys.normal_mode["<C-h>"] = ":'<,'>m. +1<cr>"
lvim.keys.normal_mode["<C-y>"] = ":%y<cr>"

-- Git keywords
lvim.keys.normal_mode["dvf"] = ":DiffviewFileHistory<cr>"

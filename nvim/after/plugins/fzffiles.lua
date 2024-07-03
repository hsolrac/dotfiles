local fzf = require("fzf-lua");

fzf.setup({"telescope", 
  winopts={
    width = 0.8,
    height = 0.9,
    preview={
      layout = "flex",
    }
}})

vim.keymap.set({ "n" }, "<C-p>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<c-f>", "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true })
vim.keymap.set("n", "<c-g>", "<cmd>lua require('fzf-lua').git_branches()<CR>", { silent = true })
vim.keymap.set("n", "<c-b>", "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })

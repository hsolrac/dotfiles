local builtin = require('telescope.builtin')
local themes = require('telescope.themes')


local custom_find_files = function()
  local theme = themes.get_ivy {
    -- Customize theme options here if needed
    previewer = false, -- Desabilitar o preview apenas para find_files
  }
  builtin.find_files(theme)
end

vim.keymap.set('n', '<leader>f', custom_find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>b', builtin.buffers, {})


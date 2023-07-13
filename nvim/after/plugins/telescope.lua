local builtin = require('telescope.builtin')
local themes = require('telescope.themes')


local custom_find_files = function(fn)
  local theme = themes.get_ivy {
    previewer = false,
  }
  builtin.find_files(theme)
end

local current_dir = vim.fn.expand('%:p:h')

vim.keymap.set('n', '<leader>f', custom_find_files, {})
vim.keymap.set('n', '<C-p>', custom_find_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ 
	  search = vim.fn.input("Grep > "),  
	  file_ignore_patterns = { "public/*", "node_modules/*" },
	  cwd = current_dir
      });
end)
vim.keymap.set('n', '<leader>b', builtin.buffers, {})


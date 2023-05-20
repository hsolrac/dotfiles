-- UltiSnips
vim.g.UltiSnipsEditSplit = "vertical"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
vim.g.mapleader = " "
vim.g.gitblame_enabled = 1
vim.g.blamer_delay = 500
vim.cmd('set guifont=monospace:h12')

-- Definir o background para "dark"

-- style
vim.o.background = "dark"
vim.o.encoding = "UTF-8"
vim.o.hidden = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.inccommand = "split"
vim.o.splitbelow = true


-- Enable true-color mode in Neovim
vim.o.termguicolors = true

-- Use 24-bit color support when outside tmux
if os.getenv("TMUX") == nil then
  if vim.fn.has("nvim") == 1 then
    -- For Neovim 0.1.3 and 0.1.4
    vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
  elseif vim.fn.has("termguicolors") == 1 then
    -- For Neovim > 0.1.5 and Vim > patch 7.4.1799
    vim.o.termguicolors = true
  end
end



-- airline theme
vim.g.airline_theme = 'gruvbox'
vim.g.airline_highlighting_cache = 1
vim.g.airline_extensions_tabline_enabled = 1
vim.g.airline_extensions_tabline_buffer_nr_show = 1
vim.g.airline_extensions_tabline_left_sep = ' '
vim.g.airline_extensions_tabline_left_alt_sep = ' '
-- Configure left and right separators
vim.g.airline_left_sep = '»'
vim.g.airline_right_sep = '«'
vim.g.airline_symbols = {
  crypt = '🔒',
  linenr = '☰',
  maxlinenr = '㏑',
  branch = '⎇',
  paste = 'ρ',
  spell = 'Ꞩ',
  notexists = 'Ɇ',
  whitespace = 'Ξ',
}
-- search
vim.o.grepprg = "ag --vimgrep"
vim.o.shiftwidth = 2


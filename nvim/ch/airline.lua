-- airline theme
vim.g.airline_theme = 'onedark'
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

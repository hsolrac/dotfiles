source ./global.vim
source ./me/plugins.vim
source ./me/keymaps.vim

colorscheme gruvbox

lua << EOF
	require("bufferline").setup{}
	local nvim_lsp = require('lspconfig')

  -- Configura o servidor LSP para o Ruby (solargraph)
  nvim_lsp.solargraph.setup{}
EOF







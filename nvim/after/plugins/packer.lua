-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
  vim.cmd 'packadd packer.nvim'
  require("packer").sync()
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { "nvim-telescope/telescope.nvim", tag = '0.1.4' }
  use("vim-airline/vim-airline")
	use { 'neovim/nvim-lspconfig' }
  use { 'f-person/git-blame.nvim' }
  use { 'morhetz/gruvbox' }
  use { 'lunarvim/Onedarker.nvim' }
	use { 'joshdick/onedark.vim' }
  use { 'windwp/nvim-autopairs' }
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'ray-x/lsp_signature.nvim'
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'onsails/lspkind-nvim'
  use { 'vim-scripts/HTML-AutoCloseTag' }
  use ({
        'nvimdev/lspsaga.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require('lspsaga').setup({})
        end,
    })
  use { "ibhagwan/fzf-lua",
    requires = { "nvim-tree/nvim-web-devicons" }
  }
  use {'iamcco/markdown-preview.nvim'}
  use {'mfussenegger/nvim-jdtls'}
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  use { 'Exafunction/codeium.vim' }
end)

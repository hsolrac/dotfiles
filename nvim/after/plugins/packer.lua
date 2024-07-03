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
  use { 'wbthomason/packer.nvim' }
  use { "vim-airline/vim-airline"}
  use { 'f-person/git-blame.nvim' }
  use { 'morhetz/gruvbox' }
  use { 'lunarvim/Onedarker.nvim' }
	use { 'joshdick/onedark.vim' }
  use { "ibhagwan/fzf-lua",
    requires = { "nvim-tree/nvim-web-devicons" }
  }
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/nvim-cmp" }
  use { "puremourning/vimspector" }

  -- LSP PLUGINS
  use { 
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    }}

  use { "j-hui/fidget.nvim" }
end)

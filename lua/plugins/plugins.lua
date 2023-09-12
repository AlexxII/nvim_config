local fn = vim.fn

-- Automatically install Packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim ..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenewer you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("packer not loaded > check config files")
  return
end

-- Packer use a popup Window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install my plugins here
return packer.startup(function(use)
  use "~/main/neovim/luaPlugin"

  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
  use "kylechui/nvim-surround"

  -- Commentary
  use "tpope/vim-commentary"

  -- Colorschemes
  use "lunarvim/colorschemes"
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'tomasiser/vim-code-dark'
  use({
    'rose-pine/neovim',
    as = 'rese-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })
  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  --use "glepnir/lspsaga.nvim"

  -- Harpoon
  use 'ThePrimeagen/harpoon'

  -- Status line
  use 'nvim-lualine/lualine.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- Complition
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp"

  --snippets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  -- Vim master
  use "ThePrimeagen/vim-be-good"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

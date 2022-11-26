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
	use "wbthomason/packer.nvim"
	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"
	
	use "lunarvim/colorschemes"
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "saadparwaiz1/cmp_luasnip"
	
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

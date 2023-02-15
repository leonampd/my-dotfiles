-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use { "ellisonleao/gruvbox.nvim" }

	use({"nvim-treesitter/nvim-treesitter", {run = ':TSUpdate'}})

	use({"airblade/vim-gitgutter"})
	use({"jiangmiao/auto-pairs"})
	use({"APZelos/blamer.nvim"})
	use({"ruanyl/vim-gh-line"})

	use 'Olical/conjure'

end)  

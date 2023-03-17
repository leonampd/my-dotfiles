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

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional
            {'PaterJason/cmp-conjure'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
        }
    }

    use {
        'Olical/conjure',
        requires = {
            {'hrsh7th/nvim-cmp'},
            {'PaterJason/cmp-conjure'},
            {'m00qek/baleia.nvim'}
        }
    }
end)  

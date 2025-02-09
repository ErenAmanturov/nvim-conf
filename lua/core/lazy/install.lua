return {
  -- multi cursors
  { "maarutan/nvim-visual-multi", branch = "main" },

  -- keys find
  { "folke/which-key.nvim", event = "VeryLazy" },

  -- bufferline
  { "akinsho/bufferline.nvim" },

	--autopairs
	{ "windwp/nvim-autopairs" , config = true},

  -- comments
  { "numToStr/Comment.nvim" },

	-- themes
	{ "catppuccin/nvim" },

	-- file manager
	{ "nvim-neo-tree/neo-tree.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "MunifTanjim/nui.nvim" },

	-- telescope and its dependencies
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-lua/plenary.nvim" },

	-- treesitter
	{ "nvim-treesitter/nvim-treesitter" },

	-- tmux-navigator
	{ "christoomey/vim-tmux-navigator" },

	-- git
	{ "lewis6991/gitsigns.nvim" },
  { "kdheepak/lazygit.nvim" },

	-- file search
  { "tiagovla/scope.nvim" },

  -- dashboard
  { "nvimdev/dashboard-nvim" , event = "VimEnter"},

  -- blankline
  { "lukas-reineke/indent-blankline.nvim" },

  -- status line
  { 'nvim-lualine/lualine.nvim', },

  -- cmp
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "saadparwaiz1/cmp_luasnip" },

	-- lsp
	{ "neovim/nvim-lspconfig" },
  { "onsails/lspkind-nvim" },

  --mason
	{ "williamboman/mason.nvim" },

	-- snippets
	{ "L3MON4D3/LuaSnip" },
}

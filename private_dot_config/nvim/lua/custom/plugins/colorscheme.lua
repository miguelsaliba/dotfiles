return {
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		name = "oxocarbon",
		dependencies = { "xiyaowong/transparent.nvim" },
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawabones")
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"xiyaowong/transparent.nvim",
		opts = {
			extra_groups = {
				"GitSignsAdd",
				"GitSignsChange",
				"GitSignsDelete",
				"WinSeparator",
			},
			exclude_groups = {
				"CursorLine",
			},
		},
	},
}

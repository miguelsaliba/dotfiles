return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		keys = {
			{
				"<leader>co",
				function()
					vim.cmd("Copilot toggle")
				end,
				silent = true,
				desc = "Toggle [co]pilot",
			},
		},
		config = function()
			require("copilot").setup({
				panel = { enabled = false },
				suggestion = {
					enabled = false,
				},
			})
			-- vim.keymap.set('n', '<leader>co', vim.cmd('Copilot toggle'), { silent = true, desc = 'Toggle [co]pilot' })
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}

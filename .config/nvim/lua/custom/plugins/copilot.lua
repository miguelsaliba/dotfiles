return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		lazy = true, -- will be loading it using snacks.nvim
		build = ":Copilot auth",
		config = function()
			require("copilot").setup({
				panel = { enabled = false },
				suggestion = {
					enabled = false,
					auto_trigger = false,
				},
			})
			-- vim.keymap.set('n', '<leader>co', vim.cmd('Copilot toggle'), { silent = true, desc = 'Toggle [co]pilot' })
		end,
	},
}

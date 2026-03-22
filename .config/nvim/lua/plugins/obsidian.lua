return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    cmd = { 'Obsidian' },
    event = {
      "BufReadPre " .. vim.fn.expand "~" .. "/Documents/Obsidian/**.md",
      "BufNewFile " .. vim.fn.expand "~" .. "/Documents/Obsidian/**.md",
    },
    opts = {
      workspaces = {
        {
          name = "Obsidian",
          path = "~/Documents/Obsidian",
        },
      },
      daily_notes = {
        folder = "Daily Notes",
      },
      templates = { folder = 'templates' },
      note = { template = nil },
    },
  }
}

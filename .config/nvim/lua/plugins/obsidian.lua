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
      legacy_commands = false, -- TODO: remove at some point
      workspaces = {
        {
          name = "Obsidian",
          path = "~/Documents/Obsidian",
        },
      },
      daily_notes = {
        folder = "Daily Notes",
      },
      frontmatter = { enable = false },
      ui = { enable = false },
    },
  }
}

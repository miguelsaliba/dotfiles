return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    cmd = { 'ObsidianToday', 'ObsidianWorkspace' },
    -- ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      "BufReadPre " .. vim.fn.expand "~" .. "/Documents/Obsidian/**.md",
      "BufNewFile " .. vim.fn.expand "~" .. "/Documents/Obsidian/**.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
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
      disable_frontmatter = true,
      ui = { enable = false },
    },
  }
}

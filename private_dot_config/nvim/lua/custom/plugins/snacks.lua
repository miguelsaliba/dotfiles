---@module "snacks"
return{
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      statuscolumn = { enabled = false },
      words = { enabled = true },
      quickfile = { enabled = true },
      picker = {
        enabled = true,
        matcher = {
          frecency = true,
        },
      },
      zen = {
        win = {
          backdrop = { blend = 0, },
        },
      },
      dashboard = {
        preset = {
          header = [[
   _____                               .___
  /  _  \__  _  ____  _  _______     __| _/
 /  /_\  \ \/ \/ /\ \/ \/ /\__  \   / __ | 
/    _    \     /  \     /  / __ \_/ /_/ | 
\___/ \_  /\/\_/    \/\_/  (____  /\____ | 
        \/                      \/      \/ 
          ]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Chezmoi Config", action = ":Telescope chezmoi find_files" },
            { icon = "󰺿 ", key = "o", desc = "Obsidian Vault", action = ":cd ~/Documents/Obsidian"},
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup", padding = 2 },
          {
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>sf", function () Snacks.picker.files() end, desc="Files" },
      { "<leader>sg", function () Snacks.picker.grep() end, desc="Grep" },
      { "<leader>sh", function () Snacks.picker.help() end, desc="Help" },
      { "<leader>sr", function () Snacks.picker.resume() end, desc="Resume" },
      { "<leader>sp", function () Snacks.picker.projects() end, desc="Projects" },
      { "<leader>sj", function () Snacks.picker.jumps() end, desc="Jumps" },
      { "<leader>sk", function () Snacks.picker.keymaps() end, desc="Keymaps" },
      { "<leader>sD", function () Snacks.picker.diagnostics() end, desc="Diagnostics" },
      { "<leader>sd", function () Snacks.picker.diagnostics_buffer() end, desc="Buffer diagnostics" },
      { "<leader>sl", function () Snacks.picker.git_log_file() end, desc="Git log file" },
      { "<leader>/", function () Snacks.picker.lines() end, desc="Buffer lines" },
      { "<leader><leader>", function() Snacks.picker.buffers() end, desc="Buffers" },

      { "<leader>nn", function() Snacks.picker.notifications() end, desc = "Notification History" },
      { "<leader>nd", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      { "<leader>.", function() Snacks.scratch() end, desc ="Toggle Scratch Buffer" },
      { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
      { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
      { "<C-/>",      "<cmd>close<cr>", mode = 't', desc = "Hide Terminal", },
      { "<c-_>",      "<cmd>close<cr>", mode = 't', desc = "which_key_ignore", },
    },
    config = function(_, opts)
      require("snacks").setup(opts)
      Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
      Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
      Snacks.toggle.diagnostics():map("<leader>td")
      Snacks.toggle.line_number():map("<leader>tl")
      Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tr")
      Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>tc")
      Snacks.toggle.treesitter():map("<leader>tT")
      Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>tb")
      Snacks.toggle.inlay_hints():map("<leader>th")
      Snacks.toggle.indent():map("<leader>tg")
      Snacks.toggle.dim():map("<leader>tD")
      Snacks.toggle.zen():map("<leader>tz")

      -- Add Copilot toggle
      local copilot_exists = Util.plugin_exists("copilot.lua")
      if copilot_exists then
        Snacks.toggle({
          name = "Copilot Completion",
          color = {
            enabled = "azure",
            disabled = "orange",
          },
          get = function()
            if not vim.tbl_get(require("lazy.core.config"), "plugins", "copilot.lua", "_", "loaded") then return false end
            return not require("copilot.client").is_disabled()
          end,
          set = function(state)
            if state then
              vim.cmd("Copilot enable")
            else
              vim.cmd("Copilot disable")
            end
          end,
        }):map("<leader>co")
      end
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>qS", function() require("persistence").select() end,desc = "Select Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
}

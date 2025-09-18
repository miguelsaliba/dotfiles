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
      statuscolumn = { enabled = false },
      quickfile = { enabled = true },
      picker = {
        enabled = true,
        layout = {
          preset = 'ivy',
          layout = {
            height = 0.75,
          },
          preview = false,
        },
        formatters = {
          file = {
            truncate = 120,
          },
        },
      },
      zen = {
        win = {
          backdrop = { blend = 0, },
        },
      },
      gitbrowse = {
        url_patterns = {
          ["git.kiwicollection.net"] = {
            branch = "/tree/{branch}",
            file = "/blob/{branch}/{file}#L{line_start}-L{line_end}",
            permalink = "/blob/{commit}/{file}#L{line_start}-L{line_end}",
            commit = "/commit/{commit}",
          }
        }
      },
      dashboard = {
        preset = {
          header = '',
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Chezmoi Config", action = Util.pick_chezmoi },
            { icon = "󰺿 ", key = "o", desc = "Obsidian Vault", action = ":cd ~/Documents/Obsidian"},
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          -- { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup", padding = 2 },
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "<leader>sf", function() Snacks.picker.files() end, desc="Files" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc="Grep" },
      { "<leader>sh", function() Snacks.picker.help() end, desc="Help" },
      { "<leader>sr", function() Snacks.picker.resume() end, desc="Resume" },
      { "<leader>sp", function() Snacks.picker.projects() end, desc="Projects" },
      { "<leader>sj", function() Snacks.picker.jumps() end, desc="Jumps" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc="Keymaps" },
      { "<leader>sD", function() Snacks.picker.diagnostics() end, desc="Diagnostics" },
      { "<leader>sd", function() Snacks.picker.diagnostics_buffer() end, desc="Buffer diagnostics" },
      { "<leader>sl", function() Snacks.picker.git_log() end, desc="Git log" },
      { "<leader>sc", Util.pick_chezmoi, desc="Chezmoi Config" },
      { "<leader>sb", function () Snacks.picker.buffers() end, desc="Buffers" },
      { "<leader>sS", function () Snacks.picker.lsp_workspace_symbols() end, desc="Workspace Symbols" },
      { "<leader>ss", function () Snacks.picker.lsp_symbols() end, desc="File Symbols" },
      { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
      { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
      { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
      { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
      { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
      { "<leader><leader>", function() Snacks.picker.smart() end, desc="Smart" },
      { "<leader>/", function () Snacks.picker.lines() end, desc="Buffer lines" },

      { "<leader>gB", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
      { "<leader>gt", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
      { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
      { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
      { "<leader>gx", function() Snacks.gitbrowse.open() end, mode = { 'v', 'n' }, desc="Open file in browser" },

      { "<leader>nn", function() Snacks.picker.notifications() end, desc = "Notification History" },
      { "<leader>nd", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      { "<leader>.", function() Snacks.scratch() end, desc ="Toggle Scratch Buffer" },
      { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
      { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
      { "<c-/>",      "<cmd>close<cr>", mode = 't', desc = "Hide Terminal", },
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
      if Util.plugin_exists("copilot.lua") then
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

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesActionRename',
        callback = function (event)
          Snacks.rename.on_rename_file(event.data.from, event.data.to)
        end
      })
    end,
  },
}

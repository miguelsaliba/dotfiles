Util.now_if_args(function()
  vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

  require('snacks').setup({
    bigfile = { enabled = true },
    indent = { enabled = true },
    picker = { enabled = true },
    gitbrowse = {
      notify = false,
      open = function(url)
        vim.notify('Copied URL to clipboard: ' .. url)
        vim.fn.setreg('+', url)
      end,
    },
  })
end)

Util.later(function()
  vim.keymap.set('n', "<leader>sf", function() Snacks.picker.files() end, { desc="Files" })
  vim.keymap.set('n', "<leader>sg", function() Snacks.picker.grep() end, { desc="Grep" })
  vim.keymap.set('n', "<leader>sh", function() Snacks.picker.help() end, { desc="Help" })
  vim.keymap.set('n', "<leader>sr", function() Snacks.picker.resume() end, { desc="Resume" })
  vim.keymap.set('n', "<leader>sp", function() Snacks.picker.projects() end, { desc="Projects" })
  vim.keymap.set('n', "<leader>sj", function() Snacks.picker.jumps() end, { desc="Jumps" })
  vim.keymap.set('n', "<leader>sk", function() Snacks.picker.keymaps() end, { desc="Keymaps" })
  vim.keymap.set('n', "<leader>sD", function() Snacks.picker.diagnostics() end, { desc="Diagnostics" })
  vim.keymap.set('n', "<leader>sd", function() Snacks.picker.diagnostics_buffer() end, { desc="Buffer diagnostics" })
  vim.keymap.set('n', "<leader>sl", function() Snacks.picker.git_log() end, { desc="Git log" })
  vim.keymap.set('n', "<leader>sc", Util.pick_yadm, { desc="Yadm Config" })
  vim.keymap.set('n', "<leader>sb", function () Snacks.picker.buffers() end, { desc="Buffers" })
  vim.keymap.set('n', "<leader>sS", function () Snacks.picker.lsp_workspace_symbols() end, { desc="Workspace Symbols" })
  vim.keymap.set('n', "<leader>ss", function () Snacks.picker.lsp_symbols() end, { desc="File Symbols" })
  vim.keymap.set('n', "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })
  vim.keymap.set('n', "<leader>sM", function() Snacks.picker.marks() end, { desc = "Marks" })
  vim.keymap.set('n', "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
  vim.keymap.set('n', "<leader>sm", function() Snacks.picker.man() end, { desc = "Man Pages" })
  vim.keymap.set('n', '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" })
  vim.keymap.set('n', '<leader>s/', function() Snacks.picker.search_history() end, { desc = "Search History" })
  vim.keymap.set('n', "<leader><leader>", function() Snacks.picker.smart() end, { desc="Smart" })
  vim.keymap.set('n', "<leader>/", function () Snacks.picker.lines() end, { desc="Buffer lines" })

  vim.keymap.set('n', "<leader>gB", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
  vim.keymap.set('n', "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
  vim.keymap.set('n', "<leader>gt", function() Snacks.picker.git_status() end, { desc = "Git Status" })
  vim.keymap.set('n', "<leader>gh", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
  vim.keymap.set('n', "<leader>gl", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })

  vim.keymap.set('n', '<c-/>', function() Snacks.terminal() end, { desc = 'Toggle terminal' })
  vim.keymap.set('n', '<c-_>', function() Snacks.terminal() end)
  vim.keymap.set('t', '<c-/>', '<cmd>close<cr>', { desc = 'Hide terminal' })
  vim.keymap.set('t', '<c-_>', '<cmd>close<cr>')

  vim.keymap.set({ 'n', 'v' }, '<leader>gx', function() Snacks.gitbrowse.open() end, { desc = 'Open git file in browser' })
end)

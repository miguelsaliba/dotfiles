local now, later = Util.now, Util.later

now(function()
  vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
  vim.cmd.colorscheme('minisummer')
end)

now(function() require('mini.icons').setup() end)
now(function() require('mini.statusline').setup() end)
now(function()
  local mininotify = require('mini.notify')
  mininotify.setup()

  vim.keymap.set('n', '<leader>n', mininotify.show_history, { desc = 'Show history' })
end)

later(function() require('mini.extra').setup() end)
later(function() require('mini.surround').setup() end)
later(function() require('mini.move').setup() end)
later(function() require('mini.splitjoin').setup() end)
later(function() require('mini.pairs').setup() end)

later(function()
  local files = require('mini.files')
  files.setup({ mappings = { go_in_plus = '<CR>' } })

  vim.keymap.set('n', '<leader>e', function()
    if not files.close() then
      files.open(vim.api.nvim_buf_get_name(0), false)
      files.reveal_cwd()
    end
  end, { desc = 'Toggle mini files' })
end)

later(function()
  vim.keymap.set('n', '<leader>R', function() require('mini.sessions').restart() end, { desc = 'Restart nvim' })

  vim.keymap.set('n', '<leader>bd', function() require('mini.bufremove').delete() end)
  vim.keymap.set('n', '<leader>bD', function() require('mini.bufremove').delete(0, true) end)
end)

later(function()
  require('mini.ai').setup({
    n_lines = 1000,
    custom_textobjects = {
      B = MiniExtra.gen_ai_spec.buffer(),
    },
  })
end)

later(function()
  local minipick = require('mini.pick')
  minipick.setup({ mappings = { mark = '<C-d>' } })

  local pickbuffers = function()
    local wipeout_cur = function() vim.api.nvim_buf_delete(minipick.get_picker_matches().current.bufnr, {}) end
    local buffer_mappings = { wipeout = { char = '<C-x>', func = wipeout_cur } }
    minipick.builtin.buffers({ include_current = false }, { mappings = buffer_mappings })
  end

  vim.keymap.set('n', '<leader>sf', minipick.builtin.files, { desc = 'Pick files' })
  vim.keymap.set('n', '<leader>sb', pickbuffers, { desc = 'Pick buffers' })
  vim.keymap.set('n', '<leader>sg', minipick.builtin.grep_live, { desc = 'Pick grep' })
  vim.keymap.set('n', '<leader>sh', minipick.builtin.help, { desc = 'Pick help' })
  vim.keymap.set('n', '<leader>sr', minipick.builtin.resume, { desc = 'Pick resume' })
  vim.keymap.set('n', '<leader>so', MiniExtra.pickers.oldfiles, { desc = 'Pick oldfiles' })
  vim.keymap.set('n', '<leader>sm', MiniExtra.pickers.manpages, { desc = 'Pick man pages' })
  vim.keymap.set('n', '<leader>sd', MiniExtra.pickers.diagnostic, { desc = 'Pick diagnostics' })
  vim.keymap.set('n', '<leader>sS', function() MiniExtra.pickers.lsp({ scope = 'workspace_symbol_live' }) end, { desc = 'Pick workspace symbols' })
  vim.keymap.set('n', '<leader>ss', function() MiniExtra.pickers.lsp({ scope = 'document_symbol' }) end, { desc = 'Pick document symbols' })
  vim.keymap.set('n', '<leader>sl', MiniExtra.pickers.git_commits, { desc = 'Pick git log' })
  vim.keymap.set('n', '<leader>sc', Util.mini_pick_yadm, { desc = 'Pick config files' })

  minipick.registry.config = Util.mini_pick_yadm
end)

later(function()
  local miniclue = require('mini.clue')
  miniclue.setup({
    triggers = {
      { mode = 'n', keys = '<Leader>' },
      { mode = 'x', keys = '<Leader>' },

      { mode = 'n', keys = '[' },
      { mode = 'n', keys = ']' },

      { mode = 'i', keys = '<C-x>' },

      { mode = 'n', keys = 'g' },
      { mode = 'x', keys = 'g' },

      { mode = 'n', keys = "'" },
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },

      { mode = 'n', keys = '"' },
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },

      { mode = 'n', keys = '<C-w>' },

      { mode = 'n', keys = 'z' },
      { mode = 'x', keys = 'z' },
    },

    clues = {
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.z(),
      miniclue.gen_clues.registers({
        show_contents = true,
      }),
      miniclue.gen_clues.windows({
        submode_move = true,
        submode_resize = true,
      }),
    },
  })
end)

later(function()
  local minisnippets = require('mini.snippets')
  minisnippets.setup({
    snippets = {
      minisnippets.gen_loader.from_lang(),
    },
  })
end)

later(function ()
  MiniIcons.mock_nvim_web_devicons()
end)

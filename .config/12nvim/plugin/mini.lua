Util.now(function()
  vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

  vim.cmd.colorscheme('minisummer')
  require('mini.icons').setup()
  require('mini.statusline').setup()
  require('mini.notify').setup()
end)

Util.later(function()
  require('mini.surround').setup()
  require('mini.move').setup()
  require('mini.pick').setup()
  require('mini.extra').setup()
  require('mini.splitjoin').setup()
  require('mini.pairs').setup()
  require('mini.files').setup({
    mappings = { go_in_plus = '<CR>', },
  })
  local miniai = require('mini.ai')
  local miniclue = require('mini.clue')
  local minisnippets = require('mini.snippets')

  minisnippets.setup({
    snippets = {
      minisnippets.gen_loader.from_lang()
    }
  })

  miniai.setup({
    n_lines = 1000,
    custom_textobjects = {
      g = MiniExtra.gen_ai_spec.buffer(),
    },
  })

  vim.keymap.set('n', '<leader>e', function()
    if not MiniFiles.close() then
      MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
      MiniFiles.reveal_cwd()
    end
  end, { desc = 'Toggle mini files' })

  vim.keymap.set('n', '<leader>R', function() require('mini.sessions').restart() end, { desc = 'Restart nvim' })

  vim.keymap.set('n', '<leader>bd', function() require('mini.bufremove').delete() end)
  vim.keymap.set('n', '<leader>bD', function() require('mini.bufremove').delete(0, true) end)

  vim.keymap.set('n', '<leader>sf', MiniPick.builtin.files, { desc = 'Pick files' })
  vim.keymap.set('n', '<leader>sb', function() MiniPick.builtin.buffers({ include_current = false }) end, { desc = 'Pick buffers' })
  vim.keymap.set('n', '<leader>sg', MiniPick.builtin.grep_live, { desc = 'Pick grep' })
  vim.keymap.set('n', '<leader>sh', MiniPick.builtin.help, { desc = 'Pick help' })
  vim.keymap.set('n', '<leader>sr', MiniPick.builtin.resume, { desc = 'Pick resume' })
  vim.keymap.set('n', '<leader>so', MiniExtra.pickers.oldfiles, { desc = 'Pick oldfiles' })
  vim.keymap.set('n', '<leader>sm', MiniExtra.pickers.manpages, { desc = 'Pick man pages' })
  vim.keymap.set('n', '<leader>sd', MiniExtra.pickers.diagnostic, { desc = 'Pick diagnostics' })
  vim.keymap.set('n', '<leader>sS', function() MiniExtra.pickers.lsp({ scope = 'workspace_symbol_live' }) end, { desc = 'Pick workspace symbols' })
  vim.keymap.set('n', '<leader>ss', function() MiniExtra.pickers.lsp({ scope = 'document_symbol' }) end, { desc = 'Pick document symbols' })
  vim.keymap.set('n', '<leader>sl', MiniExtra.pickers.git_commits, { desc = 'Pick git log' })
  vim.keymap.set('n', '<leader>sc', Util.mini_pick_yadm, { desc = 'Pick config files' })

  vim.keymap.set('n', '<leader>n', MiniNotify.show_history, { desc = 'Show history' })

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

  MiniPick.registry.config = Util.mini_pick_yadm
  MiniIcons.mock_nvim_web_devicons()
end)

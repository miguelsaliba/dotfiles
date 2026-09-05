local now, later = Util.now, Util.later

now(function()
  vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
  vim.cmd.colorscheme('minisummer')
end)

now(function() require('mini.icons').setup() end)
now(function() require('mini.statusline').setup() end)
now(function()
  local statuscolumn = require('mini.statuscolumn')
  statuscolumn.setup({
    content = statuscolumn.gen_content.main({
      { format = 'fs=l', sep = '│' },
      { ltype = 'virt', lnum = '•' },
      { ltype = 'wrap', lnum = '↳', format = 'fsl=' },
      { win = 'inactive', sep = ' ' },
    }),
  })
end)

now(function()
  local mininotify = require('mini.notify')
  mininotify.setup()

  vim.keymap.set('n', '<leader>n', mininotify.show_history, { desc = 'Show history' })
end)

later(function() require('mini.extra').setup() end)
later(function() require('mini.surround').setup() end)
later(function() require('mini.move').setup() end)
later(function() require('mini.splitjoin').setup() end)
later(function() require('mini.trailspace').setup() end)
later(function() require('mini.comment').setup() end)
later(function() require('mini.indentscope').setup({ options = { try_as_border = true } }) end)

later(function()
  local files = require('mini.files')
  files.setup({ mappings = { go_in_plus = '<CR>' } })

  vim.keymap.set('n', '<leader>e', function()
    if not files.close() then files.open() end
  end, { desc = 'Toggle mini files' })

  local function get_current_file()
    local win = MiniFiles.get_explorer_state().target_window
    return vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
  end

  local set_bookmark = Util.mini_files_set_bookmark
  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesExplorerOpen',
    callback = function()
      set_bookmark('f', get_current_file, 'Current file directory')
      set_bookmark('c', '~/.config', 'Config')
      set_bookmark('n', vim.fn.stdpath('config') .. '/init.lua', 'Nvim config')
      set_bookmark('w', vim.fn.getcwd, 'Working directory')
      set_bookmark('~', '~', 'Home directory')
    end,
  })
end)

later(function()
  -- TODO: Use :restart on nvim >= 0.12.5 since that already restores the session
  vim.keymap.set('n', '<leader>R', function() require('mini.sessions').restart() end, { desc = 'Restart nvim' })
  vim.keymap.set('n', 'ZR', function() require('mini.sessions').restart() end, { desc = 'Restart nvim' })

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
      miniclue.gen_clues.registers(),
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

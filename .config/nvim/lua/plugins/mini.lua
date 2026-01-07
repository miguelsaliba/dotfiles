return {
  { -- Collection of various small independent plugins/modules
    'nvim-mini/mini.nvim',
    version = '*',
    config = function()
      require('mini.files').setup()
      require('mini.icons').setup()
      require('mini.surround').setup()
      require('mini.move').setup()
      local miniai = require('mini.ai')
      local clue = require('mini.clue')
      local statusline = require('mini.statusline')
      local bufremove = require('mini.bufremove')

      MiniIcons.mock_nvim_web_devicons()

      vim.keymap.set('n', '<leader>e', function()
        if not MiniFiles.close() then
          MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
          MiniFiles.reveal_cwd()
        end
      end, { desc = 'Toggle mini files' })

      vim.keymap.set('n', '<leader>bd', function() require('mini.bufremove').delete() end)
      vim.keymap.set('n', '<leader>bD', function() require('mini.bufremove').delete(0, true) end)

      statusline.setup({ use_icons = vim.g.have_nerd_font })

      miniai.setup({
        n_lines = 1000,
        custom_textobjects = {
          g = Util.ai_buffer,
        },
      })

      clue.setup({
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
          clue.gen_clues.builtin_completion(),
          clue.gen_clues.g(),
          clue.gen_clues.marks(),
          clue.gen_clues.z(),
          clue.gen_clues.registers({
            show_contents = true,
          }),
          clue.gen_clues.windows({
            submode_move = true,
            submode_resize = true,
          }),
        },
      })
    end,
  },
}

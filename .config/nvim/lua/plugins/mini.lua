return {
  { -- Collection of various small independent plugins/modules
    'nvim-mini/mini.nvim',
    version = '*',
    config = function()
      require('mini.files').setup()
      require('mini.pick').setup()
      require('mini.clue').setup()
      require('mini.icons').setup()
      require('mini.surround').setup()
      require('mini.move').setup()
      require('mini.git').setup()
      local miniai = require('mini.ai')
      local miniclue = require('mini.clue')
      local statusline = require('mini.statusline')

      vim.keymap.set('n', '<leader>e', function()
        if not MiniFiles.close() then
          MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
          MiniFiles.reveal_cwd()
        end
      end, { desc = 'Toggle mini files' })

      statusline.setup({ use_icons = vim.g.have_nerd_font })

      miniai.setup {
        n_lines = 1000,
        custom_textobjects = {
          g = Util.ai_buffer,
        },
      }

      vim.api.nvim_create_user_command("G", function(opts)
        vim.cmd("Git " .. opts.args)
      end, { nargs = "*" })

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

      local align_blame = function(au_data)
        if au_data.data.git_subcommand ~= 'blame' then return end

        -- Align blame output with source
        local win_src = au_data.data.win_source
        vim.wo.wrap = false
        vim.fn.winrestview({ topline = vim.fn.line('w0', win_src) })
        vim.api.nvim_win_set_cursor(0, { vim.fn.line('.', win_src), 0 })

        -- Bind both windows so that they scroll together
        vim.wo[win_src].scrollbind, vim.wo.scrollbind = true, true
      end

      local au_opts = { pattern = 'MiniGitCommandSplit', callback = align_blame }
      vim.api.nvim_create_autocmd('User', au_opts)
    end,
  },
}

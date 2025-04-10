return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require('mini.surround').setup()
      require('mini.move').setup()
      require('mini.files').setup()

      local miniai = require('mini.ai')
      local spec_treesitter = miniai.gen_spec.treesitter
      miniai.setup {
        n_lines = 1000,
        custom_textobjects = {
          F = spec_treesitter { a = '@function.outer', i = '@function.inner' },
          o = spec_treesitter {
            a = { '@block.outer', '@conditional.outer', '@loop.outer' },
            i = { '@block.inner', '@conditional.inner', '@loop.inner' },
          },
          c = spec_treesitter { a = '@comment.outer', i = '@comment.inner' },
          g = Util.ai_buffer,
        },
      }

      -- -- Simple and easy statusline.
      -- --  You could remove this setup call if you don't like it,
      -- --  and try some other statusline plugin
      -- local statusline = require 'mini.statusline'
      -- -- set use_icons to true if you have a Nerd Font
      -- statusline.setup { use_icons = vim.g.have_nerd_font }
      --
      -- -- You can configure sections in the statusline by overriding their
      -- -- default behavior. For example, here we set the section for
      -- -- cursor location to LINE:COLUMN
      -- ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return '%2l:%-2v'
      -- end

    end,

    vim.keymap.set({'n', 'v'}, '<leader>e', '<cmd>lua MiniFiles.open()<cr>', { desc = 'Mini Files' })
  },
}

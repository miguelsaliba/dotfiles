return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require('mini.surround').setup()
      require('mini.move').setup()
      local minifiles = require('mini.files').setup()

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
        },
      }
    end,

    vim.keymap.set({'n', 'v'}, '<leader>o', '<cmd>lua MiniFiles.open()<cr>', { desc = 'Mini Files' })
  },
}

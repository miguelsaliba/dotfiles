return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]parenthen
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
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

      require('mini.surround').setup()
      require('mini.move').setup()
      require('mini.files').setup()
    end,
  },
}

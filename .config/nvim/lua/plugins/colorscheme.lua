return {
  {
    'vague2k/vague.nvim',
    enabled = false,
    priority = 1000,
    config = function()
      require('vague').setup({
        italic = false,
      })
      vim.cmd.colorscheme('vague')
    end,
  },
  {
    'savq/melange-nvim',
    config = function()
      vim.cmd.colorscheme('melange')
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    enabled = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        background = { dark = 'dragon' },
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            FloatTitle = { bg = 'none' },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          }
        end,
      })
      vim.cmd.colorscheme('kanagawa')
    end,
  },
}

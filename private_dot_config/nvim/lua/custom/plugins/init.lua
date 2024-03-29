-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        component_separators = '|',
        section_separators = '',
        theme = 'auto',
      },
      sections = {
        lualine_b = {
          'diff',
          'diagnostics',
        },
        lualine_x = {
          'encoding',
          {
            'filetype',
            colored = true,
            icon_only = true,
          },
        },
        lualine_y = {},
      },
    },
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      indent = {
        char = '┊',
      },
      scope = {
        enabled = false,
      },
    },
  },
  { 'nvim-telescope/telescope-symbols.nvim' },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
  { 'cohama/lexima.vim' },
  {
    'otavioschwanck/arrow.nvim',
    opts = {
      show_icon = true,
      leader_key = '<leader>;',
    },
  }
}

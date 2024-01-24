-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'alker0/chezmoi.vim',
    lazy = false,
    init = function()
      -- This option is required.
      vim.g['chezmoi#use_tmp_buffer'] = true
      -- add other options here if needed.
    end,
  },
  {
    'xiyaowong/transparent.nvim',
    opts = {
      extra_groups = {
        'GitSignsAdd', 'GitSignsChange', 'GitSignsDelete'
      }
    }
  },
  {
    'folke/tokyonight.nvim',
    priority = 999,
  },
  {
    'rose-pine/neovim',
    priority = 998,
    name = 'rose-pine',
    -- config = function()
    --   vim.cmd.colorscheme 'rose-pine'
    --   vim.cmd('TransparentEnable')
    -- end,
    dependencies = { 'xiyaowong/transparent.nvim' },
  },
  {
    -- 'navarasu/onedark.nvim',
    -- 'Shatur/neovim-ayu',
    -- 'ellisonleao/gruvbox.nvim',
    'nyoom-engineering/oxocarbon.nvim',
    lazy = false,
    name = 'oxocarbon',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'oxocarbon'
      vim.cmd('TransparentEnable')
    end,
    dependencies = { 'xiyaowong/transparent.nvim' },
  },
  { 'nvim-telescope/telescope-symbols.nvim' },
}

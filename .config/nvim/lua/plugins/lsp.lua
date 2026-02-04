return {
  { 'williamboman/mason.nvim', opts = {} },
  { 'neovim/nvim-lspconfig' },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local ts = require('nvim-treesitter')
      ts.install({
        'lua',
        'luadoc',
        'vim',
        'vimdoc',
        'markdown',
        'markdown_inline',
        'go',
        'hyprlang',
        'html',
        'rust',
        'cpp'
      })
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { '<filetype>' },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
  {
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        lua = { 'stylua' },
        cpp = { 'clang-format' },
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'black' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      },
      formatters = {
        clang_format = {
          prepend_args = { '-style=file' },
        },
      },
    },
    log_level = vim.log.levels.ERROR,
    keys = {
      {
        '<leader>fm',
        function()
          require('conform').format({ lsp_fallback = true })
        end,
        mode = { 'n', 'v' },
        desc = 'conform format',
      },
    },
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}

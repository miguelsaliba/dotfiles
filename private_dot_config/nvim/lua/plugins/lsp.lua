return {
  { -- Autoformat
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
          require('conform').format { lsp_fallback = true }
        end,
        mode = { 'n', 'v' },
        desc = 'conform format',
      },
    },
  },
}

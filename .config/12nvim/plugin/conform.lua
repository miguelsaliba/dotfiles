Util.later(function()
  vim.pack.add({
    'https://github.com/stevearc/conform.nvim',
  })

  local conform = require('conform')

  conform.setup({
    notify_on_error = false,
    default_format_opts = {
      lsp_format = 'fallback',
    },
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
  })

  vim.keymap.set({ 'n', 'v' }, 'grm', conform.format, { desc = 'Conform format' })
end)

---@type vim.lsp.Config
return {
  ---@type lspconfig.settings.tailwindcss
  settings = {
    tailwindCSS = {
      classAttributes = {
        'class',
        'className',
        'class:list',
        'classList',
        'ngClass',
        'ui',
      },
      experimental = {
        classRegex = {
          {
            '[\'"`]([^\'"`]*)[\'"`]',
          },
        },
      },
    },
  },
}

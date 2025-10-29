return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function()
      require("lualine").setup({
        options = {
          component_separators = '|',
          section_separators = '',
          theme = 'auto',
        },
        sections = {
          lualine_x = {
            {
              function ()
                local reg = vim.fn.reg_recording()
                if reg == "" then return "" end
                return "Recording @" .. reg
              end,
            },
            { 'selectioncount' },
            { 'searchcount' },
          },
          lualine_y = {
            'encoding',
            {
              'filetype',
              colored = true,
              icon_only = true,
              -- padding = { left = 1, right = 0, }, -- Removes the extra space on the right side
            },
            {
              'lsp_status',
              icons_enabled = false,
            },
          },
          lualine_z = {
            { 'progress' },
            { 'location' },
          }
        },
      })
    end,
  },
}

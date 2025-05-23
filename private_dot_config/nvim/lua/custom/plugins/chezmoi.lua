return {
  'xvzc/chezmoi.nvim',
  lazy = true,
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("chezmoi").setup{}

    --  e.g. ~/.local/share/chezmoi/*
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = { (os.getenv("HOME") or os.getenv("HOMEPATH")) .. "/.local/share/chezmoi/*" },
      callback = function()
        vim.schedule(require("chezmoi.commands.__edit").watch)
      end,
    })

  end,
  keys = {
    {
      '<leader>sc',
      function ()
        -- telscope-config.lua
        local telescope = require("telescope")
        telescope.load_extension('chezmoi')
        telescope.extensions.chezmoi.find_files()
      end,
      desc = "[S]earch [C]hezmoi files"
    }
  }
}

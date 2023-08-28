local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- {
  --   "rust-lang/rust.vim",
  --   ft = "rust",
  --   init = function ()
  --     vim.g.rustfmt_autosave = 1
  --   end
  -- },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function (_, opts)
      local crates = require("crates")
      crates.setup(opts)
    end
  }
}
return plugins

local M = {}

M.custom = {
  n = {
    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
  }
}

return M

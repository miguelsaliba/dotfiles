vim.opt.colorcolumn = "80"
vim.opt.relativenumber = true
vim.opt.scrolloff = 8


local group = vim.api.nvim_create_augroup("CustomAutocmds", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost",
  {
    pattern = "/home/miguo/.local/share/chezmoi/*",
    -- command = "!chezmoi apply --source-path %",
    -- command = "echo 'hello'",
    callback = function ()
      vim.cmd("silent exe \"!chezmoi apply --source-path %\"")
    end,
    group = group
  })


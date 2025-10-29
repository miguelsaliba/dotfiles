return {
  {
    "xvzc/chezmoi.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("chezmoi").setup({})

      --  e.g. ~/.local/share/chezmoi/*
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
        callback = function(ev)
            local bufnr = ev.buf
            local edit_watch = function()
                require("chezmoi.commands.__edit").watch(bufnr)
            end
            vim.schedule(edit_watch)
        end,
    })
    end,
  },
  {
    "alker0/chezmoi.vim",
    init = function()
      vim.g["chezmoi#use_tmp_buffer"] = 1
      vim.g["chezmoi#source_dir_path"] = os.getenv("HOME") .. "/.local/share/chezmoi"
    end,
  },
}

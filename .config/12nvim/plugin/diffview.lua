Util.later(function()
  vim.pack.add({ 'https://github.com/dlyongemallo/diffview.nvim' })

  local function toggle_diffview(cmd)
      if next(require('diffview.lib').views) == nil then
          vim.cmd(cmd)
      else
          vim.cmd('DiffviewClose')
      end
  end

  vim.keymap.set('n', '<leader>gd', function() toggle_diffview('DiffviewOpen') end, { desc = 'Diffview open' })
  vim.keymap.set('n', '<leader>gD', function() toggle_diffview('DiffviewOpen master..HEAD') end, { desc = 'Diffview master' })
  vim.keymap.set('n', '<leader>gf', function() toggle_diffview('DiffviewFileHistory %') end, { desc = 'Diffview file history' })
end)

Util.later(function()
  vim.pack.add({
    'https://github.com/saghen/blink.lib',
    { src = 'https://github.com/saghen/blink.pairs', version = vim.version.range('*') },
  })

  -- download prebuilt binaries from github releases, must be on a versioned release
  -- yadm-git.nvim sets GIT_DIR/GIT_WORK_TREE globally, which makes blink's `git describe` look at the yadm repo
  local git_dir, git_work_tree = vim.env.GIT_DIR, vim.env.GIT_WORK_TREE
  vim.env.GIT_DIR, vim.env.GIT_WORK_TREE = nil, nil
  pcall(function() require('blink.pairs').download():pwait(60000) end)
  -- pwait() processes events, so yadm-git may have set these meanwhile (VimEnter); don't clobber them
  vim.env.GIT_DIR = vim.env.GIT_DIR or git_dir
  vim.env.GIT_WORK_TREE = vim.env.GIT_WORK_TREE or git_work_tree

  require('blink.pairs').setup()
end)

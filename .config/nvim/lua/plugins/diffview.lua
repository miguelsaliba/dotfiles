return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory', 'DiffviewLog' },
  opts = {
    view = {
      merge_tool = {
        layout = 'diff3_mixed',
      },
    },
  },
}

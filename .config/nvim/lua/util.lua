local M = {}

---@param direction "up"|"down"
function M.skip_whitespace(direction)
  local row0, col0 = unpack(vim.api.nvim_win_get_cursor(0))
  -- build a pattern: "\%{col}c\S" matches a non-space at exactly column {col}
  local pat = '\\%' .. (col0 + 1) .. 'c\\S'
  -- 'W' to avoid wrap, plus 'b' for backward if needed
  local flags = 'W' .. (direction == 'up' and 'b' or '')
  local pos = vim.fn.searchpos(pat, flags)
  if pos[1] > 0 and pos[1] ~= row0 then
    -- pos = {line, col}, but col is 1-based; our API wants 0-based
    vim.cmd("normal! m'")
    vim.api.nvim_win_set_cursor(0, { pos[1], pos[2] - 1 })
  end
end

function M.pick_yadm()
  require('snacks').picker({
    finder = 'proc',
    cmd = 'yadm',
    args = { 'list', '-a' },
    cwd = '~',
    title = 'YADM Files',
    transform = function(item, ctx)
      -- I think there is a bug in snacks, it is calling the transform function twice. This prevents that
      if item.file then return end
      item.file = '~/' .. item.text
      return require('snacks.picker.transform').unique_file(item, ctx)
    end,
  })
end

function M.mini_pick_yadm()
  MiniPick.start({
    source = {
      name = 'Yadm Files',
      show = function(buf_id, items, query, opts)
        return MiniPick.default_show(buf_id, items, query, vim.tbl_extend('force', opts or {}, { show_icons = true }))
      end,
      items = function()
        MiniPick.set_picker_items_from_cli({ 'yadm', 'list', '-a' }, {
          postprocess = function(files)
            while files[#files] == '' do
              files[#files] = nil
            end
            for i, item in ipairs(files) do
              files[i] = '~/' .. item
            end
            return files
          end,
        })
      end,
    },
  })
end

M.on_packchanged = function(plugin_name, kinds, callback, desc)
  local f = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if not (name == plugin_name and vim.tbl_contains(kinds, kind)) then return end
    if not ev.data.active then vim.cmd.packadd(plugin_name) end
    callback(ev.data)
  end
  vim.api.nvim_create_autocmd('PackChanged', { pattern = '*', callback = f, desc = desc })
end

-- https://github.com/nvim-mini/mini.nvim/issues/928#issuecomment-3399048448
M.mini_files_set_bookmark = function(id, path, desc)
  MiniFiles.set_bookmark(id, function()
    path = vim.is_callable(path) and path() or path
    if type(path) ~= 'string' then return path end
    path = vim.fs.abspath(path)
    local stat = vim.uv.fs_stat(path)
    if not stat or stat.type == 'directory' then return path end
    vim.schedule(function()
      if vim.bo.ft == 'minifiles' then
        local buf = 0
        local win = 0
        for line = 1, vim.api.nvim_buf_line_count(buf) do
          local entry = MiniFiles.get_fs_entry(buf, line)
          if entry.path == path then vim.api.nvim_win_set_cursor(win, { line, 0 }) end
        end
      end
    end)
    return vim.fs.dirname(path)
  end, { desc = desc })
end

return M

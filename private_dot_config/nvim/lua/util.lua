local M = {}

function M.ai_buffer(ai_type)
  local start_line, end_line = 1, vim.fn.line("$")
  if ai_type == "i" then
    -- Skip first and last blank lines for `i` textobject
    local first_nonblank, last_nonblank = vim.fn.nextnonblank(start_line), vim.fn.prevnonblank(end_line)
    -- Do nothing for buffer with all blanks
    if first_nonblank == 0 or last_nonblank == 0 then
      return { from = { line = start_line, col = 1 } }
    end
    start_line, end_line = first_nonblank, last_nonblank
  end

  local to_col = math.max(vim.fn.getline(end_line):len(), 1)
  return { from = { line = start_line, col = 1 }, to = { line = end_line, col = to_col } }
end

-- Checks if a plugin exists without loading it
function M.plugin_exists(name)
  local plugins = require("lazy").plugins()
  for _, plugin in ipairs(plugins) do
    if plugin.name == name then
      return true
    end
  end
  return false
end

function M.pick_chezmoi()
  local results = require("chezmoi.commands").list({
    args = {
      "--path-style",
      "absolute",
      "--include",
      "files",
      "--exclude",
      "externals",
    },
  })
  local items = {}

  for _, czFile in ipairs(results) do
    table.insert(items, {
      text = czFile,
      file = czFile,
    })
  end

  ---@type snacks.picker.Config
  local opts = {
    items = items,
    confirm = function(picker, item)
      picker:close()
      require("chezmoi.commands").edit({
        targets = { item.text },
        args = { "--watch" },
      })
    end,
  }
  Snacks.picker.pick(opts)
end

function M.skip_whitespace(direction)
  local _, col0 = unpack(vim.api.nvim_win_get_cursor(0))
  -- build a pattern: "\%{col}c\S" matches a non-space at exactly column {col}
  local pat = "\\%" .. (col0 + 1) .. "c\\S"
  -- 'W' to avoid wrap, plus 'b' for backward if needed
  local flags = "W" .. (direction == "up"  and "b" or "")
  local pos = vim.fn.searchpos(pat, flags)
  if pos[1] > 0 then
    -- pos = {line, col}, but col is 1-based; our API wants 0-based
    vim.api.nvim_win_set_cursor(0, { pos[1], pos[2] - 1 })
  end
end

return M

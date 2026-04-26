vim.keymap.set('i', '<C-BS>', '<C-W>')

vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)

vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', vim.cmd.write, { desc = 'Save File' })

vim.keymap.set('n', '<leader>pu', '<cmd>lua vim.pack.update()<CR>')

-- Copy and paste from clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+y$')
vim.keymap.set('v', '<leader>Y', '"+y')

vim.keymap.set({ 'n', 'v' }, '<leader>d', '"+d')
vim.keymap.set({ 'n', 'v' }, '<leader>D', '"+D')

vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')

-- Goto stuff
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Goto Definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Goto Declaration' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open full [D]iagnostic message' })

vim.keymap.set('n', '<leader>xd', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Quickfix list
vim.keymap.set('n', '<leader>xq', function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then vim.notify(err, vim.log.levels.ERROR) end
end, { desc = 'Quickfix List' })

vim.keymap.set({ 'n', 'v' }, '<leader>j', function() Util.skip_whitespace('down') end, { desc = 'Skips whitespace in column' })
vim.keymap.set({ 'n', 'v' }, '<leader>k', function() Util.skip_whitespace('up') end, { desc = 'Skips whitespace in column' })

-- Better indentation
vim.keymap.set('v', '<', '<gv', { desc = 'Shift left' })
vim.keymap.set('v', '>', '>gv', { desc = 'Shift right' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have coliding keymaps or are not able to send distinct keycodes
vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

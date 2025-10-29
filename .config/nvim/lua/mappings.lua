-- Ctrl backspace in insert mode
vim.keymap.set('i', '<C-BS>', '<C-W>')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)

-- Save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", vim.cmd.write, { desc = "Save File" })

-- Lazy
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Open Lazy' })

-- Yank into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+y$')
vim.keymap.set('v', '<leader>Y', '"+y')

-- Delete into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>d', '"+d')
vim.keymap.set({'n', 'v'}, '<leader>D', '"+D')

-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')

-- Goto stuff
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Goto Definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Goto Declaration' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open full [D]iagnostic message" })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>xd', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Quickfix list
vim.keymap.set("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })

vim.keymap.set({ 'n', 'v' }, '<leader>j', function() Util.skip_whitespace('down') end, { desc = 'Skips whitespace in column' })
vim.keymap.set({ 'n', 'v' }, '<leader>k', function() Util.skip_whitespace('up') end, { desc = 'Skips whitespace in column' })

-- Quickfix navigation
vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- Buffer navigation
vim.keymap.set("n", "[b", vim.cmd.bprev, { desc = "Previous Buffer" })
vim.keymap.set("n", "]b", vim.cmd.bnext, { desc = "Next Buffer" })

-- Tab navigation
vim.keymap.set("n", "[t", vim.cmd.tabprevious, { desc = "Previous Tab" })
vim.keymap.set("n", "]t", vim.cmd.tabnext, { desc = "Next Tab" })

-- Better indentation
vim.keymap.set("v", "<", "<gv", { desc = "Shift left" })
vim.keymap.set("v", ">", ">gv", { desc = "Shift right" })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have coliding keymaps or are not able to send distinct keycodes
vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })


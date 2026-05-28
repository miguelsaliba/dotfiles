Util.later(function()
  Util.on_packchanged('nvim-treesitter', { 'update' }, function() vim.cmd('TSUpdate') end, 'TSUpdate')

  vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', branch = 'main' },
  })

  local languages = {
    'lua',
    'vimdoc',
    'markdown',
    'markdown_inline',
    'html',
    'css',
    'javascript',
    'typescript',
    'tsx',
    'vue',
    'regex',
    'json',
    'c',
    'cpp',
    'go',
    'gomod',
    'rust',
    'gdscript',
    'bash',
    'zsh',
    'git_config',
    'gitignore',
    'ssh_config',
    'kdl',
    'yaml',
    'toml',
    'make',
  }

  require('nvim-treesitter').install(languages)

  -- Enable tree-sitter after opening a file for a target language
  local filetypes = {}
  for _, lang in ipairs(languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  vim.api.nvim_create_autocmd('FileType', { pattern = filetypes, callback = ts_start, desc = 'Start tree-sitter' })
end)

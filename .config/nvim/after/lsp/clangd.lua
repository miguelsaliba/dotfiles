return {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--clang-tidy-checks=*',
    '--offset-encoding=utf-16',
  },
}

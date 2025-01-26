return {
  'adalessa/laravel.nvim',
  dependencies = {
    'tpope/vim-dotenv',
    'nvim-telescope/telescope.nvim',
    'MunifTanjim/nui.nvim',
    'kevinhwang91/promise-async',
  },
  cmd = { 'Laravel' },
  keys = {
    { '<leader>la', ':Laravel artisan<cr>', desc = 'Laravel artisan commands' },
    { '<leader>lr', ':Laravel routes<cr>', desc = 'Laravel routes' },
    { '<leader>lm', ':Laravel related<cr>', desc = 'Laravel related files' },
    { '<leader>ll', ':Laravel<cr>', desc = 'Run any laravel command' },
  },
  event = { 'VeryLazy' },
  opts = {
    lsp_server = 'intelephense',
  },
  config = true,
}

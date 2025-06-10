return {
  'adalessa/laravel.nvim',
  -- enabled = false,
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
  opts = function()
    local opts = require('laravel.options.default')
    local environments = opts.environments
    local definitions = environments.definitions

    environments.default = 'valet'
    environments.auto_discover = false

    table.insert(definitions, {
      name = "valet",
      condition = {
        executable = { "valet" },
      },
      commands = {
        valet = { "valet" },
        {
          commands = { "php", "composer" },
          prefix = { "valet" },
        },
      },
    })

    return opts
  end,
  config = true,
}

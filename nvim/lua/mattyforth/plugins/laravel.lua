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
    -- TODO: Figure out how we can use this gf for php files, and blade-nav for blade files
    {
      '<leader>lgf',
      function()
        if require('laravel').app('gf').cursor_on_resource() then
          return '<cmd>Laravel gf<CR>'
        else
          return 'gf'
        end
      end,
      noremap = false,
      expr = true,
      desc = 'Goto file',
    },
  },
  event = { 'VeryLazy' },
  opts = function()
    local opts = require 'laravel.options.default'
    local environments = opts.environments
    local definitions = environments.definitions

    environments.default = 'valet'
    environments.auto_discover = false

    table.insert(definitions, {
      name = 'valet',
      condition = {
        executable = { 'valet' },
      },
      commands = {
        valet = { 'valet' },
        {
          commands = { 'php', 'composer' },
          prefix = { 'valet' },
        },
      },
    })

    return opts
  end,
  config = true,
}

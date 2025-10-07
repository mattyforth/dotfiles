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
    {
      '<leader>la',
      function()
        Laravel.pickers.artisan()
      end,
      desc = 'Laravel artisan commands',
    },
    {
      '<leader>lr',
      function()
        Laravel.pickers.routes()
      end,
      desc = 'Laravel routes',
    },
    {
      '<leader>lm',
      function()
        Laravel.pickers.commands.run 'actions'
      end,
      desc = 'Laravel related files',
    },
    {
      '<leader>ll',
      function()
        Laravel.pickers.laravel()
      end,
      desc = 'Laravel: Open Laravel Picker',
    },
    -- TODO: Figure out how we can use this gf for php files, and blade-nav for blade files
    {
      'gf',
      function()
        local ok, res = pcall(function()
          if Laravel.app('gf').cursorOnResource() then
            return "<cmd>lua Laravel.commands.run('gf')<cr>"
          end
        end)
        if not ok or not res then
          return 'gf'
        end
        return res
      end,
      expr = true,
      noremap = true,
    },
  },
  event = { 'VeryLazy' },
  opts = function()
    local opts = require 'laravel.options.default'
    opts.lsp_server = 'intelephense'

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

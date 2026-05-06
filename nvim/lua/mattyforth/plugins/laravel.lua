return {
  'adalessa/laravel.nvim',
  -- dir = '~/Code/laravel.nvim',
  enabled = true,
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-neotest/nvim-nio',
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
  ft = { 'blade', 'php' },
  event = {
    'BufEnter composer.json',
  },
  opts = {
    environments = {
      default = 'valet',
    },
    lsp_server = 'intelephense',
    features = {
      pickers = {
        provider = 'snacks'
      }
    }
  },
  config = true,
}

return {
  'ricardoramirezr/blade-nav.nvim',
  enabled = true,
  requires = {
    'hrsh7th/nvim-cmp', -- if using nvim-cmp
  },
  ft = { 'blade', 'php' },
  config = function()
    require('blade-nav').setup {
      cmp_close_tag = false, -- default: true
    }
  end,
}

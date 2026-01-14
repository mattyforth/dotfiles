return {
  'ricardoramirezr/blade-nav.nvim',
  enabled = false,
  requires = {
    'hrsh7th/nvim-cmp', -- if using nvim-cmp
  },
  ft = { 'blade' },
  config = function()
    require('blade-nav').setup {
      cmp_close_tag = false, -- default: true
    }
  end,
}

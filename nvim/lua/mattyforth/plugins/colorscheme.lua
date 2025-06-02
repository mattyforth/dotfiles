return {
  'catppuccin/nvim',
  name = 'catpuccin',
  priority = 1000,
  init = function()
    require('catppuccin').setup {
      flavour = 'auto',

      background = {
        dark = 'mocha',
        light = 'latte',
      },
    }

    vim.cmd.colorscheme 'catppuccin'
  end,
}

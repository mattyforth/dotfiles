return {
  {
    'catppuccin/nvim',
    name = 'catpuccin',
    enabled = false,
    priority = 1000,
    init = function()
      require('catppuccin').setup {
        flavour = 'auto',

        background = {
          dark = 'frappe',
          light = 'latte',
        },
      }

      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'sainnhe/sonokai',
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      -- vim.g.sonokai_enable_italic = true
      -- vim.cmd.colorscheme 'sonokai'
    end,
  },
  {
    'tanvirtin/monokai.nvim',
    lazy = false,
    enabled = false,
    config = function()
      require('monokai').setup{
        palette = require('monokai').pro
      }
    end
  },
  {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = 'light'

      require("monokai-nightasty").load({})

      vim.keymap.set('n', '<leader>vc', ':MonokaiToggleLight<CR>', {desc = "[V]iew [c]hange colorscheme"})
    end
  }
}

return {
  {
    enabled = true,
    'windwp/nvim-ts-autotag',
    config = function()
      local autotag = require 'nvim-ts-autotag'

      autotag.setup {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = true, -- Auto close on trailing </
        },
      }
    end,
  },
  {
    enabled = false,
    'tronikelis/ts-autotag.nvim',
    opts = {
      auto_rename = {
        enabled = true,
      },
      auto_close = {
        enabled = true,
      },
      filetypes = {
        'typescript',
        'javascript',
        'typescriptreact',
        'javascriptreact',
        'xml',
        'html',
        'templ',
        'blade',
        'php',
      },
    },
  },
}

require 'mattyforth.utils.globals'

-- [[ Basic options ]]
require 'mattyforth.options'

-- [[ Basic keymaps ]]
require 'mattyforth/keymap'

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
require 'mattyforth/autocmd'

require 'mattyforth/health'

require('lazy').setup({

  { import = 'mattyforth.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    -- TODO: Think of some better binds here, the default ones conflict with tmux navigator

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<leader>hs', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<leader>hh', function()
      harpoon:list():select(1)
    end, { noremap = true })
    vim.keymap.set('n', '<leader>hj', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<leader>hk', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<leader>hl', function()
      harpoon:list():select(4)
    end)
  end,
}

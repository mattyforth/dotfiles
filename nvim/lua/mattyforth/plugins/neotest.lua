return {
  'nvim-neotest/neotest',
  enabled = false,
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'V13Axel/neotest-pest',
    'olimorris/neotest-phpunit',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-pest' {
          ignore_dirs = { 'node_modules', 'vendor' },
          compact = false,
        },
        require 'neotest-phpunit',
      },
      output = {
        enabled = true,
        open_on_run = 'long',
      },
    }

    -- Test keymaps
    -- TODO: Add keymaps to open the last test run, if we are not in a test file
    -- add telescope test finder to allow us to run any test from anywhere
    -- fix 'no test output file' when running all tests
    local neotest = require 'neotest'

    vim.keymap.set('n', '<leader>tn', function()
      neotest.run.run()
    end, { desc = '[T]est [N]earest' })

    vim.keymap.set('n', '<leader>tt', function()
      neotest.run.run(vim.fn.expand '%')
    end, { desc = 'Test whole file' })

    vim.keymap.set('n', '<leader>to', function()
      neotest.output.open {}
    end, { desc = '[T]est [o]utput' })

    vim.keymap.set('n', '<leader>tr', function()
      neotest.run.run_last {}
    end, { desc = '[T]est [r]erun' })

    vim.keymap.set('n', '<leader>tl', function()
      neotest.output.open { last_run = true }
    end, { desc = '[T]est output [l]ast' })

    vim.keymap.set('n', '<leader>tO', function()
      neotest.output_panel.toggle()
    end, { desc = '[T]est [O]utput panel' })

    vim.keymap.set('n', '<leader>ta', function()
      neotest.run.run { suite = true }
    end, { desc = 'Run all tests' })

    vim.keymap.set('n', '<leader>ts', function()
      neotest.summary.toggle {}
    end, { desc = 'Show test summary' })
  end,
}

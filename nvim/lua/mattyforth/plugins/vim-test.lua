return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux'
  },
  keys = {
    {'<leader>tn', ':TestNearest<CR>', desc = 'Test neartest'},
    { '<leader>tt', ':TestFile<CR>', desc = 'Test file' },
    { '<leader>ta', ':TestSuite<CR>', desc = 'Test suite' },
    { '<leader>tr', ':TestLast<CR>', desc = 'Test last run test' },
    { '<leader>tv', ':TestVisit<CR>', desc = 'Visit the last run test file' },
  },
  config = function()
    vim.cmd('let test#strategy = "vimux"')

    -- Run php tests using valet
    vim.cmd("let test#php#phpunit#executable = 'valet php ./vendor/bin/phpunit'")
    vim.cmd("let test#php#pest#executable = 'valet php ./vendor/bin/pest'")
  end
}

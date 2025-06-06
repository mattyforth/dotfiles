vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Test keymaps
-- TODO: Add keymaps to open the last test run, if we are not in a test file
-- add keymap to run the last run test
-- add telescope test finder to allow us to run any test from anywhere
-- fix 'no test output file' when running all tests

-- vim.keymap.set('n', '<leader>tn', function()
--   require('neotest').run.run()
-- end, { desc = '[T]est [N]earest' })
-- vim.keymap.set('n', '<leader>tt', function()
--   require('neotest').run.run(vim.fn.expand '%')
-- end, { desc = 'Test whole file' })
-- vim.keymap.set('n', '<leader>to', function()
--   require('neotest').output.open()
-- end, { desc = '[T]est [Overview]' })
-- vim.keymap.set('n', '<leader>ta', function()
--   require('neotest').run.run { suite = true }
-- end, { desc = 'Run all tests' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Window splitting / panes
vim.keymap.set('n', '<leader>wq', '<C-w>q', {desc = "Close current window"});
vim.keymap.set('n', '<leader>wv', '<C-w>v', {desc = "Split window vertically"});
vim.keymap.set('n', '<leader>ws', '<C-w>s', {desc = "from_monthSplit window horizontally"});
vim.keymap.set('n', '<leader>wu', '<C-w>o', {desc = "Unsplit windows"});
vim.keymap.set('n', '<leader>wm', '<C-w>x', {desc = "Move window to next pane"});

-- Disable the command line thing that I always seem to open when typing :q the wrong way round
vim.keymap.set('n', 'q:', ':q<CR>')

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

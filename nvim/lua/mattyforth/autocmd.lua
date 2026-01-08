-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: I don't think the below is needed, filetype is set without this.
-- Set blade files filetype
local bladeGrp
vim.api.nvim_create_augroup('BladeFiltypeRelated', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.blade.php',
  group = bladeGrp,
  callback = function()
    vim.opt.filetype = 'blade'
  end,
})

vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})
vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

-- Harpoon tabline integration
-- function Harpoon_files()
--   local contents = {}
--   local harpoon = require 'harpoon'
--   local marks_length = harpoon:list():length()
--   local current_file_path = vim.fn.fnamemodify(vim.fn.expand '%:p', ':.')
--   for index = 1, marks_length do
--     local harpoon_file_path = harpoon:list():get(index).value
--     local file_name = harpoon_file_path == '' and '(empty)' or vim.fn.fnamemodify(harpoon_file_path, ':t')
--
--     if current_file_path == harpoon_file_path then
--       contents[index] = string.format('%%#HarpoonNumberActive# %s. %%#HarpoonActive#%s ', index, file_name)
--     else
--       contents[index] = string.format('%%#HarpoonNumberInactive# %s. %%#HarpoonInactive#%s ', index, file_name)
--     end
--   end
--
--   return table.concat(contents)
-- end
--
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'User' }, {
--   callback = function(ev)
--     vim.o.tabline = Harpoon_files()
--   end,
-- })

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.opt.breakindent = true -- Maintain indent when wrapping indented lines
vim.opt.smartindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Factor in case when the search contains a capital letter
vim.opt.signcolumn = 'yes' -- Show the gutter to the left of the line numbers
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300 -- Displays which-key popup sooner
vim.opt.inccommand = 'split' -- Preview substitutions live,as you type!
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = 'a'
vim.opt.mousemoveevent = true -- Allow hovering
vim.opt.showmode = false
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.autoread = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  keys = {
    { 'gj', function() require('treesj').join() end, desc = "Join keys"},
    { 'gs', function() require('treesj').split() end , desc = "Split keys"},
  },
  opts = {
    use_default_keymaps = false,
  },
}

return {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  opts = {
    pre_hook = function ()
      require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
    end
  },
  config = function(opts)
    require('ts_context_commentstring').setup {
      enable_autocmd = false,
    }

    require('Comment').setup(opts)

    local ft = require("Comment.ft")

    ft.set("blade", {"{{-- %s --}}"})
  end,
}

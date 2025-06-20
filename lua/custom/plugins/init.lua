-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'akinsho/bufferline.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    keys = {
      { '<s-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Cycle to Previous Buffer' },
      { '<s-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Cycle to Next Buffer' },
    },
    opts = {},
  },

  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
    end,
  },
}

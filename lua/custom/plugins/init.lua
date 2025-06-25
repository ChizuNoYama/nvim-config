-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    keys = {
      {
        '<leader>e',
        function()
          Snacks.explorer()
        end,
        desc = 'File Explorer',
      },
      {
        '<C-/>',
        function()
          Snacks.terminal()
        end,
        desc = 'Open the Terminal',
      },
    },
    opts = {
      picker = {
        enabled = true,
      },
      dashboard = { enabled = true },
      terminal = { enabled = true },
    },
  },
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    requires = 'nvim-tree/nvim-web-devicons',
    keys = {
      { '<s-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Cycle to Previous Buffer' },
      { '<s-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Cycle to Next Buffer' },
      { '<leader>bd', '<cmd>bd<cr>', desc = 'Delete current Buffer' },
    },
    opts = {
      options = {
        show_buffer_icons = true,
        separator_style = 'slant',
      },
    },
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
}

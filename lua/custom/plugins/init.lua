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
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'dracula',
      },
    },
  },

  -- {
  --   'mfussenegger/nvim-dap',
  --   dependencies = {
  --     'rcarriga/nvim-dap-ui',
  --     'theHamsta/nvim-dap-virtual-text',
  --     'nvim-neotest/nvim-nio',
  --   },
  --   config = function()
  --     local dap = require 'dap'
  --     local dapui = require 'dapui'
  --     local mason_registry = require 'mason-registry'
  --
  --     -- Setup dap-ui
  --     dapui.setup()
  --
  --     -- Auto open/close UI
  --     dap.listeners.after.event_initialized['dapui_config'] = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated['dapui_config'] = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited['dapui_config'] = function()
  --       dapui.close()
  --     end
  --     -- Get netcoredbg path from Mason
  --     local netcoredbg = mason_registry.get_package 'netcoredbg'
  --     local debugger_path = netcoredbg:get_install_path '/netcoredbg'
  --
  --     dap.adapters.coreclr = {
  --       type = 'executable',
  --       command = debugger_path,
  --       args = { '--interpreter=vscode' },
  --     }
  --
  --     dap.configurations.cs = {
  --       {
  --         type = 'coreclr',
  --         name = 'Launch - netcoredbg',
  --         request = 'launch',
  --         program = function()
  --           return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net9.0/Viddy.dll', 'file')
  --         end,
  --       },
  --     }
  --   end,
  -- },
}

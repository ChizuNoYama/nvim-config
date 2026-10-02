-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = {
      function()
        require('lualine').setup()
      end,
    },
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
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
    },
    opts = {
      picker = { enabled = true },
      dashboard = { enabled = true },
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
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },

  {
    'mfussenegger/nvim-dap',
    dependencies = { 'rcarriga/nvim-dap-ui', 'nvim-neotest/nvim-nio' },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      dap.adapters.dart = {
        type = 'executable',
        command = 'dart',
        args = { 'debug_adapter' },
      }
      dap.adapters.flutter = {
        type = 'executable',
        command = 'flutter',
        args = { 'debug_adapter' },
      }

      dap.configurations.dart = {
        -- {
        --   type = 'dart',
        --   request = 'launch',
        --   name = 'Launch dart',
        --   dartSdkPath = '/opt/homebrew/share/flutter/bin/cache/dart-sdk/bin/dart',
        --   flutterSdkPath = '/opt/homebrew/share/flutter/bin/flutter',
        --   program = '${workspaceFolder}/lib/main.dart',
        --   cwd = '${workspaceFolder}',
        -- },
        {
          type = 'flutter',
          request = 'launch',
          name = 'Launch flutter',
          dartSdkPath = '/opt/homebrew/share/flutter/bin/cache/dart-sdk/bin/dart',
          flutterSdkPath = '/opt/homebrew/share/flutter/bin/flutter',
          program = '${workspaceFolder}/lib/main.dart',
          cwd = '${workspaceFolder}',
        },
      }

      vim.keymap.set('n', '<leader>Db', function()
        dap.toggle_breakpoint()
      end, { desc = 'DAP: Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>Dc', function()
        dap.continue()
      end, { desc = 'DAP: Continue' })
      vim.keymap.set('n', '<leader>Do', function()
        dap.step_over()
      end, { desc = 'DAP: Step Over' })
      vim.keymap.set('n', '<leader>Di', function()
        dap.step_into()
      end, { desc = 'DAP: Step Into' })
      vim.keymap.set('n', '<leader>Dt', function()
        dap.terminate()
      end, { desc = 'DAP: Terminate' })
      vim.keymap.set('n', '<leader>Dr', function()
        local session = dap.session()
        if session then
          session:request 'hotReload'
        else
          print 'No active DAP session'
        end
      end, { desc = 'DAP: Hot Reload' })
    end,
  },
}

return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    opts = {
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        enabled = true,
        prefix = "// ",
        highlight = "Comment",
      },
      debugger = {
        enabled = false,
        evaluate_to_string_in_debug_views = true,
      },
    },
    keys = {
      { "<leader>Fa", "<cmd>FlutterRun<CR>", desc = "Flutter Run" },
      {
        "<leader>Fb",
        function()
          local ft_config = require("flutter-tools.config")
          local dap = require("dap")

          -- Suppress dev_log (dapui console already shows output)
          ft_config.dev_log.enabled = false

          -- Restore dev_log when DAP session ends
          local key = "flutter_devlog_restore"
          local function restore()
            ft_config.dev_log.enabled = true
            dap.listeners.before.event_terminated[key] = nil
            dap.listeners.before.event_exited[key] = nil
          end
          dap.listeners.before.event_terminated[key] = restore
          dap.listeners.before.event_exited[key] = restore

          vim.cmd("FlutterDebug")
        end,
        desc = "Flutter Debug (DAP)",
      },
      { "<leader>FR", "<cmd>FlutterRestart<CR>", desc = "Flutter Restart" },
      { "<leader>Fq", "<cmd>FlutterQuit<CR>", desc = "Flutter Quit" },
      { "<leader>FD", "<cmd>FlutterVisualDebug<CR>", desc = "Flutter Visual Debug" },
      { "<leader>Fo", "<cmd>FlutterOutlineToggle<CR>", desc = "Flutter Outline" },
      { "<leader>Fd", "<cmd>FlutterDevTools<CR>", desc = "Flutter DevTools" },
    },
  },
}

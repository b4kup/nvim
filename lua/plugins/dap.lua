return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      -- Flutter/Dart adapter is configured by flutter-tools.nvim
      -- when debugger.enabled = true. This file ensures dap.core
      -- extra is complemented with the right settings.
      dap.configurations.dart = dap.configurations.dart or {}
    end,
  },
}

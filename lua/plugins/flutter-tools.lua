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
        enabled = true,
        evaluate_to_string_in_debug_views = true,
      },
    },
    keys = {
      { "<leader>Fa", "<cmd>FlutterRun<CR>", desc = "Flutter Run" },
      { "<leader>FR", "<cmd>FlutterRestart<CR>", desc = "Flutter Restart" },
      { "<leader>Fq", "<cmd>FlutterQuit<CR>", desc = "Flutter Quit" },
      { "<leader>FD", "<cmd>FlutterVisualDebug<CR>", desc = "Flutter Visual Debug" },
      { "<leader>Fo", "<cmd>FlutterOutlineToggle<CR>", desc = "Flutter Outline" },
      { "<leader>Fd", "<cmd>FlutterDevTools<CR>", desc = "Flutter DevTools" },
    },
  },
}

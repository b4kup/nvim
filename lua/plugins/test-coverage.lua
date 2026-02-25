return {
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Coverage", "CoverageLoad", "CoverageSummary", "CoverageToggle" },
    opts = {
      commands = true,
      lang = {
        dart = {
          coverage_file = "coverage/lcov.info",
        },
      },
    },
    keys = {
      { "<leader>tC", "<cmd>CoverageLoad<CR>", desc = "Load Coverage" },
      { "<leader>tR", "<cmd>CoverageSummary<CR>", desc = "Coverage Summary" },
      { "<leader>tv", "<cmd>CoverageToggle<CR>", desc = "Toggle Coverage Overlay" },
    },
  },
}

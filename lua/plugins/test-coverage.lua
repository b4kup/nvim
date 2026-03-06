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
      {
        "<leader>tG",
        function()
          vim.fn.jobstart("fvm flutter test --coverage", {
            on_exit = function(_, code)
              if code == 0 then
                vim.schedule(function()
                  vim.cmd("CoverageLoad")
                  vim.notify("Coverage loaded", vim.log.levels.INFO)
                end)
              else
                vim.schedule(function()
                  vim.notify("Tests failed (exit " .. code .. ")", vim.log.levels.ERROR)
                end)
              end
            end,
          })
          vim.notify("Running tests with coverage...", vim.log.levels.INFO)
        end,
        desc = "Run Tests with Coverage",
      },
    },
  },
}

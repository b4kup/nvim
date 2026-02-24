return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true,
        sources = {
          files = {
            hidden = true,
          },
          grep = {
            hidden = true,
          },
        },
      },
    },
    keys = {
      {
        "<leader>ft",
        function()
          -- Two side-by-side terminals in bottom pane
          Snacks.terminal.toggle(nil, { count = 1 })
          Snacks.terminal.toggle(nil, { count = 2 })
        end,
        desc = "Two terminals (bottom)",
      },
    },
  },
}

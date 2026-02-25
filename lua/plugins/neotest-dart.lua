return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "sidlatau/neotest-dart",
      "nvim-neotest/nvim-nio",
    },
    opts = {
      running = {
        concurrent = false,
      },
      adapters = {
        ["neotest-dart"] = {
          command = "fvm flutter",
        },
      },
    },
  },
}

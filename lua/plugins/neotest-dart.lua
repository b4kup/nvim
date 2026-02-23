return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "sidlatau/neotest-dart",
      "nvim-neotest/nvim-nio",
    },
    opts = {
      adapters = {
        ["neotest-dart"] = {
          command = "fvm flutter",
        },
      },
    },
  },
}

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
      discovery = {
        filter_dir = function(name)
          return name ~= "patrol_test"
        end,
      },
      adapters = {
        ["neotest-dart"] = {
          command = "fvm flutter",
        },
      },
    },
  },
}

return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function(_, opts)
      require("flutter-tools").setup(opts)

      local color_map = {
        [30] = "Comment",
        [31] = "DiagnosticError",
        [32] = "DiagnosticOk",
        [33] = "DiagnosticWarn",
        [34] = "DiagnosticInfo",
        [35] = "Special",
        [36] = "DiagnosticHint",
        [37] = "Normal",
      }
      local ns = vim.api.nvim_create_namespace("flutter_log_colors")
      local log = require("flutter-tools.log")
      local original_log = log.log

      log.log = function(data)
        -- Parse ANSI color segments
        local segments = {}
        local current_hl = nil
        local pos = 1
        while true do
          local s, e, codes = data:find("\027%[([%d;]*)m", pos)
          if not s then
            if pos <= #data then
              table.insert(segments, { text = data:sub(pos), hl = current_hl })
            end
            break
          end
          if s > pos then
            table.insert(segments, { text = data:sub(pos, s - 1), hl = current_hl })
          end
          local last_code = tonumber(codes:match("(%d+)$"))
          if last_code == 0 or codes == "" then
            current_hl = nil
          elseif color_map[last_code] then
            current_hl = color_map[last_code]
          end
          pos = e + 1
        end

        -- Build clean text (no ANSI codes) and write via original log
        local clean = table.concat(vim.tbl_map(function(seg)
          return seg.text
        end, segments))
        original_log(clean)

        -- Apply highlights via extmarks (works on nomodifiable buffers)
        if log.buf and vim.api.nvim_buf_is_valid(log.buf) then
          local line = vim.api.nvim_buf_line_count(log.buf) - 1
          local col = 0
          for _, seg in ipairs(segments) do
            if seg.hl and #seg.text > 0 then
              pcall(vim.api.nvim_buf_set_extmark, log.buf, ns, line, col, {
                end_col = col + #seg.text,
                hl_group = seg.hl,
              })
            end
            col = col + #seg.text
          end
        end
      end
    end,
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
      { "<leader>Ft", "<cmd>FlutterLogToggle<CR>", desc = "Flutter Log Toggle" },
    },
  },
}

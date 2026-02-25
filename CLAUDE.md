# Neovim Configuration

This is a Neovim configuration built on **LazyVim** (v8), managed with **lazy.nvim** as the plugin manager.

## Structure

```
init.lua                  -- Entry point, loads config.lazy
lua/config/
  lazy.lua                -- lazy.nvim bootstrap and plugin setup
  options.lua             -- Custom vim options (shell, exrc)
  keymaps.lua             -- Custom keymaps (<Esc> save, <leader>sn snippet edit)
  autocmds.lua            -- Custom autocmds (currently empty, uses LazyVim defaults)
lua/plugins/
  neo-tree.lua            -- Neo-tree overrides (show hidden/dotfiles/gitignored)
  snacks.lua              -- Snacks picker & terminal overrides
  flutter-tools.lua       -- Flutter-tools with keymaps, widget guides, debugger
  claudecode.lua          -- Claude Code Neovim integration
  neotest-dart.lua        -- Neotest with Dart adapter (uses fvm flutter)
  dap.lua                 -- DAP debugger (Flutter adapter via flutter-tools)
  test-coverage.lua       -- Test coverage overlay (LCOV/flutter)
  reactive.lua            -- Mode-aware cursor styling
  example.lua             -- LazyVim example spec (disabled, returns {} early)
ftplugin/
  dart.lua                -- 2-space indent for Dart
  json.lua                -- 2-space indent + fold by indent for JSON
snippets/
  dart.json               -- Custom Dart snippets
```

## LazyVim Extras Enabled

Configured in `lazyvim.json`:

- `ai.claudecode` -- Claude Code integration
- `ai.copilot` -- GitHub Copilot
- `dap.core` -- DAP debugger UI, keymaps, virtual text
- `lang.dart` -- Dart/Flutter language support
- `lang.json` -- JSON language support
- `lang.markdown` -- Markdown support
- `util.dot` -- Dotfile editing support
- `test.core` -- Neotest testing framework
- `util.mini-hipatterns` -- Mini highlight patterns

## Key Customizations

- **Neo-tree**: Shows hidden files, dotfiles, and gitignored files
- **Snacks picker**: Searches hidden files in both file finder and grep
- **Snacks terminal**: `<leader>ft` opens two side-by-side terminals
- **Flutter-tools**: `<leader>F` prefix keymaps (run/restart/quit/debug/devtools/outline), widget guides, closing tags, DAP debugger integration
- **Neotest-dart**: Uses `fvm flutter` as the test command
- **Claude Code**: Terminal on right side (30% width), diffs in vertical split
- **DAP**: Flutter debugging via flutter-tools debugger integration; all keymaps from `dap.core` extra (`<leader>db` breakpoint, `<leader>dc` continue, etc.)
- **Test coverage**: `<leader>tC` load, `<leader>tv` toggle overlay, `<leader>tR` summary (LCOV from `flutter test --coverage`)
- **Reactive.nvim**: Mode-aware cursorline colors (insert=cyan, visual=purple, etc.)
- **Snippet editing**: `<leader>sn` opens snippet file for current filetype

## Options

- Shell: `/bin/zsh`
- `exrc` enabled (project-local config files) -- use `.nvim.lua` in project roots to override keymaps (e.g. Flutter flavor-specific run commands)

## Formatting

Lua files are formatted with **StyLua** (spaces, 2-width indent, 120 column width). Config in `stylua.toml`.

## Colorscheme

Default LazyVim colorscheme (tokyonight), with habamax as fallback during install.

## Primary Language

This config is primarily set up for **Dart/Flutter** development (flutter-tools, neotest-dart, fvm, dart snippets).

## Reference

- [papitz/nvim](https://github.com/papitz/nvim) -- Friend's Neovim config, use as inspiration/reference for ideas and patterns.

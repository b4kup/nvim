# Neovim Configuration

This is a Neovim configuration built on **LazyVim** (v8), managed with **lazy.nvim** as the plugin manager.

## Structure

```
init.lua                  -- Entry point, loads config.lazy
lua/config/
  lazy.lua                -- lazy.nvim bootstrap and plugin setup
  options.lua             -- Custom vim options (shell, exrc)
  keymaps.lua             -- Custom keymaps (currently empty, uses LazyVim defaults)
  autocmds.lua            -- Custom autocmds (currently empty, uses LazyVim defaults)
lua/plugins/
  neo-tree.lua            -- Neo-tree overrides (show hidden/dotfiles/gitignored)
  snacks.lua              -- Snacks picker & terminal overrides
  flutter-tools.lua       -- Flutter-tools eager loading with dressing.nvim
  claudecode.lua          -- Claude Code Neovim integration
  neotest-dart.lua        -- Neotest with Dart adapter (uses fvm flutter)
  example.lua             -- LazyVim example spec (disabled, returns {} early)
snippets/
  dart.json               -- Custom Dart snippets
```

## LazyVim Extras Enabled

Configured in `lazyvim.json`:

- `ai.claudecode` -- Claude Code integration
- `ai.copilot` -- GitHub Copilot
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
- **Flutter-tools**: Loaded eagerly (not lazy) with dressing.nvim
- **Neotest-dart**: Uses `fvm flutter` as the test command
- **Claude Code**: Terminal on right side (30% width), diffs in vertical split

## Options

- Shell: `/bin/zsh`
- `exrc` enabled (project-local config files)

## Formatting

Lua files are formatted with **StyLua** (spaces, 2-width indent, 120 column width). Config in `stylua.toml`.

## Colorscheme

Default LazyVim colorscheme (tokyonight), with habamax as fallback during install.

## Primary Language

This config is primarily set up for **Dart/Flutter** development (flutter-tools, neotest-dart, fvm, dart snippets).

## Reference

- [papitz/nvim](https://github.com/papitz/nvim) -- Friend's Neovim config, use as inspiration/reference for ideas and patterns.

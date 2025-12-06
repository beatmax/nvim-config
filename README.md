# My NvChad-based Neovim config

## Install

See https://nvchad.com/docs/quickstart/install , just use this repo instead of
NvChad/starter.

## Plain NvChad features
```
- <spc>ch  -- cheatsheet
- <spc>fm  -- format code, also in visual mode (conform plugin)
- <spc>th  -- themes
```

See all features: https://nvchad.com/docs/features/

## Plugins and mappings

See [lua/mappings.lua](lua/mappings.lua), cheatsheet (`<spc>ch`) and
`:Telescope keymaps`.

The LSP client sets various keymaps when it starts (`K`, `grn`, `gra`, `grr`,
...), see `:help lsp-defaults` or `:Telescope keymaps` with filter `vim.lsp`.

### Notes on specific plugins

- neotest-gtest: to run tests for the first time, assign them to executables;
open the summary window (<spc>ts), mark directory or source file (m) and run
:ConfigureGtest (TODO: https://github.com/alfaix/neotest-gtest/issues/24)

- py-lsp (and none-ls): install 'python-lsp-server' and 'black', e.g. with
pipx; create ~/.config/black with, for example:
```
[tool.black]
line-length = 120
skip-magic-trailing-comma = true
```

- rustaceanvim: requires 'rust-analyzer' (e.g., `rustup component add
rust-analyzer`); see additional mappins in
[after/ftplugin/rust.lua](after/ftplugin/rust.lua)

- telescope-live-grep-args:
```
  <spc>fw  -- live grep modified to accept arguments
  press `<C-k>` to quote input and add arguments
```

- text-case: besides text case conversion, provides the "Subs" command that can
be used like the default "substitute" command, but the replaced text will keep
the original text case

- vim-lastplace: reopens files at your last edit position

- winresize + submode: `<spc>re` enters resize mode, `h`/`j`/`k`/`l` resize
  current window, `q` or `<esc>` leaves resize mode

## Plain (Neo)Vim tricks
```
  gj / gk  -- move the cursor through wrapped lines
```
## Original NvChad README.md contents

**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

### Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

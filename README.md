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

Plain NvChad mappings: https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua

## Plugins and mappings

See [lua/mappings.lua](lua/mappings.lua) and cheatsheet (`<spc>ch`).

### Notes on specific plugins

- neotest-gtest: to run tests for the first time, assign them to executables;
open the summary window (<spc>ts), mark directory or source file (m) and run
:ConfigureGtest (TODO: https://github.com/alfaix/neotest-gtest/issues/24)

- telescope-live-grep-args:
```
  <spc>fw  -- live grep modified to accept arguments
  press `<C-k>` to quote input and add arguments
```

- vim-lastplace: reopens files at your last edit position

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

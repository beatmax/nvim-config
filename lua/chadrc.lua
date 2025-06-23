-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "palenight",
  transparency = true,

  hl_override = {
    -- fix too dark comments
    Comment = { fg="#999999" },
    ["@comment"] = { fg="#999999" },

    -- improve diff mode
    DiffAdd = { fg="#8197bf" },
    DiffChange = { fg="#c99f4a", bg="#1c1c1c" },
    DiffDelete = { fg="#cf6a4c" },
    DiffText = { fg="#f1c665", bg="#2c2c2c" },
  },
  hl_add = {
    -- same for diffview plugin
    DiffviewDiffAdd = { fg="#8197bf" },
    DiffviewDiffChange = { fg="#c99f4a", bg="#1c1c1c" },
    DiffviewDiffDelete = { fg="#cf6a4c" },
    DiffviewDiffText = { fg="#f1c665", bg="#2c2c2c" },

    -- neogit, workaround for https://github.com/NeogitOrg/neogit/issues/600
    -- (which is fixed, something is missing...)
    NeogitDiffContext = { fg="#818181" },
    NeogitDiffContextHighlight = { fg="#a1a1a1" },
    NeogitDiffContextCursor = { fg="#c1c1c1" },
    NeogitDiffAdd = { fg="#61779f" },
    NeogitDiffAddHighlight = { fg="#8197bf" },
    NeogitDiffAddCursor = { fg="#a1b7df" },
    NeogitDiffDelete = { fg="#af4a2c" },
    NeogitDiffDeleteHighlight = { fg="#cf6a4c" },
    NeogitDiffDeleteCursor = { fg="#ef8a6c" },

    -- workaround for https://github.com/neovim/neovim/issues/9800
    CursorLine = { ctermfg = "White" },
  },
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false
  }
}

return M

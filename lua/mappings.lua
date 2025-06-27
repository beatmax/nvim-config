require "nvchad.mappings"

local map = vim.keymap.set

-- General (no plugin)
map("n", "Zz", "<cmd> qa <CR>", { desc = "General Quit all" })
map("n", "<leader>ts", "<cmd> windo set spell! <CR>", { desc = "General Toggle spell checking (all windows)" })
map("n", "<leader>wr", "<cmd> windo set wrap! <CR>", { desc = "General Toggle wrap (all windows)" })
-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Aerial: A code outline window for skimming and quick navigation
-- https://github.com/stevearc/aerial.nvim
map("n", "<leader>aa", "<cmd> AerialToggle <CR>", { desc = "Aerial Toggle" })
map("n", "<leader>an", "<cmd> AerialNavToggle <CR>", { desc = "Aerial Nav toggle" })
map("n", "<leader>aj", "<cmd> AerialNext <CR>", { desc = "Aerial Next" })
map("n", "<leader>ak", "<cmd> AerialPrev <CR>", { desc = "Aerial Prev" })

-- CMake tools
-- https://github.com/Civitasv/cmake-tools.nvim
map("n", "<leader>cp", "<cmd> CMakeSelectBuildPreset <CR>", { desc = "CMake Select build preset" })
map("n", "<leader>k", function()
  vim.cmd "wa"
  vim.cmd "Trouble quickfix close"
  vim.cmd "CMakeBuild"
end, { desc = "CMake Write all and build" })

-- Emoji picker
-- https://github.com/WilsonOh/emoji_picker-nvim
map("i", "<C-e>", "<cmd> EmojiPicker <CR>", { desc = "Emoji Picker" })

-- Diffview
-- https://github.com/sindrets/diffview.nvim
map("n", "<leader>gd", "<cmd> DiffviewOpen <CR>", { desc = "Diffview open" })
map("n", "<leader>gc", "<cmd> DiffviewClose <CR>", { desc = "Diffview close" })
map("n", "<leader>gh", "<cmd> DiffviewFileHistory <CR>", { desc = "Diffview history" })
map("n", "<leader>gf", "<cmd> DiffviewFileHistory % <CR>", { desc = "Diffview history (current file)" })

-- Gitsigns
-- https://github.com/lewis6991/gitsigns.nvim
map("n", "<leader>gB", "<cmd> Gitsigns blame <CR>", { desc = "Gitsigns Blame" })
map("n", "<leader>gb", "<cmd> Gitsigns blame_line <CR>", { desc = "Gitsigns Blame line" })
map("n", "<leader>gp", "<cmd> Gitsigns preview_hunk <CR>", { desc = "Gitsigns Preview hunk" })
map("n", "<leader>gr", "<cmd> Gitsigns reset_hunk <CR>", { desc = "Gitsigns Reset hunk" })
map("n", "<leader>gS", "<cmd> Gitsigns stage_buffer <CR>", { desc = "Gitsigns Stage buffer" })
map("n", "<leader>gs", "<cmd> Gitsigns stage_hunk <CR>", { desc = "Gitsigns Stage hunk" })
map("n", "<leader>gu", "<cmd> Gitsigns undo_stage_hunk <CR>", { desc = "Gitsigns Undo stage hunk" })
map("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal { "]c", bang = true }
  else
    require("gitsigns").nav_hunk "next"
  end
end, { desc = "Gitsigns Jump to next hunk" })
map("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal { "[c", bang = true }
  else
    require("gitsigns").nav_hunk "prev"
  end
end, { desc = "Gitsigns Jump to prev hunk" })

-- LSP
map("n", "go", "<cmd> LspClangdSwitchSourceHeader <CR>", { desc = "LSP Clangd switch source/header" })

-- Neogit
-- https://github.com/NeogitOrg/neogit
map("n", "<leader>gg", "<cmd> Neogit <CR>", { desc = "Neogit Open" })

-- Telescope
map("n", "<C-b>", "<cmd> Telescope buffers sort_mru=true <CR>", { desc = "Telescope Find buffers (mru)" })
map("n", "<leader>fg", "<cmd> Telescope grep_string <CR>", { desc = "Telescope Search string under cursor" })
map("n", "<leader>fw", "<cmd> Telescope live_grep_args <CR>", { desc = "Telescope Live grep (args)" })
map("n", "<leader>qf", "<cmd> Telescope quickfix <CR>", { desc = "Telescope List quickfix items" })
map("n", "<leader>qh", "<cmd> Telescope quickfixhistory <CR>", { desc = "Telescope List quickfix history" })
map("n", "<leader>ss", "<cmd> Telescope lsp_document_symbols <CR>", { desc = "Telescope LSP document symbols" })
map(
  "n",
  "<leader>sw",
  "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>",
  { desc = "Telescope LSP dynamic workspace symbols" }
)

-- Trouble
-- https://github.com/folke/trouble.nvim
map("n", "<leader>tt", function()
  vim.cmd "cclose"
  vim.cmd "Trouble quickfix toggle"
end, { desc = "Trouble Toggle quickfix list" })

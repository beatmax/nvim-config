require("nvchad.configs.lspconfig").defaults()

-- vim.lsp.config.clangd = {
--   cmd = {
--     "clangd",
--     "--clang-tidy",
--   },
-- }

local servers = { "html", "cssls", "clangd" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

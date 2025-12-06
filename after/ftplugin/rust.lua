local bufnr = vim.api.nvim_get_current_buf()
local map = vim.keymap.set

if vim.g.ft_rust_init_trouble == nil then
  vim.g.ft_rust_init_trouble = true
end

map("n", "<leader>k", function()
  vim.cmd "wa"
  if vim.g.ft_rust_init_trouble then
    vim.cmd "Trouble diagnostics auto_close=true auto_open=true warn_no_results=false"
    vim.g.ft_rust_init_trouble = false
  end
end, { desc = "Rust Write all and open diagnostics" })

map("n", "<leader>rb", function()
  vim.cmd "wa"
  vim.cmd "Cargo build --tests"
end, { desc = "Rust Write all and build" })

map("n", "<leader>rd", function()
  vim.cmd.RustLsp { "renderDiagnostic" }
end, { desc = "Rust Render diagnostic (cycle)", silent = true, buffer = bufnr })

map("n", "<leader>rt", function()
  vim.cmd.RustLsp { "testables", bang = true }
end, { desc = "Rust Run testables (rerun)", silent = true, buffer = bufnr })

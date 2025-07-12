local options = {
  ensure_installed = {
    "codelldb",
  },
  -- see: https://github.com/jay-babu/mason-nvim-dap.nvim?tab=readme-ov-file#handlers-usage-automatic-setup
  -- default configs: https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/configurations.lua
  handlers = {},
  -- handlers = {
  --   function(config)
  --     -- all sources with no handler get passed here
  --     require("mason-nvim-dap").default_setup(config)
  --   end,
  --   codelldb = function(config)
  --     config.configurations = {
  --       {
  --         name = "LLDB: Launch",
  --         type = "codelldb",
  --         request = "launch",
  --         program = function()
  --           return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  --         end,
  --         cwd = "${workspaceFolder}",
  --         stopOnEntry = false,
  --         args = {},
  --       },
  --     }
  --     require("mason-nvim-dap").default_setup(config)
  --   end,
  -- },
}

return options

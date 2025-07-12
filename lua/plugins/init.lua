return {
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "stevearc/aerial.nvim",
    cmd = {
      "AerialToggle",
      "AerialOpen",
      "AerialOpenAll",
      "AerialNavToggle",
      "AerialNavOpen",
      "AerialNext",
      "AerialPrev",
    },
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "Civitasv/cmake-tools.nvim",
    lazy = true,
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
    },
    init = function()
      local loaded = false
      local function check()
        local cwd = vim.uv.cwd()
        if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
          require("lazy").load { plugins = { "cmake-tools.nvim" } }
          loaded = true
        end
      end
      check()
      vim.api.nvim_create_autocmd("DirChanged", {
        callback = function()
          if not loaded then
            check()
          end
        end,
      })
    end,
    opts = {},
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    config = {
      file_history_panel = {
        log_options = {
          git = {
            single_file = {
              diff_merges = "off",
              follow = true,
            },
          },
        },
      },
    },
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "WilsonOh/emoji_picker-nvim",
    cmd = { "EmojiPicker" },
    config = true,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    ft = { "c", "cpp", "rust" },
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
    opts = require "configs.mason-nvim-dap",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional
      "nvim-telescope/telescope.nvim", -- optional
    },
    cmd = "Neogit",
    config = true,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "alfaix/neotest-gtest",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require("neotest-gtest").setup {},
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require "configs.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "configs.dap-ui"
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {
      commented = true,
      virt_text_pos = "eol",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "bash",
        "comment",
        "cpp",
        "python",
        "rust",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    opts = function()
      local conf = require "nvchad.configs.telescope"
      local lga_actions = require "telescope-live-grep-args.actions"
      vim.list_extend(conf.extensions_list, { "live_grep_args" })
      conf.defaults.mappings.i = {
        ["<C-k>"] = lga_actions.quote_prompt(),
        -- TODO: C-i has some other functionality
        -- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        -- freeze the current list and start a fuzzy search in the frozen list
        -- TODO doesn't do anything
        -- ["<C-space>"] = lga_actions.to_fuzzy_refine,
      }
      return conf
    end,
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  {
    -- restore cursor position: https://github.com/neovim/neovim/issues/16339
    -- note: "ethanholz/nvim-lastplace" is buggy and not maintained anymore
    "farmergreg/vim-lastplace",
    lazy = false,
  },
}

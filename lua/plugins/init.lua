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
    "saecki/crates.nvim",
    tag = "stable",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup {
        enable_update_available_warning = false,
        lsp = {
          enabled = true,
          actions = true,
          completion = true,
          hover = true,
        },
      }
    end,
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
    -- NOTE: archived; switch to snacks?
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },
  {
    "allaman/emoji.nvim",
    cmd = { "Emoji" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = true,
  },
  {
    "WilsonOh/emoji_picker-nvim",
    cmd = { "EmojiPicker" },
    config = function()
      require("emoji_picker").setup {
        window = {
          height = 9,
        },
        emoji_list = require "configs.emojis",
      }
    end,
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
          require "rustaceanvim.neotest",
        },
      }
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require "null-ls"
      null_ls.setup {
        sources = {
          -- null_ls.builtins.completion.spell
          -- note: global config: ~/.config/black
          -- null_ls.builtins.formatting.black,
          -- note: workaround to ignore pyproject.toml
          null_ls.builtins.formatting.black.with { extra_args = { "--config", os.getenv "HOME" .. "/.config/black" } },
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
    "HallerPatrick/py_lsp.nvim",
    ft = { "python" },
    opts = {
      language_server = "pylsp",
      -- TODO: "Could not retrieve python path" when opening a python file outside a project
      source_strategies = { "poetry", "default", "system" },
      -- NOTE: for some reason formatting through pylsp isn't working, using null-ls instead
      pylsp_plugins = {
        autopep8 = { enabled = false },
        pyflakes = { enabled = true },
        yapf = { enabled = false },
        black = { enabled = false },
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- avoid breaking changes
    lazy = false, -- this plugin is already lazy
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            checkOnSave = true,
            diagnostics = {
              -- diagnostics only on save
              enable = false,
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = opts
    end,
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
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup {}
      require("telescope").load_extension "textcase"
    end,
    keys = {
      "ga", -- default invocation prefix
      { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
    },
    -- note: not lazy, to be able to use the interactive feature of the `Subs` command right away
    lazy = false,
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
  {
    "pogyomo/winresize.nvim",
    event = "VeryLazy",
    dependencies = {
      "pogyomo/submode.nvim",
    },
    config = function()
      local submode = require "submode"
      local resize = require("winresize").resize
      submode.create("WinResize", {
        mode = "n",
        enter = "<Leader>re",
        leave = { "q", "<ESC>" },
        default = function(register)
          register("h", function()
            resize(0, 2, "left")
          end)
          register("j", function()
            resize(0, 1, "down")
          end)
          register("k", function()
            resize(0, 1, "up")
          end)
          register("l", function()
            resize(0, 2, "right")
          end)
        end,
      })
    end,
  },
}

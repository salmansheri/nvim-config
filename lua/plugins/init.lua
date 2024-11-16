return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "pyright", -- Python language server
      "black",   -- Code formatter
      "isort",   -- Sorts imports
      "flake8",  -- Linter
      "ts_ls",
      "eslint-lsp",
      "prettier",
      "phpactor",
    },
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "python", "javascript", "html", "css", "typescript", "tsx", "rust", "markdown" }, -- Add languages as needed
        highlight = {
          enable = true,                                                                                              -- Enable syntax highlighting
        },
        indent = {
          enable = true, -- Enable indentation based on Treesitter
        },
      }
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescriptreact",
      "typescript",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "echasnovski/mini.nvim",
    version = "*",
    lazy = true,
    config = function()
      require("mini.nvim").setup()
    end,
  },
  {
    "echasnovski/mini.animate",
    version = false,
    config = function()
      require("mini.animate").setup()
    end,
  },
}

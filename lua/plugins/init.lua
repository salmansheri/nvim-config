return {
  {
    "siduck/showkeys",
    cmd = "ShowkeysToggle",
    opt = {
      timeout = 1,
      maxkey = 5,
    },
  },
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
        ensure_installed = {
          "lua",
          "astro",
          "python",
          "javascript",
          "html",
          "css",
          "typescript",
          "tsx",
          "rust",
          "markdown",
          "markdown_inline",
        },               -- Add languages as needed
        highlight = {
          enable = true, -- Enable syntax highlighting
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
      "astro",
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
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },

    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
        {
          name = "work",
          path = "~/vaults/work",
        },
      },

      -- see below for full list of options 👇
    },
    config = function()
      vim.keymap.set("n", "gf", function()
        if require("obsidian").util.cursor_on_markdown_link() then
          return "<cmd>ObsidianFollowLink<CR>"
        else
          return "gf"
        end
      end, { noremap = false, expr = true })
    end,
  },
}

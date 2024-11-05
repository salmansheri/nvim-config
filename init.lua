vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- require("catppuccin").setup {
--   flavour = "mocha", -- latte, frappe, macchiato, mocha
--   background = {     -- :h background
--     light = "latte",
--     dark = "mocha",
--   },
--   transparent_background = true, -- disables setting the background color.
--   show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
--   term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
--   dim_inactive = {
--     enabled = false,             -- dims the background color of inactive window
--     shade = "dark",
--     percentage = 0.15,           -- percentage of the shade to apply to the inactive window
--   },
--   no_italic = false,             -- Force no italic
--   no_bold = false,               -- Force no bold
--   no_underline = false,          -- Force no underline
--   styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
--     comments = { "italic" },     -- Change the style of comments
--     conditionals = { "italic" },
--     loops = {},
--     functions = {},
--     keywords = {},
--     strings = {},
--     variables = {},
--     numbers = {},
--     booleans = {},
--     properties = {},
--     types = {},
--     operators = {},
--     -- miscs = {}, -- Uncomment to turn off hard-coded styles
--   },
--   color_overrides = {},
--   custom_highlights = {},
--   default_integrations = true,
--   integrations = {
--     cmp = true,
--     gitsigns = true,
--     nvimtree = true,
--     treesitter = true,
--     notify = false,
--     mini = {
--       enabled = true,
--       indentscope_color = "",
--     },
--     -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--   },
-- }
--
-- -- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin"
--
require("nvim-tree").setup {
  filters = {
    dotfiles = false,    -- Set to false to show dotfiles
    git_ignored = false, -- You can set this to false if you want to show git-ignored files as well
  },
  view = {
    adaptive_size = true,
    width = 30,
    side = "left",
  },
}

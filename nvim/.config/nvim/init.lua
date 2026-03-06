-- ============================================================================
-- Neovim Configuration
-- ============================================================================

-- ============================================================================
-- Leader Keys
-- ============================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ============================================================================
-- Performance Optimizations
-- ============================================================================
-- Disable Python provider (not using Python remote plugins)
-- This significantly speeds up startup when opening Python files
vim.g.loaded_python3_provider = 0

-- ============================================================================
-- Options
-- ============================================================================
-- UI
vim.opt.termguicolors = true
vim.opt.guicursor = "" -- Always block cursor
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.signcolumn = 'yes'
vim.opt.cc = "80" -- Color column
vim.opt.confirm = true -- Ask to save on quit
vim.opt.scrolloff = 10 -- Keep cursor centered

-- Indentation
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split' -- Preview substitutions

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Timing
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Whitespace display
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Persistent undo
local undodir = vim.fn.stdpath("data") .. "/undodir"
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir
vim.opt.undofile = true

-- Clipboard (delayed for performance)
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- ============================================================================
-- Bootstrap lazy.nvim
-- ============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- Plugin Specifications
-- ============================================================================
require("lazy").setup({
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
  },

  -- Python indentation
  {
    "Vimjas/vim-python-pep8-indent",
    ft = "python",
  },

  -- File Navigation
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    cmd = "Oil",
    keys = { { "-", "<cmd>Oil<CR>", desc = "Open parent directory" } },
    lazy = false,
  },

  -- Mini.nvim modules
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      -- Auto-pairs
      require("mini.pairs").setup({
        modes = { insert = true, command = true, terminal = false },
        skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
        skip_ts = { "string" },
        skip_unbalanced = true,
        markdown = true,
        mappings = {
          ['"'] = false,
          ["'"] = false,
          ['`'] = false,
        },
      })

      -- Indent scope
      require("mini.indentscope").setup({
        symbol = "│",
        options = { try_as_border = true }
      })

      -- Git diff signs
      require("mini.diff").setup({
        view = {
          style = 'sign',
          signs = { add = '+', change = '~', delete = '-' },
        },
      })
    end,
  },

  -- Snacks
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      picker = { enabled = true },
      quickfile = { enabled = true },
    },
    keys = {
      -- Top Pickers & Explorer
      { "<leader>fd", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
    }
  },

  -- Colorschemes
  { "cocopon/iceberg.vim" },
  { "sainnhe/edge", lazy = false, priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "navarasu/onedark.nvim", priority = 1000 },
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },
  { "marko-cerovac/material.nvim", lazy = false, priority = 1000, opts = { disable = { colored_cursor = true } } },
})

-- ============================================================================
-- Colorscheme
-- ============================================================================
vim.g.material_style = "oceanic"
vim.cmd.colorscheme("onedark")

-- ============================================================================
-- Keymaps
-- ============================================================================
-- Basic mappings
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Execute current line" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Execute selection" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Quickfix navigation
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Next quickfix" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Previous quickfix" })

-- ============================================================================
-- Autocommands
-- ============================================================================
-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Enable treesitter highlighting
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable treesitter highlighting',
  group = vim.api.nvim_create_augroup('treesitter-highlight', { clear = true }),
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

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
  -- Colorschemes
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        theme = "dragon",  -- Use Dragon variant for high contrast
        background = {
          dark = "dragon",
          light = "lotus"
        },
      })
      vim.cmd.colorscheme "kanagawa"
    end
  },

  -- LSP & Development
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "folke/lazydev.nvim",
    },
    config = function()
      -- LSP setup
      local lspconfig = require("lspconfig")
      local lsps = { "lua_ls", "pyright", "ruff", "ts_ls" }

      for _, lsp in pairs(lsps) do
        local setup = {
          root_dir = function() return vim.fn.getcwd() end
        }
        lspconfig[lsp].setup(setup)
      end
    end,
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", 
          "javascript", "html", "go", "rust", "python", "cpp", 
          "ocaml", "markdown", "markdown_inline", "ninja", "rst",
        },
        auto_install = false,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true, disable = {"ocaml"} },
        ---@diagnostic disable-next-line: unused-local
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      })
    end,
  },

  -- Completion
  {
    'saghen/blink.cmp',

    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {},
    opts_extend = { "sources.default" }
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

  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
      { "<leader>fd", ":FzfLua files<cr>", desc = "Find files" },
      { "<leader>fg", ":FzfLua live_grep<cr>", desc = "Live grep" },
      { "<leader>fs", ":FzfLua lsp_live_workspace_symbols<cr>", desc = "Workspace symbols" },
      { "<leader>fm", ":FzfLua marks<cr>", desc = "Marks" },
    },
    config = function()
      require("fzf-lua").setup({
        keymap = {
          fzf = {
            ["ctrl-q"] = "select-all+accept",
          },
        },
        grep = { hidden = false },
        files = { hidden = false },
        fzf_colors = {
          ["query"] = { "fg", "Normal" },
        }
      })

      -- Integrate with Trouble
      local config = require("fzf-lua.config")
      local actions = require("trouble.sources.fzf").actions
      config.defaults.actions.files["ctrl-t"] = actions.open
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>a", function() require("harpoon"):list():add() end, desc = "Add to Harpoon" },
      { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu" },
      { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon 1" },
      { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon 2" },
      { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon 3" },
      { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon 4" },
      { "<C-S-P>", function() require("harpoon"):list():prev() end, desc = "Harpoon prev" },
      { "<C-S-N>", function() require("harpoon"):list():next() end, desc = "Harpoon next" },
    },
    config = function()
      require("harpoon"):setup()
    end,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- UI Enhancements
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP (Trouble)" },
    },
    opts = {},
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Window Management
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    keys = {
      { "<C-a>h", function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
      { "<C-a>j", function() require("smart-splits").move_cursor_down() end, desc = "Move to bottom split" },
      { "<C-a>k", function() require("smart-splits").move_cursor_up() end, desc = "Move to top split" },
      { "<C-a>l", function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
    },
    opts = {},
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
      })

      -- Indent scope
      require("mini.indentscope").setup({
        symbol = "│",
        options = { try_as_border = true }
      })
    end,
  },

  -- Dependencies
  { "nvim-lua/plenary.nvim", lazy = true },
})

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

-- LSP
vim.keymap.set("n", "<space>d", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show diagnostics" })

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

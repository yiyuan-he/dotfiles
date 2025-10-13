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
  -- LSP & Development
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "folke/lazydev.nvim",
    },
    config = function()
      local lsps = { "lua_ls", "pyright", "ruff", "ts_ls" }

      for _, lsp in ipairs(lsps) do
        vim.lsp.config(lsp, {})
        vim.lsp.enable(lsp)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          -- Enable completion
          if client.supports_method('textDocument/completion') then
            vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          end
        end,
      })
    end,
  },

  -- Colorscheme
  {
    "shaunsingh/nord.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "nord"
    end
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
    branch = "main",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true, disable = {"ocaml", "python"} },
      })
    end,
  },

  -- Python indentation
  {
    "Vimjas/vim-python-pep8-indent",
    ft = "python",
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
        "default",
        keymap = {
          fzf = {
            ["ctrl-q"] = "select-all+accept",
          },
        },
      })
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
    end,
  },

  -- Colorizer
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
    },
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
      image = { enabled = true },
      gitbrowse = { enabled = true },
    },
    keys = {
      -- LSP
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
      { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    }
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

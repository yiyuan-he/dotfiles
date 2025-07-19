-- Load package manager
require("paq")({
  "savq/paq-nvim",
  "neovim/nvim-lspconfig",
  "nvim-treesitter/nvim-treesitter",
  "stevearc/oil.nvim",
  "stevearc/conform.nvim",
  "craftzdog/solarized-osaka.nvim",
  "lewis6991/gitsigns.nvim",
  "folke/lazydev.nvim",
  "echasnovski/mini.nvim",
  "folke/which-key.nvim",
  "nvim-lua/plenary.nvim",
  { "ThePrimeagen/harpoon", branch = "harpoon2", requires = { {"nvim-lua/plenary.nvim" } } },
  "ibhagwan/fzf-lua",
  { "catppuccin/nvim", as = "catppuccin" },
  "folke/tokyonight.nvim",
  "navarasu/onedark.nvim",
  "folke/zen-mode.nvim",
  "rebelot/kanagawa.nvim",
  "cdmill/neomodern.nvim",
})

vim.o.background = "light"
vim.cmd("colorscheme sunmage")

-- Set up LSP
local lspconfig = require("lspconfig")
local lsps = { "lua_ls", "pyright" }
for _, lsp in pairs(lsps) do
  local setup = {}
  if lsp == "lua_ls" then
    setup = {}
  end

  lspconfig[lsp].setup(setup)
end

vim.keymap.set("n", "<space>d", "<cmd>lua vim.diagnostic.open_float()<CR>")

-- Configure LazyDev
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
---@diagnostic disable-next-line: missing-fields
    require("lazydev").setup({
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    })
  end
})

-- Set up treesitter
---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html",
    "go", "rust", "python", "cpp", "ocaml", "markdown", "markdown_inline",
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

-- Create the undodir if it doesn't exist
local undodir = vim.fn.stdpath("data") .. "/undodir"
-- Create directory if it doesn't exist
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Set cursor to always be block
vim.opt.guicursor = ""

vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.termguicolors = true

-- Use 4 spaces for each indentation
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Set undodir and enable persistent undo
vim.opt.undodir = undodir
vim.opt.undofile = true

-- Enable smart indent -- indent newlines based on context
vim.opt.smartindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor. Keeps things in the middle of the screen.
vim.opt.scrolloff = 10

-- Set color column
vim.opt.cc = "80"

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Set up fzf-lua
-- Send all results to a quickfix list
require("fzf-lua").setup({
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept",
    },
  },
  grep = {
    hidden = false
  },
  files = {
    hidden = false
  },
  -- Make the search query text darker for better visibility with sunmage
  fzf_colors = {
    ["query"] = { "fg", "Normal" },  -- Use Normal fg color which is #4a4a4a in sunmage
  }
})
vim.keymap.set("n", "<leader>fd", ":FzfLua files<cr>")
vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<cr>")

-- Set up oil
require('oil').setup()
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

require("mini.pairs").setup {
  -- In which modes mappings from this `config` should be created
  modes = { insert = true, command = false, terminal = false },

  -- Global mappings. Each right hand side should be a pair information, a
  -- table with at least these fields (see more in |MiniPairs.map|):
  -- - <action> - one of 'open', 'close', 'closeopen'.
  -- - <pair> - two character string for pair to be used.
  -- By default pair is not inserted after `\`, quotes are not recognized by
  -- `<CR>`, `'` does not insert pair after a letter.
  -- Only parts of tables can be tweaked (others will use these defaults).
  mappings = {
    ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
    ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
    ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },

    [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
    [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
    ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

    ['"'] = false,
    ["'"] = false,
    ['`'] = false,
  },
}

-- Set up harpoon
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

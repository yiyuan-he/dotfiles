return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local diagnostics_enabled = false

      local function toggle_diagnostics()
        diagnostics_enabled = not diagnostics_enabled
        if diagnostics_enabled then
          vim.diagnostic.enable(true)
          print("Diagnostics: Enabled")
        else
          vim.diagnostic.enable(false)
          print("Diagnostics: Disabled")
        end
      end

      -- Disable diagnostics at startup
      vim.diagnostic.enable(false)

      vim.keymap.set('n', '<C-`>', toggle_diagnostics, { desc = "Toggle Diagnostics" } )

      require('lspconfig').lua_ls.setup {
        diagnostics = {
          disable = { 'missing-fields' }
        }
      }
      require('lspconfig').jdtls.setup {}
    end,
  }
}

return {
  "neovim/nvim-lspconfig",
  enabled = false,
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    { "williamboman/mason.nvim" },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    if vim.g.have_nerd_font then
      local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
      local diagnostic_signs = {}
      for type, icon in pairs(signs) do
        diagnostic_signs[vim.diagnostic.severity[type]] = icon
      end
      vim.diagnostic.config({ signs = { text = diagnostic_signs } })
    end

    require("mason").setup()
    require("mason-lspconfig").setup()
    require("mason-tool-installer").setup({
      ensure_installed = { "lua_ls", "stylua", "pyright", "black" },
      start_delay = 3000,
      debounce_hours = 5,
      integrations = {
        ["mason-lspconfig"] = true,
      },
    })
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({ capabilities = capabilities })
    lspconfig.pyright.setup({ capabilities = capabilities })
  end,
}

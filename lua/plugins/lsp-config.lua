-- All LSP related config resides here
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
      "seblj/roslyn.nvim",
      ft = "cs",
      opts = {},
    },
  },
  config = function()
    local status_mason, mason = pcall(require, "mason")
    local status_mlsp, mason_lspconfig = pcall(require, "mason-lspconfig")

    if not (status_mason and status_mlsp) then
      print("LSP Dependencies not found. Run :Lazy sync")
      return
    end

    -- 1. Initialize Mason core
    mason.setup()

    -- 2. Define target language servers
    local servers = {
      "lua_ls", "pyright", "ts_ls", "sqlls", "bashls",
      "gopls", "cssls", "html", "lemminx", "graphql"
    }

    mason_lspconfig.setup({
      ensure_installed = servers,
    })

    -- 3. Initialize using modern native Neovim 0.11+ API
    for _, server in ipairs(servers) do
      -- Setup empty base configurations to register the server metadata defaults
      vim.lsp.config(server, {})
      -- Explicitly activate filetype-based hooks for the engine
      vim.lsp.enable(server)
    end
  end,
}

-- All LSP and Tooling related config resides here
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- Add the tool installer dependency
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      "seblj/roslyn.nvim",
      ft = "cs",
      opts = {},
    },
  },
  config = function()
    local status_mason, mason = pcall(require, "mason")
    local status_mlsp, mason_lspconfig = pcall(require, "mason-lspconfig")
    local status_mti, mason_tool_installer = pcall(require, "mason-tool-installer")

    if not (status_mason and status_mlsp and status_mti) then
      print("LSP or Tooling Dependencies not found. Run :Lazy sync")
      return
    end

    -- 1. Initialize Mason core
    mason.setup()

    -- 2. Define target language servers for mason-lspconfig
    local servers = {
      "lua_ls", "pyright", "ts_ls", "sqlls", "bashls",
      "gopls", "cssls", "html", "lemminx", "graphql"
    }

    mason_lspconfig.setup({
      ensure_installed = servers,
    })

    -- 3. Enforce automatic installation of non-LSP tools (linters/formatters)
    mason_tool_installer.setup({
      ensure_installed = {
        "revive", -- Force-installs the Go linter automatically
      },
      auto_update = false,
      run_on_start = true,
    })

    -- 4. Initialize servers using modern native Neovim 0.11+ API
    for _, server in ipairs(servers) do
      -- Setup empty base configurations to register the server metadata defaults
      vim.lsp.config(server, {})
      -- Explicitly activate filetype-based hooks for the engine
      vim.lsp.enable(server)
    end
  end,
}

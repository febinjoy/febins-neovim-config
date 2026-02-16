-- All LSP related config resides here
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local status_mason, mason = pcall(require, "mason")
    local status_mlsp, mason_lspconfig = pcall(require, "mason-lspconfig")
    local status_lspconfig, lspconfig = pcall(require, "lspconfig")

    if not (status_mason and status_mlsp and status_lspconfig) then
      print("LSP Dependencies not found. Run :Lazy sync")
      return
    end

    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls", "pyright", "ts_ls", "sqlls", "bashls",
        "gopls", "cssls", "html", "lemminx", "graphql", "omnisharp"
      },
    })

    -- This is the specific part that keeps failing
    -- We verify the function exists before calling it
    if mason_lspconfig.setup_handlers then
      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({})
        end,
      })
    else
      print("Error: setup_handlers is still nil. Try deleting the plugin folder.")
    end
  end,
}

-- Treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Use pcall to avoid crashing if the module structure changes again
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      -- Fallback: some newer versions use the main module directly
      configs = require("nvim-treesitter")
    end

    configs.setup({
      prefer_git = true,
      auto_install = true,
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      -- It is highly recommended to have these basic parsers
      ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    })
  end,
}

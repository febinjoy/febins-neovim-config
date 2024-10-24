-- For adding the status bar
-- Please refer https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md for themes
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
      },
    })
  end,
}

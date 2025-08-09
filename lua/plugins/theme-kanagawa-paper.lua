-- UI Theme
return {
  "thesimonho/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    undercurl = true,
    transparent = false,
    gutter = false,
    diag_background = true,
    dim_inactive = false,
    terminal_colors = true,
    cache = false,
    styles = {
      comment = { italic = true },
      functions = { italic = false },
      keyword = { italic = false, bold = false },
      statement = { italic = false, bold = false },
      type = { italic = false },
    },
    overrides = function(colors)
      return {
        NeoTreeNormal       = { bg = "none", fg = colors.palette.fujiWhite },
        NeoTreeNormalNC     = { bg = "none", fg = colors.palette.fujiWhite },
        NeoTreeEndOfBuffer  = { bg = "none", fg = "none" },
        NeoTreeWinSeparator = { fg = colors.palette.sumiInk4, bg = "none" },
      }
    end,
  },
  config = function(_, opts)
    require("kanagawa-paper").setup(opts)
    vim.cmd.colorscheme("kanagawa-paper-ink")
  end,
}

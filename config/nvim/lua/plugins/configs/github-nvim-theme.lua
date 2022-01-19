require("github-theme").setup({
  theme_style = "dark_default",
  sidebars = { "terminal", "packer" },
  overrides = function(c)
    return {
      LineNr = { fg = '#484F58' },
      -- Change the color for indent blankline
      NonText = { fg = '#161B22' },
      ColorColumn = { bg = '#161B22' },
      GitSignsAdd = { fg = '#238636' },
      GitSignsChange = { fg = '#8957E5' },
      GitSignsDelete = { fg = '#DA3633' },
    }
  end
})

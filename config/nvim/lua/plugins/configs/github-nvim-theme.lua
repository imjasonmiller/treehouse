require("github-theme").setup({
  theme_style = "dark_default",
  sidebars = { "terminal", "packer" },
  overrides = function(c)
    return {
      LineNr = { fg = c.bg_visual },
      NonText = { fg = c.bg_visual },
      ColorColumn = { bg = c.bg_visual },
    }
  end
})

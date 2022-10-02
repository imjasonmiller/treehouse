require("telescope").setup({
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
})
require("telescope").load_extension("file_browser")
require("telescope").load_extension("ui-select")

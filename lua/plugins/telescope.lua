return {
  require("telescope").setup({
    defaults = {
      file_ignore_patterns = {
        "node_modules",
        ".next",
        ".git",
      },
    },
  })
}

return {
  "nvim-telescope/telescope.nvim",
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          ".next",
          ".git",
        },
      },
    })
  end,

  keys = function()
    return {
      { "<leader>pf", "<cmd>Telescope find_files<cr>" },
      { "<leader>ps", function()
        local search = vim.fn.input("Grep > ")
        if search ~= "" then
          require("telescope.builtin").grep_string({ search = search })
        end
      end, }, }
  end,
}

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "isak102/telescope-git-file-history.nvim",
      dependencies = { "tpope/vim-fugitive" },
    },
  },
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
      { "<leader>pf", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      {
        "<leader>ps",
        function()
          local search = vim.fn.input("Grep > ")
          if search ~= "" then
            require("telescope.builtin").grep_string({ search = search })
          end
        end,
        desc = "Grep Search",
      },
      { "<leader>pg", "<cmd>Telescope git_file_history<CR>", desc = "Git File History" },
    }
  end,
}

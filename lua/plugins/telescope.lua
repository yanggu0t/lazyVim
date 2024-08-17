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
        -- "<leader>ps",
        --   require("telescope.builtin").grep_string({
        --     prompt_title = "Grep Search (Exact Match)",
        --     search = "",
        --     use_regex = false,
        --     word_match = "-w",
        --     only_sort_text = true,
        --     search_dirs = { vim.fn.getcwd() },
        --     additional_args = function(args)
        --       return vim.list_extend(args, {
        --         "--hidden",
        --         "--glob",
        --         "!**/.git/*",
        --         "--fixed-strings", -- 模糊搜尋
        --       })
        --     end,
        --   })
        -- end,
        -- desc = "Direct Grep Search with Exact Matching",
      },
      { "<leader>pg", "<cmd>Telescope git_file_history<CR>", desc = "Git File History" },
    }
  end,
}

-- 将此代码放在 ~/.config/nvim/lua/plugins/treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "tsx" },
      sync_install = true,
      auto_install = true,
      highlight = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>v",
          node_incremental = "<leader>v",
          node_decremental = "<leader>V",
        },
      },
    })

    -- 简单的调试函数
    vim.api.nvim_create_user_command("TSCheck", function()
      print(
        "Treesitter incremental selection enabled: "
          .. tostring(require("nvim-treesitter.configs").get_module("incremental_selection").enable)
      )
    end, {})
  end,
}

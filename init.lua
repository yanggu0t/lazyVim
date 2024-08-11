-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- LuaSnip configuration
local luasnip = require("luasnip")

-- Load custom snippets
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

-- Set up filetype associations
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascriptreact", "typescriptreact" },
  callback = function()
    luasnip.filetype_extend("javascriptreact", { "react" })
    luasnip.filetype_extend("typescriptreact", { "react" })
  end,
})

-- Optional: Set up keybinding to expand or jump in snippets
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

-- ignore custom in telescope
require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".next",
      ".git",
    },
  },
})

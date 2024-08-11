-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local luasnip = require("luasnip")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascriptreact", "typescriptreact" },
  callback = function()
    luasnip.filetype_extend("javascriptreact", { "react" })
    luasnip.filetype_extend("typescriptreact", { "react" })
  end,
})

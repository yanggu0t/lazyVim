-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Load custom snippets
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

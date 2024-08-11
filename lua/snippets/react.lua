local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

local function file_name_to_component_name()
  local file_name = vim.fn.expand("%:t:r")
  return (file_name:gsub("^%l", string.upper):gsub("_%l", string.upper):gsub("_", ""))
end

ls.add_snippets("react", {
  s("rface", {
    t("import React from 'react'"),
    t({ "", "", "const " }),
    f(file_name_to_component_name),
    t(" = () => {"),
    t({ "", "  return (" }),
    t({ "", "    <div></div>" }),
    t({ "", "    " }),
    t({ "", "  )" }),
    t({ "", "}" }),
    t({ "", "", "export default " }),
    f(file_name_to_component_name),
  }),
})

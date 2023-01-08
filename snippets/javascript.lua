local status_ok, ls = pcall(require, "luasnip")

if not status_ok then
    print("luasnip package not loaded")
    return
end

local s, i, t = ls.s, ls.i, ls.t
local d, c, f, sn = ls.dynamic_node, ls.choice_node, ls.function_node, ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local myJsSnippet = s("auto.", { t("That is awesome") })
table.insert(autosnippets, myJsSnippet)

return snippets, autosnippets

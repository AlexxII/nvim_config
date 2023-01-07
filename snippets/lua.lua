local status_ok, ls = pcall(require, "luasnip")

if not status_ok then
	print("luasnip package not loaded")
	return
end

local s = ls.s
local i = ls.i
local t = ls.t

local fmt = require("luasnip.extras.fmt").fmt

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local snippets, autosnippets = {}, {}


local myFirstSnippet = s("myFirstSnippet", {
	t("Hi This {} is my firt {}snippet"),
	i(1, "placeholder_text_1"),
	i(2, "placeholder_text_2"),
})
table.insert(snippets, myFirstSnippet)

local mySecondSnippet = s("mySecondSnippet", fmt([[
local {} = function({})
{}
end
]], {
	i(1, ""),
	i(2, ""),
	i(3, ""),
}))

table.insert(snippets, mySecondSnippet)

return snippets, autosnippets

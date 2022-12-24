local status_ok, ls = pcall(require, "luasnip")

if not status_ok then
	print("luasnip package not loaded")
	return
end

local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local snippets, autosnippets = {}, {}

local myFirstSnippet = s("myFirstSnippet", {
	t("Hi This is my firt snippet"),
	i(1, "placeholder_text"),
})
table.insert(snippets, myFirstSnippet)

return snippets, autosnippets

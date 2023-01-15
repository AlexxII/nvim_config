local status_ok, ls = pcall(require, "luasnip")

if not status_ok then
    print("luasnip package not loaded")
    return
end

local s, i, t = ls.s, ls.i, ls.t
local d, c, f, sn = ls.dynamic_node, ls.choice_node, ls.function_node, ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}


local myFirstSnippet = s("myFirstSnippet", {
    t("Hi This {} is my firt {}snippet"),
    i(1, "placeholder_text_1"),
    i(2, "placeholder_text_2"),
})
table.insert(snippets, myFirstSnippet)

local mySecondSnippet = s({ trig = "mySecondSnippet", regTrig = true, hidden = true }, fmt([[
local {} = function({})
    {}
end
]], {
    i(1, "myVar"),
    c(2, { t(""), t("myArg") }),
    i(3, "-- TODO: something"),
}))

table.insert(snippets, mySecondSnippet)

local myFirstAutoSnippet = s("auto-", { t("This was auto trigged") })
table.insert(autosnippets, myFirstAutoSnippet)

local mySecondAutoSnippet = s(
    { trig = "digit%d%d", regTrig = true },
    { t("This was $1 auto trigger") }
)
table.insert(autosnippets, mySecondAutoSnippet)

local myThirdAutoSnippet = s(
    { trig = "sin(%d)(%d)", regTrig = true },
    {
        f(function(_, snip)
            return snip.captures[1] .. " and "
        end),
        f(function(_, snip)
            return snip.captures[2]
        end)
    }
)
table.insert(autosnippets, myThirdAutoSnippet)


-- End Refactoring --

return snippets, autosnippets

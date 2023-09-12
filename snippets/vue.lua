local status_ok, ls = pcall(require, "luasnip")

if not status_ok then
  print("luasnip package not loaded")
end

local s, i, t = ls.s, ls.i, ls.t
local d, c, f, sn = ls.dynamic_node, ls.choice_node, ls.function_node, ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local myVueSnippet = s("auto,", { t("That is super awesome") })
table.insert(autosnippets, myVueSnippet)

-- vue template compositon API
local vsetup = s("vsetup", fmt([[
    <script setup lang="ts">
    import {{ ref }} from 'vue'
    {}

    </script>

    <template>
      <div>
        {}
      </div>
    </template>
    ]], {
  i(1, ''),
  i(2, '')
}))
table.insert(snippets, vsetup)


local ref = s("ref", fmt([[
    const {} = ref({})
    ]], {
  i(1, ''),
  i(2, '')
}))
table.insert(snippets, ref)


local style = s("style", fmt([[
    <style scoped>
      {}
    </style>
]], {
  i(1, '')
}))



return snippets, autosnippets

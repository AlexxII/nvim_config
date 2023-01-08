local status_ok, ls = pcall(require, 'luasnip')

if not status_ok then
    print("luasnip package not loaded")
    return
end

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

ls.config.set_config({
    history = true,
    updateevents = "TextChanged, TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        [require("luasnip.util.types").choiceNode] = {
            active = {
                virt_text = { { "*", "GruveboxOrange" } },
            },
        },
    },
})

-- Key Maps
vim.keymap.set({ "i", "s" }, "<a-p>", function()
    if ls.expand_or_jumpable() then
        ls.expand()
    end
end)

vim.keymap.set({ "i", "s" }, "<a-k>", function()
    if ls.jumpable(1) then
        ls.jump()
    end
end)

vim.keymap.set({ "i", "s" }, "<a-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end)

vim.keymap.set({ "i", "s" }, "<a-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

vim.keymap.set({ "i", "s" }, "<a-h>", function()
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end)

--vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])
--vim.keymap.set("n", "<leader><CR>", "<cmd>LuaSnipEdit<cr>", { silent = true, noremap = true })
--vim.cmd([[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> /--End Refactoring -- <CR>O<Esc>O]])

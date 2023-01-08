local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    print("cmp plugin not loaded")
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    print("luasnip plugin not loaded")
    return
end

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- TODO: need to understand what is this!!
require("luasnip/loaders/from_vscode").lazy_load()

--local check_backspace = function()
--	local col = vim.fn.col "." - 1
--	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
--end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    enable = function()
        local context = require 'cmp.config.context'
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
        end
    end,
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    --	formatting = {
    --		fields = { "kind", "abbr", "menu" },
    --		format = function(entry, vim_item)
    --			vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
    --			--			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
    --			vim_item.menu = ({
    --				nvim_lsp = "[lsp]",
    --				luasnip = "[snippet]",
    --				buffer = "[buffer]",
    --				path = "[path]"
    --			})[entry.source.name]
    --			return vim_item
    --		end
    --	},
    sources = {
        { name = 'nvim_lsp', max_item_count = 6 },
        { name = 'luasnip' },
        { name = 'buffer', max_item_count = 6 },
        { name = 'path' },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
})

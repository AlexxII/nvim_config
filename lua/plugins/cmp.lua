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

-- TODO: need to understand what is this!!
require("luasnip/loaders/from_vscode").lazy_load()

--local check_backspace = function()
--	local col = vim.fn.col "." - 1
--	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
--end

local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

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
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]"
			})[entry.source.name]
			return vim_item
		end
	},
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

local status_ok, ts = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	print("treestter plugin not loaded")
	return
end

ts.setup {
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"lua",
		"typescript",
		"javascript",
		"json",
		"tsx",
		"css",
		"html"
	},

	auto_install = true,

	autotag = {
		enable = true,
	},
	additional_vim_regex_highlighting = false
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

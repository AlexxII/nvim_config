require('base/search')
require('base/tabs')
require('base/other')

require('keys/main')

require('plugins/plugins')
require('plugins/cmp')
require('plugins/lsp')

--vim.cmd "colorscheme slate" -- Goood default colorscheme
require('base/colorscheme')

--vim.api.nvim_create_autocmd(
--	{ "TextChangedI", "TextChangedP" },
--	{
--		callback = function()
--			local line = vim.api.nvim_get_current_line()
--			local cursor = vim.api.nvim_win_get_cursor(0)[2]
--			local current = string.sub(line, cursor, cursor + 1)
--			local count = current
--			print(count)
--			print(line)
--		end
--	}
--)
-- TODO - something work not fine. While open new file.
--vim.cmd(
--	[[
--	au BufWinLeave * silent mkview
--	au BufWinEnter * silent loadview
--]]
--)

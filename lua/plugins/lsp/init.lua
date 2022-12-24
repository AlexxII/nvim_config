local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
	print("lspconfig module not loaded")
	return
end

local status_ok_mason, mason = pcall(require, "mason")
local status_ok_masonconfig, mason_config = pcall(require, "mason-lspconfig")
if not status_ok_mason then
	print("mason packege not loaded")
	return
end

if not status_ok_masonconfig then
	print("mason-config package not loaded")
	return
end
mason.setup()
mason_config.setup()

------
-- Show diagnostic in window
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold, CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function() vim.lsp.buf.format() end
		})
	end
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts_ = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = 'rounded',
				source = 'always',
				prefix = ' ',
				scope = 'cursor',
			}
			vim.diagnostic.open_float(nil, opts_)
		end
	})
end

Capabilities = {}
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	print("cmp-nvim-lsp package not loaded")
else
	Capabilities = cmp_nvim_lsp.default_capabilities(
		vim.lsp.protocol.make_client_capabilities()
	)
end

nvim_lsp.sumneko_lua.setup {
	on_attach = on_attach,
	capabilities = Capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false
			},
		},
	},
}

nvim_lsp.tsserver.setup {
	on_attach = on_attach,
	--	root_dir = function() return vim.loop.cwd() end, -- load TS for all files
	filetype = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
}


vim.diagnostic.config({
	virtual_text = {
		prefix = ""
	},
	update_in_insert = true,
	float = {
		source = "always",
	},
})

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	print("cmp plugin not loaded")
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	print("luasnip plugin not loaded")
	return
end

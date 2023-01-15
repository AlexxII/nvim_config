vim.scriptencoding = 'utf-8'

local opt = vim.opt

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.splitright = true
opt.splitbelow = true
opt.clipboard = 'unnamedplus'
opt.fixeol = false
opt.completeopt = 'menuone,noselect'

vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.signcolumn = "yes" -- show the sign colomn to reduce shift the text each time
opt.cursorline = true
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.termguicolors = true


--vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

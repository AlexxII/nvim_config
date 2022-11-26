local opt = vim.opt

opt.splitright = true
opt.splitbelow = true
opt.clipboard = 'unnamedplus'
opt.fixeol = false
opt.completeopt = 'menuone,noselect'

vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

opt.number = true
opt.relativenumber = false
opt.numberwidth = 2
opt.signcolumn = "yes" 									-- show the sign colomn to reduce shift the text each time
opt.cursorline = true

opt.termguicolors = true

--[[--
opt.backup = false
opt.cmdheight = 2
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.pumheight = 10
opt.showmode = false
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.timeoutlen = 1000
opt.undofile = true
opt.updatetime = 300
opt.writebackup = false
opt.relativenumber = false

opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

--]]--

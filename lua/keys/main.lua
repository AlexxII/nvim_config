local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- HardMode
-- keymap("n", "h", "<nop>", opts)
-- keymap("n", "j", "<nop>", opts)
-- keymap("n", "l", "<nop>", opts)
-- keymap("n", "k", "<nop>", opts)
keymap("n", "<up>", "<nop>", opts)
keymap("n", "<down>", "<nop>", opts)
keymap("n", "<left>", "<nop>", opts)
keymap("n", "<right>", "<nop>", opts)

keymap("i", "jk", "<esc>", opts)

keymap("n", "<c-up>", ":resize -2<cr>", opts)
keymap("n", "<c-down>", ":resize +2<cr>", opts)
keymap("n", "<c-left>", ":vertical resize -2<cr>", opts)
keymap("n", "<c-right>", ":vertical resize +2<cr>", opts)

-- Good movements
keymap("n", "<c-d>", "<c-d>zz", opts)
keymap("n", "<c-u>", "<c-u>zz", opts)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


-- go defenition test
--keymap("n", "gD", ":only<bar>vsplit<CR>gd", opts)
--keymap("n", "gD", "<C-w><C-]>", opts)
keymap("n", "gD", "<C-w><C-]><C-w><S-l>", opts)


-- netrw keymap
-- keymap("n", "<leader>e", ":Lexplore %:p:h<CR>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle <CR>", opts)

-- oil.nvim
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

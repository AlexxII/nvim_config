require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "images",
      'target'
    }
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      -- hijack_netrw = true,
    }
  }
}
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>pb', '<cmd>Telescope buffers<CR>', {})


-- vim.keymap.set('n', '<leader>pv', builtin.find_files, {})

require("telescope").load_extension "file_browser"

local M = {}

local tthemes = require('telescope.themes')

function M.find_views()
  local project_dir = vim.fn.getcwd()
  local needDir = '/src/views'
  if vim.fn.isdirectory(project_dir .. needDir) == 0 then
    print('Ooops! Views dir not found! Check CWD!!')
    return
  end
  print('VIEWS')
  require('telescope.builtin').find_files({
    shorten_path = false,
    cwd = project_dir .. needDir,
    height = 10,

    layout_strategy = 'horizontal',
    layout_options = {
      preview_width = 0.75
    }
  })
end

function M.find_components()
  local project_dir = vim.fn.getcwd()
  local needDir = '/src/components'
  if vim.fn.isdirectory(project_dir .. needDir) == 0 then
    print('Ooops! Components dir not found! Check CWD!!')
    return
  end
  print('COMPONENTS')
  require('telescope.builtin').find_files {
    shorten_path = false,
    cwd = project_dir .. needDir,
    height = 10,

    layout_strategy = 'horizontal',
    layout_options = {
      preview_width = 0.75
    }
  }
end

vim.keymap.set('n', '<leader>pv', M.find_views, {})
vim.keymap.set('n', '<leader>pc', M.find_components, {})

return M

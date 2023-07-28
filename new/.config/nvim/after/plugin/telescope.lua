local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") } )
end)

-- builtin.command_history({opts})          *telescope.builtin.command_history()*
-- builtin.quickfix({opts})                        *telescope.builtin.quickfix()*
-- actions.send_selected_to_qflist({prompt_bufnr}) *telescope.actions.send_selected_to_qflist()*

vim.keymap.set('n', '<leader><leader>qfo', builtin.quickfix, {})
-- vim.keymap.set('n', '<leader>qfs', actions.send_selected_to_qflist, {})
vim.keymap.set('n', '<leader>qfs', function()
    actions.send_selected_to_qflist({} )
end)

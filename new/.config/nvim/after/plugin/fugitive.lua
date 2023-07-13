vim.keymap.set("n", "<leader>ts", vim.cmd.Git)

-- " these are native to vim
-- " using :diffget shortcuts
-- " dp keep change in current buffer 'put change'
-- " do keep change in other buffer 'get change'
-- " they accept a count 
vim.keymap.set("n", "<leader>tl", "<cmd>diffget //3<CR> ]c")
vim.keymap.set("n", "<leader>th", "<cmd>diffget //2<CR> ]c")
vim.keymap.set("n", "<leader>tc", "<cmd>Git commit<CR>")
vim.keymap.set("n", "<leader>tk", "<cmd>Git checkout<CR>")
vim.keymap.set("n", "<leader>tw", "<cmd>Gwrite<CR>")
vim.keymap.set("n", "<leader>tP", "<cmd>Git -p push<CR>")
vim.keymap.set("n", "<leader>tp", "<cmd>Git -p pull<CR>")


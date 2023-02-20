vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 1
--
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zR" })
--vim.api.nvim_create_autocmd({ "BufWrite" }, { pattern = { "*" }, command = "normal zX" })

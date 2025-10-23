vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.o.mouse = "a"
vim.wo.relativenumber = true
vim.opt.number = true

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.fillchars = { vert = " " }
vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE", fg = "NONE" })

vim.o.wrap = false

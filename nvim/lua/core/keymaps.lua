local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Toggle Nvim-tree
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Clipboard
keymap("v", "<Leader>y", '"+y', opts)

-- Telescope
keymap("n", "<Leader>fg", ":tabnew<CR>:Telescope live_grep<CR>", opts)
keymap("n", "<Leader>ff", ":tabnew<CR>:Telescope find_files<CR>", opts)

-- Tabs
keymap("n", "<S-Right>", ":tabnext<CR>", opts)
keymap("n", "<S-Left>", ":tabprevious<CR>", opts)
keymap("n", "<Leader>tc", ":tabclose<CR>", opts)

-- Save and quit
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<Leader>Q", ":qa!<CR>", opts)


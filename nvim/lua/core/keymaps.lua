local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Toggle Nvim-tree
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Clipboard
keymap("v", "<Leader>y", '"+y', opts)

-- Telescope
keymap("n", "<Leader>fg", ":enew<CR>:Telescope live_grep<CR>", opts)
keymap("n", "<Leader>ff", ":enew<CR>:Telescope find_files<CR>", opts)

-- Tabs
keymap("n", "<S-Right>", ":BufferLineCycleNext<CR>", opts)  -- Move to next buffer
keymap("n", "<S-Left>", ":BufferLineCyclePrev<CR>", opts)   -- Move to previous buffer

-- Close Current Buffer
keymap("n", "<Leader>tc", ":bdelete<CR>", opts)  -- Close buffer instead of tab
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
-- Save and quit
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<Leader>Q", ":qa!<CR>", opts)

-- Open new tab and class, function, variable definition
keymap("n", "<C-]>", ":vsplit<CR>g<C-]>", opts)



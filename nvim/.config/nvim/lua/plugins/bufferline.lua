return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                diagnostics = "nvim_lsp", -- Show LSP diagnostics in the buffer line
                separator_style = "thick", -- Other options: "thin", "padded_slant"
                show_buffer_close_icons = true,
                show_close_icon = false,
                always_show_bufferline = true,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true
                    }
                }
            }
        })
    end
}

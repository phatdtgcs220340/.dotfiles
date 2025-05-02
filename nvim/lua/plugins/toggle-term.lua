return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")
        toggleterm.setup({
            open_mapping = [[<c-\>]],
            direction = 'float',
            float_opts = {
                border = "shadow",
                winblend = 10
            },
        })
    end
}

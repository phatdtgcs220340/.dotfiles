return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")
        toggleterm.setup({
            -- Default terminal behavior (for <c-\>)
            open_mapping = [[<c-\>]],
            direction = 'float',  -- Horizontal direction for <c-\>
        })
    end
}


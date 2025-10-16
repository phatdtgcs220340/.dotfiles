return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup({
            exclude = {
                buftypes = { "terminal", "nofile" },
                filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" }
            },
            scope = {
                enabled = false,
                show_start = false,
                show_end = false,
            },
        })
    end
}

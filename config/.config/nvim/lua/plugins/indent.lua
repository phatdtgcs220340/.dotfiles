return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup({
            exclude = {
                buftypes = { "terminal", "nofile", "quickfix", "prompt" },
                filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "lspinfo", "mason", "packer", "checkhealth", "man", "gitcommit", "TelescopePrompt", "TelescopeResults", "" },
            },

            scope = {
                enabled = false,
                show_start = false,
                show_end = false,
            },
        })
    end
}

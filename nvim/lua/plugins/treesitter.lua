return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "javascript", "java", "tsx", "json", "html", "css", "typescript" },
            highlight = { enable = true },
        })
    end,
}


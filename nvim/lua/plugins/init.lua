return {
    { "nvim-tree/nvim-web-devicons" },
    { "morhetz/gruvbox" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
    {
        "nvim-java/nvim-java",
        config = function()
            require("java").setup()
        end
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end
    },
    { "windwp/nvim-autopairs" },
}

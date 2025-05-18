return {
    { "nvim-tree/nvim-web-devicons" },
    { "morhetz/gruvbox" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end
    },
    { "windwp/nvim-autopairs" },
}

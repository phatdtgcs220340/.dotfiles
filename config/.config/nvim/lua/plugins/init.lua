return {
    { "nvim-tree/nvim-web-devicons" },
    { "saadparwaiz1/cmp_luasnip" },
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
    },
    { "rafamadriz/friendly-snippets" },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end
    },
    { "windwp/nvim-autopairs" },
}

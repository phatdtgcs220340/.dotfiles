return {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-lualine/lualine.nvim" },
    { "folke/tokyonight.nvim" },
    { "morhetz/gruvbox" },
    { import = "plugins.lsp" },
    { import = "plugins.nvimtree" },
    { import = "plugins.telescope" },
    { import = "plugins.cmp" },
    { import = "plugins.treesitter" },
    { import = "plugins.kanagawa" },
    { import = "plugins.render-markdown" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    {
        "nvim-java/nvim-java",
        config = function()
            require("java").setup()
            require("lspconfig").jdtls.setup({})
        end
    },
    {
        "windwp/nvim-ts-autotag",
        config = function ()
            require("nvim-ts-autotag").setup()
        end
    },
    { "windwp/nvim-autopairs" },
}


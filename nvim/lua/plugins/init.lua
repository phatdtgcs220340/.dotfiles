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
    { import = "plugins.jetbrain-theme" },
    { import = "plugins.live-preview" },
    { import = "plugins.toggle-term" },
    { import = "plugins.null-ls" },
    { import = "plugins.bufferline" },
    { import = "plugins.dap-config" },
    { import = "plugins.comment" },
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
        config = function()
            require("nvim-ts-autotag").setup()
        end
    },
    { "windwp/nvim-autopairs" },
}

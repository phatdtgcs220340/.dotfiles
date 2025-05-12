return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            respect_buf_cwd = true,
            view = {
                width = 40,
                side = "left",
                float = {
                    enable = false,
                    open_win_config = {
                        border = "none",
                    },
                },
            },
            update_focused_file = {
                enable = true,
                update_cwd = true
            },
            filters = {
                custom = { ".git", "node_modules", "target", "out" },
                dotfiles = false
            },
        })
    end
}

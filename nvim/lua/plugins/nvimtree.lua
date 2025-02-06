return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            respect_buf_cwd = true,
            view = {
                width = 50,
                side = "left",
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


return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = { "target/", "node_modules/", ".git/" }
            },
            pickers = {
                find_files = {
                    hidden = true,
                    find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" }
                }
            }
        })
    end
}


return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            theme = 'hyper',
            config = {
                week_header = {
                    enable = true,
                },
                project = {
                    enable = true,
                },
                mru = {
                    enable = false
                }
            }
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
